import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:two_dos/data/models/db/todo_db_model.dart';
import 'package:two_dos/logic/cubit/date_picker/date_picker_cubit.dart';
import 'package:two_dos/logic/cubit/theme_picker/theme_picker_cubit.dart';

class AddItemDetails extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController subjectController;
  final bool isUpdating;
  final int? index;

  AddItemDetails(
      {Key? key,
      required this.titleController,
      required this.subjectController,
      this.isUpdating = false,
      this.index})
      : super(key: key);

  final itemsBox = Hive.box('todo_item');

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height - 250,
      padding: EdgeInsets.all(10),
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          buildTextField(
            label: "Title",
            controller: titleController,
          ),
          buildTextField(
            label: "Subject",
            lines: 5,
            words: 150,
            controller: subjectController,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                Text(
                  "Due date : ",
                  style: TextStyle(
                    color: Colors.indigo,
                    fontSize: 16,
                  ),
                ),
                Spacer(),
                Text(
                  isUpdating
                      ? initDate(context: context)
                      : context.select((DatePickerCubit datePickerCubit) =>
                          datePickerCubit.state.date.toString()),
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  TextFormField buildTextField(
      {required String label,
      int lines = 2,
      int words = 50,
      required TextEditingController controller}) {
    return TextFormField(
      controller: controller,
      cursorColor: Colors.indigo,
      cursorHeight: 22,
      maxLines: lines,
      style: TextStyle(
          fontWeight: lines == 2 ? FontWeight.bold : FontWeight.normal),
      inputFormatters: [LengthLimitingTextInputFormatter(words)],
      decoration: InputDecoration(
        hintText: label,
        hintStyle: TextStyle(color: Colors.grey[500]),
        border: OutlineInputBorder(borderSide: BorderSide.none),
      ),
    );
  }

  initDate({required BuildContext context}) {
    final _item = itemsBox.getAt(index ?? 0) as TodoDb;

    if (isUpdating == true) {
      if (context.select((DatePickerCubit datePickerCubit) =>
              datePickerCubit.state.date.toString()) ==
          "") {
        context.read<DatePickerCubit>().pickDate(_item.date);
        context.read<ThemePickerCubit>().seclectColor(_item.themeIndex);
      }

      return context.select((DatePickerCubit datePickerCubit) =>
          datePickerCubit.state.date.toString());
    }
  }
}
