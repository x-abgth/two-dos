import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:two_dos/core/constants/strings.dart';
import 'package:two_dos/data/models/db/todo_db_model.dart';
import 'widgets/list_card_widget.dart';
import '../../../core/constants/menu_items.dart';

class TodoListScreen extends StatelessWidget {
  final String title;

  TodoListScreen({Key? key, required this.title}) : super(key: key);

  static const List<String> choices = <String>["View", "Settings", "About"];

  final _itemsBox = Hive.box('todo_item');
  void contextMenuAction(String choice) {
    if (choice == ContextMenuItems.clear) {
      Hive.box('todo_item').clear();
    } else if (choice == ContextMenuItems.settings) {
      print("Settings button pressed");
    } else if (choice == ContextMenuItems.about) {
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
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          Navigator.of(context).pushNamed('second');
        },
        child: Icon(
          Icons.add,
          color: Theme.of(context).backgroundColor,
          size: 30,
        ),
      ),
      appBar: AppBar(
        toolbarHeight: 80,
        title: Text(title),
        actions: [
          PopupMenuButton(
              onSelected: contextMenuAction,
              itemBuilder: (BuildContext context) {
                return ContextMenuItems.choices.map((String choice) {
                  return PopupMenuItem<String>(
                      value: choice, child: Text(choice));
                }).toList();
              }),
        ],
      ),
      body: Container(
        child: _itemsBox.length < 1
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                      child: Text(
                    "Your todo list is empty!",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor, fontSize: 20),
                  )),
                  Center(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 25),
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
              )
            : ReorderableListView.builder(
                physics: BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  final _item = _itemsBox.getAt(index) as TodoDb;

                  return Dismissible(
                    key: ValueKey(_item),
                    onDismissed: (direction) {
                      _itemsBox.deleteAt(index);
                    },
                    child: ListCard(
                      index: index,
                      item: _item,
                    ),
                  );
                },
                itemCount: _itemsBox.length,
                onReorder: (int oldIndex, int newIndex) {
                  // final _item = _itemsBox.getAt(oldIndex);
                  if (oldIndex < newIndex) {
                    newIndex -= 1;
                  }
                  // this is required, before you modified your box;
                  final oldItem = _itemsBox.getAt(oldIndex);
                  final newItem = _itemsBox.getAt(newIndex);

                  // here you just swap this box item, oldIndex <> newIndex
                  _itemsBox.putAt(oldIndex, newItem);
                  _itemsBox.putAt(newIndex, oldItem);
                }),
      ),
    );
  }
}
