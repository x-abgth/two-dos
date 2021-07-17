import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

class BottomToggleButtons extends StatefulWidget {
  @override
  _BottomToggleButtonsState createState() => _BottomToggleButtonsState();
}

class _BottomToggleButtonsState extends State<BottomToggleButtons> {
  final _isSelected = <bool>[false, false, false];
  var _selectedDate;
  bool _isDateSelected = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
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
                Icon(Icons.alarm_add_outlined),
                Text("Add reminder"),
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
          }
        },
        isSelected: _isSelected,
      ),
    );
  }

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
        _isDateSelected = true;
        _selectedDate = formatDate(picked, [dd, '/', mm, '/', yyyy]);
      });
    }
  }
}
