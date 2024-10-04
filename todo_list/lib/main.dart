import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_list/todo_list_app.dart';

Future<void> initHive() async {
  await Hive.initFlutter();
  await Hive.openBox('settings');
}

void main() async {
  await initHive();
  runApp(const ToDoList());
}
