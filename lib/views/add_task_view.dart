import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todaydo/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen(this.addTaskeCallBack);
  final Function addTaskeCallBack;
  String? nweTextTitel;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                color: Colors.indigo[400],
                fontWeight: FontWeight.bold,
              )),
          TextField(
            autofocus: true,
            textAlign: TextAlign.center,
            onChanged: (newText) {
              nweTextTitel = newText;
            },
          ),
        const  SizedBox(height: 30),
          TextButton(
            onPressed: () {
              Provider.of<TaskData>(context , listen: false).addTask(nweTextTitel!);
              Navigator.pop(context);
            },
            child:  Text('Add'),
            style: TextButton.styleFrom(
              backgroundColor: Colors.teal[400],
              primary: Colors.white,
            ),
          ),
        ],
      ),
    );
    ;
  }
}
