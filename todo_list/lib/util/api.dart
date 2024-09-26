import 'package:dio/dio.dart';
import 'package:hive/hive.dart';

final dio = Dio();
final settingsBox = Hive.box('settings');
const String url = "http://127.0.0.1:8000";
