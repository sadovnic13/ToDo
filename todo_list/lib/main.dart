import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_list/todo_list_app.dart';

///Connection to database
Future<void> connectToDatabase() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://acpscpoqbqwdbzzzyxmy.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFjcHNjcG9xYnF3ZGJ6enp5eG15Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTExMTU0NDMsImV4cCI6MjAyNjY5MTQ0M30.0JZwvBnp9ynAuf8oXLIeEGph2lPn_38jiQXv5sCzLvk',
  );
}

Future<void> localStorage() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
}

Future<void> initHive() async {
  await Hive.initFlutter();
  await Hive.openBox('settings');
}

void main() async {
  await initHive();
  runApp(const ToDoList());
}
