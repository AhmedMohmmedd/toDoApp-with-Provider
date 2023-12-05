import 'package:flutter/material.dart';
import 'package:todaydo/models/task.dart';
import 'package:todaydo/views/widgets/list_tile.dart';

class TasksList extends StatefulWidget {
  const TasksList(
   this.tasks
  );
final List<Task> tasks;
  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.tasks.length,
      itemBuilder: (context, index) {
        return SizedBox(
          height: 40,
          child: TaskTile(
            taskTitel: widget.tasks[index].name,
            ischeakBox: widget.tasks[index].isDone,
            cheakBoxChange: (newValue) {
              setState(() {
                widget.tasks[index].doneChange();
              });
            },
          ),
        );
      },
    );
  }
}
