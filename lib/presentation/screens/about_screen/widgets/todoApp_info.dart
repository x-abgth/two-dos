import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TodoAppInfo extends StatelessWidget {
  const TodoAppInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "What is a TODO app ?",
            style: Theme.of(context).textTheme.headline6!.copyWith(
                fontSize:
                    SizerUtil.deviceType == DeviceType.tablet ? 10.sp : 18.sp),
          ),
          SizedBox(height: 10),
          Text(
            "A todo list is a list of tasks you need to complete, or things that you want to do. Most typically, they're organised in order of priority. Traditionally, they're written on a piece of paper or post it notes and acts as a memory aid. "
            '''
              
A todo app is like starter application that most developers do in their beginner levels.
             ''',
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize:
                    SizerUtil.deviceType == DeviceType.tablet ? 7.5.sp : 13.sp,
                fontWeight: FontWeight.normal),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
