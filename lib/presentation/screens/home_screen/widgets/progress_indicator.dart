import 'package:flutter/material.dart';

class ProgressIndiactor extends StatelessWidget {
  const ProgressIndiactor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
