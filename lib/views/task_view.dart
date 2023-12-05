import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todaydo/models/task_data.dart';
import 'package:todaydo/views/add_task_view.dart';
import 'package:todaydo/views/widgets/tasks_list.dart';
import 'package:todaydo/models/task.dart';

class TaskView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: AddTaskScreen((newTaskTitel) {}),
              ),
            ),
          );
        },
        backgroundColor: Color.fromARGB(255, 28, 104, 85),
        child: Icon(Icons.add),
      ),
      backgroundColor: Colors.teal[400],
      body: Padding(
        padding: const EdgeInsets.only(
          top: 60,
          left: 20,
          right: 20,
          bottom: 50,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(
                  Icons.playlist_add_check,
                  size: 40,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'ToDayDo',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Text(
              '${Provider.of<TaskData>(context).tasks.length} tasks',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
                child: TasksList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
