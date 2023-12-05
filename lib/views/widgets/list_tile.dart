import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool ischeakBox;
  final String taskTitel;
  final void Function(bool?) cheakBoxChange;
  const TaskTile({required this.ischeakBox, required this.taskTitel, required this.cheakBoxChange});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitel,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          decoration: ischeakBox ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.teal[400],
        value: ischeakBox,
        onChanged: cheakBoxChange,
      ),
    );
  }
}
