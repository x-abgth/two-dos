import 'package:flutter/material.dart';
import 'package:two_dos/presentation/screens/about_screen/widgets/developer_info.dart';
import 'package:two_dos/presentation/screens/about_screen/widgets/todoApp_info.dart';

class AboutScreen extends StatelessWidget {
  final String title;
  const AboutScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        toolbarHeight: 80,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.chevron_left,
              size: 30, color: Theme.of(context).backgroundColor),
        ),
      ),
      body: Column(
        children: [
          TodoAppInfo(),
          Developernfo(),
        ],
      ),
    );
  }
}
