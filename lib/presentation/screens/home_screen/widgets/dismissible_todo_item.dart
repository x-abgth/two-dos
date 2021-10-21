import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:two_dos/data/models/db/todo_db_model.dart';
import 'package:two_dos/presentation/screens/home_screen/widgets/delete_warnings.dart';

import 'list_card_widget.dart';

class DismissibleTodoItem extends StatelessWidget {
  const DismissibleTodoItem({
    Key? key,
    required TodoDb item,
    required Box itemsBox,
    required int index,
  })  : _item = item,
        _itemsBox = itemsBox,
        index = index,
        super(key: key);

  final TodoDb _item;
  final Box _itemsBox;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey<TodoDb>(_item),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        _itemsBox.deleteAt(index);
      },
      confirmDismiss: (DismissDirection direction) async {
        return DeleteWarnings().confirmDeleteItem(context: context);
      },
      background: Container(
        alignment: AlignmentDirectional.centerEnd,
        color: Colors.transparent,
        child: Padding(
          padding: EdgeInsets.only(right: 20.0),
          child: Icon(
            Icons.delete,
            color: Color(0xFFF44336),
            size: 35,
          ),
        ),
      ),
      child: ListCard(
        index: index,
        item: _item,
      ),
    );
  }
}
