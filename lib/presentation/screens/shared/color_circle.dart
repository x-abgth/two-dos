import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ColorCircle extends StatelessWidget {
  final Color color;
  final bool isSelected;
  ColorCircle({this.color = const Color(0xFFFFFFFF), this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizerUtil.deviceType == DeviceType.tablet ? 5.h : 10.w,
      width: SizerUtil.deviceType == DeviceType.tablet ? 5.h : 10.w,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: EdgeInsets.all(
          SizerUtil.deviceType == DeviceType.tablet ? 1.w : 0.6.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: isSelected ? Colors.grey.shade400 : Colors.transparent,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: color,
        ),
      ),
    );
  }
}
