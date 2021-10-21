import 'package:flutter/material.dart';
import 'package:two_dos/core/constants/strings.dart';

class EmptyListTemplate extends StatelessWidget {
  const EmptyListTemplate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
            child: Text(
          "Your todo list is empty!",
          style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 20),
        )),
        Center(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 25),
          child: Text(
            Strings.homeScreenEmptyMsg,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 20,
            ),
          ),
        )),
      ],
    );
  }
}
