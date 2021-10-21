import 'package:flutter/material.dart';

class DeveloperSign extends StatelessWidget {
  const DeveloperSign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Text(
        "ABGTH",
        style: TextStyle(
          color: Theme.of(context).backgroundColor.withOpacity(0.2),
          fontSize: 18,
        ),
      ),
    );
  }
}
