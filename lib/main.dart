import 'package:flutter/material.dart';
import 'package:two_dos/screens/addNewItem.dart';
import 'package:two_dos/widgets/listCard.dart';
import 'constants/constants.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Two-Dos",
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.indigo,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
            iconTheme: IconThemeData(color: Colors.indigo),
            textTheme: TextTheme(
                headline6: TextStyle(
              color: Colors.indigo,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ))),
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  static const List<String> choices = <String>["View", "Settings", "About"];

  void contextMenuAction(String choice) {
    if (choice == contextMenuItems.clear) {
      print("Clear button pressed");
    } else if (choice == contextMenuItems.settings) {
      print("Settings button pressed");
    } else if (choice == contextMenuItems.about) {
      print("About button pressed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: StadiumBorder(),
        tooltip: "Add new item",
        elevation: 10,
        backgroundColor: Colors.indigo,
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddNewItem()));
        },
        child: Icon(
          Icons.add,
          size: 30,
        ),
      ),
      appBar: AppBar(
        toolbarHeight: 80,
        title: Text("Todo List"),
        actions: [
          PopupMenuButton(
              onSelected: contextMenuAction,
              itemBuilder: (BuildContext context) {
                return contextMenuItems.choices.map((String choice) {
                  return PopupMenuItem<String>(
                      value: choice, child: Text(choice));
                }).toList();
              }),
        ],
      ),
      body: Container(
        child:
            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Center(
            //         child: Text(
            //       "Your todo list is empty!",
            //       style:
            //           TextStyle(color: Theme.of(context).primaryColor, fontSize: 20),
            //     )),
            //     Center(
            //         child: Padding(
            //       padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 25),
            //       child: Text(
            //         "Add a new todo item by clicking the (+) button below",
            //         textAlign: TextAlign.center,
            //         style: TextStyle(
            //           color: Theme.of(context).primaryColor,
            //           fontSize: 20,
            //         ),
            //       ),
            //     )),
            //   ],
            // )
            ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return ListCard();
                }),
      ),
    );
  }
}
