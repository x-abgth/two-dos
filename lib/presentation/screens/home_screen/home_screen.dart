import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:sizer/sizer.dart';

import 'package:two_dos/data/models/db/todo_db_model.dart';
import 'package:two_dos/presentation/screens/home_screen/widgets/delete_warnings.dart';
import 'package:two_dos/presentation/screens/home_screen/widgets/empty_list_template.dart';
import 'widgets/dismissible_todo_item.dart';
import '../../../core/constants/menu_items.dart';

class TodoListScreen extends StatelessWidget {
  final String title;

  TodoListScreen({Key? key, required this.title}) : super(key: key);

  static const List<String> choices = <String>["View", "About"];

  final _itemsBox = Hive.box('todo_item');

  @override
  Widget build(BuildContext context) {
    void contextMenuAction(String choice) {
      if (choice == ContextMenuItems.clear) {
        DeleteWarnings().confirmDeletePopUp(context: context);
      } else if (choice == ContextMenuItems.about) {
        Navigator.of(context).pushNamed('about');
      }
    }

    return Scaffold(
      floatingActionButton: addNewItem(context),
      appBar: AppBar(
        toolbarHeight: 10.h,
        title: Text(
          title,
          style: TextStyle(
              fontSize: 20.sp, color: Theme.of(context).backgroundColor),
        ),
        actions: [
          PopupMenuButton(
              iconSize: 4.h,
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
            ? EmptyListTemplate()
            : ReorderableListView.builder(
                physics: BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  final _item = _itemsBox.getAt(index) as TodoDb;

                  return DismissibleTodoItem(
                    key: ValueKey<TodoDb>(_item),
                    item: _item,
                    itemsBox: _itemsBox,
                    index: index,
                  );
                },
                itemCount: _itemsBox.length,
                onReorder: (int oldIndex, int newIndex) {
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

  Widget addNewItem(BuildContext context) {
    return Container(
      width: 8.h,
      height: 8.h,
      child: RawMaterialButton(
        fillColor: Theme.of(context).primaryColor,
        shape: CircleBorder(),
        elevation: 10.0,
        child: Icon(
          Icons.add,
          color: Theme.of(context).backgroundColor,
          size: 4.h,
        ),
        onPressed: () {
          Navigator.of(context).pushNamed('second');
        },
      ),
    );
  }
}
