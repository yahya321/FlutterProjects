import 'package:flutter/material.dart';
import 'package:login_todo_database/models/task_model.dart';

class TaskItem extends StatelessWidget {
  Task task;
  TaskItem(this.task);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Dismissible(
      key: ObjectKey(task),
      onDismissed: (direction) {},
      child: Card(
        child: ListTile(
          title: Text(task.title),
          trailing: Checkbox(
            value: task.isComplete,
            onChanged: (value) {},
          ),
        ),
      ),
    );
  }
}
