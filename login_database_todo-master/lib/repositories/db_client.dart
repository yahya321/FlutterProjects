import 'dart:io';

import 'package:login_todo_database/models/task_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBClient {
  DBClient._();
  static final DBClient dbClient = DBClient._();
  final String taskTableName = 'tasks';
  final String taskTiltleColumn = 'taskTitle';
  final String taskIdColumn = 'taskId';
  final String taskIsCompleteColumn = 'taskComplete';

  Database database;
  initDatabase() async {
    if (database == null) {
      database = await connectToDatabase();
      return database;
    } else {
      return database;
    }
  }

  Future<Database> connectToDatabase() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String path = join(appDocDir.path, 'tasksDb.db');
    Database database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute('''CREATE TABLE $taskTableName(
          $taskIdColumn INTEGER PRIMARY KEY AUTOINCREMENT,
          $taskTiltleColumn TEXT NOT NULL,
          $taskIsCompleteColumn INTEGER NOT NULL
        )''');
      },
    );
    return database;
  }

  Future<int> insertNewTask(Map<String, dynamic> map) async {
    try {
      database = await initDatabase();
      int rowIndex = await database.insert(taskTableName, map);
      return rowIndex;
    } catch (error) {
      throw 'database error $error';
    }
  }

  Future<List<Map<String, dynamic>>> getAllTasks() async {
    try {
      database = await initDatabase();
      List<Map<String, dynamic>> results = await database.query(taskTableName);
      return results;
    } catch (error) {
      throw 'database error $error';
    }
  }

  Future<List<Map<String, dynamic>>> getCompleteTasks() async {
    try {
      database = await initDatabase();
      List<Map<String, dynamic>> results = await database.query(taskTableName,
          where: '$taskIsCompleteColumn = ?', whereArgs: [1]);
      return results;
    } catch (error) {
      throw 'database error $error';
    }
  }

  Future<List<Map<String, dynamic>>> getInCompleteTasks() async {
    try {
      database = await initDatabase();
      List<Map<String, dynamic>> results = await database.query(taskTableName,
          where: '$taskIsCompleteColumn = ?', whereArgs: [0]);
      return results;
    } catch (error) {
      throw 'database error $error';
    }
  }

  Future<int> updateTask(Map<String, dynamic> map, int id) async {
    try {
      database = await initDatabase();
      int rows = await database.update(taskTableName, map,
          where: '$taskIdColumn = ?', whereArgs: [id]);
      return rows;
    } catch (error) {
      throw 'database error $error';
    }
  }

  deleteTask(int id) async {
    try {
      database = await initDatabase();
      int rows = await database
          .delete(taskTableName, where: '$taskIdColumn = ?', whereArgs: [id]);
      return rows;
    } catch (error) {
      throw 'database error $error';
    }
  }

  deleteAllTasks() async {
    try {
      database = await initDatabase();
      int rows = await database.delete(taskTableName);
      return rows;
    } catch (error) {
      throw 'database error $error';
    }
  }
}
