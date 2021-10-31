import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

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
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
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
            height: SizerUtil.orientation == Orientation.portrait ? 20.h : 18.h,
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
                    size: SizerUtil.deviceType == DeviceType.tablet
                        ? 3.5.h
                        : 7.5.w,
                  ),
                ),
                Expanded(
                    child: Padding(
                  padding: SizerUtil.deviceType == DeviceType.tablet
                      ? EdgeInsets.symmetric(horizontal: 3.0.w, vertical: 0.5.h)
                      : const EdgeInsets.all(0),
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
                          fontSize: SizerUtil.deviceType == DeviceType.tablet
                              ? 9.5.sp
                              : 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        item.subject,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: item.themeIndex < 0
                              ? Colors.black87
                              : Colors.white,
                          fontSize: SizerUtil.deviceType == DeviceType.tablet
                              ? 7.5.sp
                              : 9.sp,
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
                                  size:
                                      SizerUtil.deviceType == DeviceType.tablet
                                          ? 1.5.h
                                          : 2.h,
                                )
                              : SizedBox(),
                          SizedBox(width: 10),
                          Text(
                            item.date,
                            style: TextStyle(
                              color: item.themeIndex < 0
                                  ? Colors.black
                                  : Colors.white,
                              fontSize:
                                  SizerUtil.deviceType == DeviceType.tablet
                                      ? 6.5.sp
                                      : 10.sp,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )),
                Icon(
                  Icons.chevron_right,
                  color: item.themeIndex < 0 ? Colors.black45 : Colors.white54,
                  size: SizerUtil.deviceType == DeviceType.tablet
                      ? 6.5.h
                      : 16.5.w,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
