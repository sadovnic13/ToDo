import 'package:dio/dio.dart';

import '../../util/util.dart';
import '../repositories.dart';

class ToDoRepositories {
  ///Request to add a task
  Future<void> setTodo(String title, String description, DateTime finishDate) async {
    final token = settingsBox.get("token");

    await dio.post("$url/item/",
        data: {
          "id": 0,
          "created_at": DateTime.now().toIso8601String(),
          "title": title,
          "description": description,
          "finish_date": finishDate.toIso8601String(),
          "is_ready": 0,
          "user_id": 0,
        },
        options: Options(
          headers: {
            "Authorization": "Token $token",
          },
        ));

    return;
  }

  ///Task state change request
  ///[id] - task id
  ///[isReady] - task readiness
  Future<void> markTodo(int id, bool isReady) async {
    final token = settingsBox.get("token");

    await dio.patch("$url/item/$id/",
        data: {"is_ready": isReady},
        options: Options(
          headers: {
            "Authorization": "Token $token",
          },
        ));
    return;
  }

  ///Request to update task values
  ///[id] - task id
  ///[title] - task title
  ///[description] - task description
  ///[finishDate] - task completion date
  Future<void> updateTodo(int id, String title, String description, DateTime finishDate) async {
    final token = settingsBox.get("token");

    await dio.put("$url/item/$id/",
        data: {
          "title": title,
          "description": description,
          "finish_date": finishDate.toIso8601String(),
        },
        options: Options(
          headers: {
            "Authorization": "Token $token",
          },
        ));

    return;
  }

  ///Record deletion request
  ///[id] - task id
  Future<void> deleteTodo(int id) async {
    final token = settingsBox.get("token");

    await dio.delete("$url/item/$id/",
        options: Options(
          headers: {
            "Authorization": "Token $token",
          },
        ));

    return;
  }

  ///Request to sort and filter tasks
  ///[order] - sorting parameter
  ///[hideDoneTasks] - filtering parameter
  Future<List<ToDo>> filteringTodoList(String order, bool hideDoneTasks) async {
    final token = settingsBox.get("token");
    final int hideReady = hideDoneTasks ? 1 : 0;
    final response = await dio.get(
      "$url/items/?ordering=$order&is_ready=$hideReady",
      options: Options(
        headers: {
          "Authorization": "Token $token",
        },
      ),
    );
    final data = response.data as List<dynamic>;

    final List<ToDo> todoList = data
        .map((e) => ToDo(
              id: e['id'],
              title: e['title'],
              description: e['description'] ?? '',
              finishDate: DateTime.parse(e['finish_date']),
              isReady: e['is_ready'],
            ))
        .toList();

    return todoList;
  }
}
