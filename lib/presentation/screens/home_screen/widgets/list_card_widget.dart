import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_dos/data/models/db/todo_db_model.dart';
import 'package:two_dos/logic/cubit/date_picker/date_picker_cubit.dart';
import 'package:two_dos/logic/cubit/theme_picker/theme_picker_cubit.dart';
import 'package:two_dos/presentation/screens/home_screen/widgets/update_todo_list.dart';

import '../../../../core/constants/colors.dart';

class ListCard extends StatelessWidget {
  final int index;
  final TodoDb item;

  ListCard({required this.index, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Material(
        elevation: 10,
        color: item.themeIndex < 0 ? Colors.white : cardColor[item.themeIndex],
        borderRadius: BorderRadius.circular(15),
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          splashColor: Colors.redAccent.withOpacity(0.5),
          onTap: () {
            context.read<DatePickerCubit>().pickDate(date: "");
            context.read<ThemePickerCubit>().seclectColor(-1);
            showModalBottomSheet(
                isScrollControlled: true,
                isDismissible: false,
                backgroundColor: Colors.transparent,
                context: context,
                builder: (context) {
                  return UpdateTodoList(
                    item: item,
                    index: index,
                  );
                });
          },
          child: Container(
            height: 150,
            padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Icon(
                    Icons.drag_indicator_outlined,
                    color:
                        item.themeIndex < 0 ? Colors.black45 : Colors.white54,
                    size: 25,
                  ),
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color:
                            item.themeIndex < 0 ? Colors.black : Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      item.subject,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color:
                            item.themeIndex < 0 ? Colors.black87 : Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        item.date != ""
                            ? Icon(
                                Icons.alarm,
                                color: item.themeIndex < 0
                                    ? Colors.black
                                    : Colors.white,
                                size: 16,
                              )
                            : SizedBox(),
                        SizedBox(width: 10),
                        Text(
                          item.date,
                          style: TextStyle(
                              color: item.themeIndex < 0
                                  ? Colors.black
                                  : Colors.white),
                        )
                      ],
                    )
                  ],
                )),
                Icon(
                  Icons.chevron_right,
                  color: item.themeIndex < 0 ? Colors.black45 : Colors.white54,
                  size: 60,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
