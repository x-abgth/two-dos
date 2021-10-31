import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TitleUnderlineAnimation extends StatefulWidget {
  const TitleUnderlineAnimation({Key? key}) : super(key: key);

  @override
  State<TitleUnderlineAnimation> createState() =>
      _TitleUnderlineAnimationState();
}

class _TitleUnderlineAnimationState extends State<TitleUnderlineAnimation> {
  AnimationController? animationController;

  @override
  Widget build(BuildContext context) {
    final orientation = SizerUtil.orientation == Orientation.portrait;
    return BounceInLeft(
      controller: (controller) => animationController = controller,
      manualTrigger: true,
      child: Divider(
        thickness: 2,
        color: Theme.of(context).backgroundColor,
        indent: orientation ? 20.w : 30.h,
        endIndent: orientation ? 20.w : 30.h,
      ),
    );
  }
}
