import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:two_dos/data/models/db/todo_db_model.dart';
import 'package:two_dos/logic/cubit/date_picker/date_picker_cubit.dart';
import 'package:two_dos/logic/cubit/theme_picker/theme_picker_cubit.dart';
import 'package:two_dos/presentation/screens/shared/add_item_details.dart';
import 'package:two_dos/presentation/screens/shared/bottom_toggle_buttons.dart';

class AddNewItem extends StatefulWidget {
  final String title;
  AddNewItem({Key? key, required this.title});
  @override
  _AddNewItemState createState() => _AddNewItemState();
}

class _AddNewItemState extends State<AddNewItem> {
  TextEditingController titleFieldController = TextEditingController();
  TextEditingController subjectFieldController = TextEditingController();
  bool colorPicked = false;

  @override
  void initState() {
    context.read<DatePickerCubit>().pickDate("");
    context.read<ThemePickerCubit>().seclectColor(-1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarWidget(context),
      body: Stack(
        children: [
          AddItemDetails(
            titleController: titleFieldController,
            subjectController: subjectFieldController,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: BottomToggleButtons(),
          )
        ],
      ),
    );
  }

  AppBar _appBarWidget(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).backgroundColor,
      foregroundColor: Theme.of(context).primaryColor,
      toolbarHeight: 80,
      title: Text(widget.title),
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(Icons.chevron_left,
            size: 25, color: Theme.of(context).primaryColor),
      ),
      actions: [
        TextButton(
            onPressed: () {
              final newItem = TodoDb(
                title: titleFieldController.text,
                subject: subjectFieldController.text,
                date: context.read<DatePickerCubit>().state.date.toString(),
                themeIndex:
                    context.read<ThemePickerCubit>().state.selectedThemeIndex,
              );
              addItem(newItem);
              Navigator.of(context).pop();
            },
            child: Text(
              "DONE",
              style: TextStyle(color: Theme.of(context).primaryColor),
            ))
      ],
    );
  }

  void addItem(TodoDb item) {
    final todoBox = Hive.box('todo_item');
    todoBox.add(item);
  }

  @override
  void dispose() {
    titleFieldController.dispose();
    subjectFieldController.dispose();
    super.dispose();
  }
}
