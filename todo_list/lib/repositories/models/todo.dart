///Record instance model
////[id] - task id
///[title] - task title
///[description] - task description
///[finishDate] - task completion date
///[isReady] - task readiness
class ToDo {
  ToDo({
    required this.id,
    required this.title,
    required this.description,
    required this.finishDate,
    required this.isReady,
  });

  final int id;
  final String title;
  final String description;
  final DateTime finishDate;
  late final bool isReady;
}
