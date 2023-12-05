import 'package:flutter/material.dart';
import 'package:todaydo/views/add_task_view.dart';
import 'package:todaydo/views/widgets/tasks_list.dart';
import 'package:todaydo/models/task.dart';

class TaskView extends StatefulWidget {
  const TaskView({super.key});

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  List<Task> tasks = [
    Task(name: 'life gose on'),
    Task(name: 'shutt the hull up'),
    Task(name: 'take it easy'),
  ];

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
                child: AddTaskScreen((newTaskTitel) {
                  setState(() {
                    tasks.add(Task(name: newTaskTitel));
                    Navigator.pop(context);
                  });
                }),
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
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Text(
              '${tasks.length} Tasks',
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
                child: TasksList(tasks),
              ),
            )
          ],
        ),
      ),
    );
  }
}
