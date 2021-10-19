import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      color: Theme.of(context).backgroundColor,
      width: MediaQuery.of(context).size.width,
      height: 100,
      alignment: Alignment.center,
      child: ToggleButtons(
        color: Colors.grey,
        selectedColor: Colors.indigo,
        borderRadius: BorderRadius.circular(10),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.date_range_outlined),
                Text("Add due date"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.colorize_outlined),
                Text("Add theme"),
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
            context.read<DatePickerCubit>().pickDate("");
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
        context.read<DatePickerCubit>().pickDate(_selectedDate);
      });
    } else if (picked == null) {
      setState(() {
        _isSelected[0] = false;
        context.read<DatePickerCubit>().pickDate("");
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
        ),
        content: Container(
          width: MediaQuery.of(context).size.width,
          child: Wrap(
            children: [
              for (int i = 0; i < 8; i++)
                GestureDetector(
                  onTap: () {
                    context.read<ThemePickerCubit>().seclectColor(i);
                  },
                  child: context
                              .watch<ThemePickerCubit>()
                              .state
                              .selectedThemeIndex >=
                          0
                      ? ColorCircle(
                          color: cardColor[i],
                          isSelected: context
                                      .watch<ThemePickerCubit>()
                                      .state
                                      .selectedThemeIndex ==
                                  i
                              ? true
                              : false,
                        )
                      : ColorCircle(
                          color: cardColor[i],
                          isSelected: context
                                      .watch<ThemePickerCubit>()
                                      .state
                                      .selectedThemeIndex ==
                                  i
                              ? true
                              : false,
                        ),
                ),
            ],
          ),
        ),
        actions: [
          TextButton(
              onPressed: () {
                if (context.read<ThemePickerCubit>().state.selectedThemeIndex ==
                    -1) {
                  setState(() {
                    _isSelected[1] = false;
                  });
                }
                Navigator.pop(context);
              },
              child: Text(
                "OK",
                style: TextStyle(color: Theme.of(context).primaryColor),
              ))
        ],
      ),
    );
  }
}

// TODO: use hive database to store datas
