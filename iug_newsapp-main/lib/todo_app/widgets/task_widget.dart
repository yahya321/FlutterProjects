import 'package:flutter/material.dart';
import 'package:state_managment/todo_app/models/task_model.dart';

class TaskWidget extends StatelessWidget {
  Function changeFun;
  Function deleteFun;
  Task task;
  TaskWidget(this.task, this.changeFun, this.deleteFun);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: task.isCompleted ? Colors.green : Colors.black45,
          borderRadius: BorderRadius.circular(15)),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      child: CheckboxListTile(
        title: Text(task.title),
        value: task.isCompleted,
        onChanged: (v) {
          changeFun(task);
        },
        secondary: ElevatedButton.icon(
          onPressed: (() {
            deleteFun(task);
          }),
          icon: Icon(Icons.delete, color: Colors.red),
          label: Text("Delete"),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
          ),
        ),
      ),
    );
  }
}
