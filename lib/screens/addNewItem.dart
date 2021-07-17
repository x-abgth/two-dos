import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:two_dos/widgets/bottomToggleButtons.dart';

class AddNewItem extends StatefulWidget {
  @override
  _AddNewItemState createState() => _AddNewItemState();
}

class _AddNewItemState extends State<AddNewItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Text("Add a todo"),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.chevron_left, size: 25),
        ),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "DONE",
                style: TextStyle(color: Colors.indigo),
              ))
        ],
      ),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                buildTextField(label: "Title"),
                buildTextField(label: "Subject", lines: 5, words: 150),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    children: [
                      Text(
                        "Due date : ",
                        style: TextStyle(
                          color: Colors.indigo,
                          fontSize: 16,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "date",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(bottom: 0, left: 0, child: BottomToggleButtons())
        ],
      ),
    );
  }

  TextField buildTextField(
      {required String label, int lines = 2, int words = 50}) {
    return TextField(
      cursorColor: Colors.indigo,
      cursorHeight: 22,
      maxLines: lines,
      style: TextStyle(
          fontWeight: lines == 2 ? FontWeight.bold : FontWeight.normal),
      inputFormatters: [LengthLimitingTextInputFormatter(words)],
      decoration: InputDecoration(
        hintText: label,
        hintStyle: TextStyle(color: Colors.grey[500]),
        border: OutlineInputBorder(borderSide: BorderSide.none),
      ),
    );
  }
}
