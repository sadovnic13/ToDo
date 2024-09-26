part of 'add_todo_page_bloc.dart';

abstract class AddTodoPageEvent extends Equatable {}

class AddTodo extends AddTodoPageEvent {
  AddTodo({
    required this.title,
    required this.description,
    required this.finishDate,
  });

  final String title;
  final String description;
  final DateTime finishDate;

  @override
  List<Object?> get props => [title, description, finishDate];
}
