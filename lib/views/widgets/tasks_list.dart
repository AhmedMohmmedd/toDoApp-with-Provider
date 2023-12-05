import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todaydo/models/task.dart';
import 'package:todaydo/models/task_data.dart';
import 'package:todaydo/views/widgets/list_tile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemCount: taskData.tasks.length,
          itemBuilder: (context, index) {
            return SizedBox(
              height: 40,
              child: TaskTile(
                taskTitel: taskData.tasks[index].name,
                ischeakBox: taskData.tasks[index].isDone,
                cheakBoxChange: (newValue) {
                  taskData.updateTask(taskData.tasks[index]);
                },
                listTileDelete: () {
                  taskData.deleteTask(taskData.tasks[index]);
                },
              ),
            );
          },
        );
      },
    );
  }
}
