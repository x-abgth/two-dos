import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import 'package:two_dos/logic/cubit/date_picker/date_picker_cubit.dart';
import 'package:two_dos/logic/cubit/theme_picker/theme_picker_cubit.dart';
import 'package:two_dos/presentation/screens/shared/color_circle.dart';
import '../../../core/constants/colors.dart';

class BottomToggleButtons extends StatefulWidget {
  @override
  _BottomToggleButtonsState createState() => _BottomToggleButtonsState();
}

class _BottomToggleButtonsState extends State<BottomToggleButtons> {
  final _isSelected = <bool>[false, false];
  var _selectedDate;
  bool colorPicked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizerUtil.orientation == Orientation.landscape ? 60.0.h : 90.w,
      height: 10.0.h,
      alignment: Alignment.center,
      child: ToggleButtons(
        color: Colors.grey,
        selectedColor: Colors.indigo,
        borderRadius: BorderRadius.circular(10),
        children: [
          Padding(
            padding: EdgeInsets.all(3.h),
            child: Row(
              children: [
                Icon(
                  Icons.date_range_outlined,
                  size: 3.h,
                ),
                Text("Add due date", style: TextStyle(fontSize: 12.sp)),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(3.h),
            child: Row(
              children: [
                Icon(
                  Icons.colorize_outlined,
                  size: 3.h,
                ),
                Text("Add theme", style: TextStyle(fontSize: 12.sp)),
              ],
            ),
          ),
        ],
        onPressed: (index) {
          setState(() {
            _isSelected[index] = !_isSelected[index];
          });
          if (index == 0 && _isSelected[index] == true) {
            return _datePicker(context: context);
          } else if (index == 0 && _isSelected[index] == false) {
            context.read<DatePickerCubit>().pickDate(date: "");
          } else if (index == 1 && _isSelected[index] == true) {
            return openThemeBox();
          } else if (index == 1 && _isSelected[index] == false) {
            context.read<ThemePickerCubit>().seclectColor(-1);
          }
        },
        isSelected: _isSelected,
      ),
    );
  }

// First toggle button functions
  bool selectDateRange(DateTime dateTime) {
    if (dateTime.isAfter(DateTime.now().subtract(Duration(days: 1)))) {
      return true;
    }
    return false;
  }

  _datePicker({required BuildContext context}) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime(2030),
        selectableDayPredicate: selectDateRange,
        builder: (context, child) {
          return Theme(
              data: ThemeData.light().copyWith(
                colorScheme: ColorScheme.light(primary: Colors.indigo),
                buttonTheme: ButtonThemeData(
                  textTheme: ButtonTextTheme.primary,
                ),
              ),
              child: child!);
        });

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = formatDate(picked, [dd, '/', mm, '/', yyyy]);
        context.read<DatePickerCubit>().pickDate(date: _selectedDate);
      });
    } else if (picked == null) {
      setState(() {
        _isSelected[0] = false;
        context.read<DatePickerCubit>().pickDate(date: "");
      });
    }
  }

// Second toggle button functions
  openThemeBox() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text(
          "Select a theme",
          style: TextStyle(fontSize: 10.sp),
        ),
        content: Container(
          width: 50.h,
          child: Wrap(
            children: [
              for (int i = 0; i < 8; i++)
                GestureDetector(
                    onTap: () {
                      context.read<ThemePickerCubit>().seclectColor(i);
                    },
                    child: ColorCircle(
                      color: cardColor[i],
                      isSelected: context
                                  .watch<ThemePickerCubit>()
                                  .state
                                  .selectedThemeIndex ==
                              i
                          ? true
                          : false,
                    )),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: SizerUtil.deviceType == DeviceType.tablet
                ? EdgeInsets.all(1.5.h)
                : const EdgeInsets.all(0),
            child: TextButton(
                onPressed: () {
                  if (context
                          .read<ThemePickerCubit>()
                          .state
                          .selectedThemeIndex ==
                      -1) {
                    setState(() {
                      _isSelected[1] = false;
                    });
                  }
                  Navigator.pop(context);
                },
                child: Text(
                  "OK",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor, fontSize: 10.sp),
                )),
          )
        ],
      ),
    );
  }
}
