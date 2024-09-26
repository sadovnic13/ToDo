part of 'add_todo_page_bloc.dart';

abstract class AddTodoPageState extends Equatable {}

final class AddTodoPageInitial extends AddTodoPageState {
  @override
  List<Object?> get props => [];
}

final class AddTodoPageLoading extends AddTodoPageState {
  @override
  List<Object?> get props => [];
}

final class AddTodoPageLoaded extends AddTodoPageState {
  @override
  List<Object?> get props => [];
}

final class AddTodoPageFailure extends AddTodoPageState {
  AddTodoPageFailure({required this.exeption});

  final Object? exeption;

  @override
  List<Object?> get props => [exeption];
}
