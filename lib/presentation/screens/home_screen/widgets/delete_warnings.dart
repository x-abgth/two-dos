import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class DeleteWarnings {
  void confirmDeletePopUp({required BuildContext context}) {
    if (Hive.box('todo_item').isNotEmpty) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Are you sure?"),
              content: Text(
                  "Do you realy want to delete these records? This process cannot be undone."),
              actions: [
                TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text("Cancel")),
                SizedBox(width: 20),
                TextButton(
                    onPressed: () {
                      Hive.box('todo_item').clear();
                      Navigator.of(context).pop();
                    },
                    child: Text("Confirm")),
              ],
            );
          });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Your todo list is already empty, bruhh")));
    }
  }

  Future<bool?> confirmDeleteItem({required BuildContext context}) async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirm"),
          content: const Text(
              "Are you sure you wish to permanently delete this item?"),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text("Cancel"),
            ),
            SizedBox(width: 20),
            TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text("Confirm")),
          ],
        );
      },
    );
  }
}
