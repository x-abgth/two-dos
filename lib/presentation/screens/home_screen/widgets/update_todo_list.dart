import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:sizer/sizer.dart';

import 'package:two_dos/core/constants/colors.dart';
import 'package:two_dos/data/models/db/todo_db_model.dart';
import 'package:two_dos/logic/cubit/date_picker/date_picker_cubit.dart';
import 'package:two_dos/logic/cubit/theme_picker/theme_picker_cubit.dart';
import 'package:two_dos/presentation/screens/shared/add_item_details.dart';
import 'package:two_dos/presentation/screens/shared/bottom_toggle_buttons.dart';

class UpdateTodoList extends StatefulWidget {
  final TodoDb item;
  final int index;

  UpdateTodoList({Key? key, required this.item, required this.index})
      : super(key: key);

  @override
  State<UpdateTodoList> createState() =>
      _UpdateTodoListState(index: index, item: item);
}

class _UpdateTodoListState extends State<UpdateTodoList> {
  late TextEditingController titleController;
  late TextEditingController subjectController;
  final TodoDb item;
  final int index;
  _UpdateTodoListState({required this.item, required this.index});

  @override
  void initState() {
    titleController = TextEditingController(text: item.title);
    subjectController = TextEditingController(text: item.subject);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      children: [
        Container(
          height:
              SizerUtil.orientation == Orientation.landscape ? 95.0.w : 95.0.h,
          width: SizerUtil.orientation == Orientation.landscape
              ? 100.0.h
              : 100.0.w,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              Row(
                children: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text(
                      "Cancel",
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            color: item.themeIndex < 0
                                ? Theme.of(context).primaryColor
                                : cardColor[item.themeIndex],
                            fontSize: 13.sp,
                          ),
                    ),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {
                      if (titleController.text != "") {
                        final updatedItem = TodoDb(
                          title: titleController.text,
                          subject: subjectController.text,
                          date: context
                              .read<DatePickerCubit>()
                              .state
                              .date
                              .toString(),
                          themeIndex: context
                              .read<ThemePickerCubit>()
                              .state
                              .selectedThemeIndex,
                        );
                        updateDb(updatedItem);
                      }
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "Done",
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            color: item.themeIndex < 0
                                ? Theme.of(context).primaryColor
                                : cardColor[item.themeIndex],
                            fontSize: 13.sp,
                          ),
                    ),
                  )
                ],
              ),
              AddItemDetails(
                titleController: titleController,
                subjectController: subjectController,
                isUpdating: true,
                index: index,
              ),
              SizedBox(
                  height: SizerUtil.orientation == Orientation.landscape
                      ? 7.0.w
                      : 7.0.w),
              BottomToggleButtons(),
            ],
          ),
        ),
      ],
    );
  }

  void updateDb(TodoDb item) async {
    final todoBox = Hive.box('todo_item');
    await todoBox.putAt(index, item);
  }
}
