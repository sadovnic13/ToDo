import 'package:todo_list/features/add_todo_page/add_todo_page.dart';
import 'package:todo_list/features/edit_todo_page/view/edit_todo_page_screen.dart';
import 'package:todo_list/features/home_page/home_page.dart';
import 'package:todo_list/features/reg_page/reg_page.dart';
import 'package:todo_list/features/settings_page/view/settings_page_screen.dart';

import '../features/log_page/log_page.dart';

final routes = {
  '/log_page_screen': (context) => const LogPageScreen(),
  '/reg_page_screen': (context) => const RegPageScreen(),
  '/home_page_screen': (context) => const HomepageScreen(),
  '/add_todo_page_screen': (context) => const AddTodoPageScreen(),
  '/edit_todo_page_screen': (context) => const EditTodoPage(),
  '/settings_page_screen': (context) => const SettingsPageScreen(),
};
