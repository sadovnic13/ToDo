part of 'edit_todo_page_bloc.dart';

abstract class EditTodoPageState extends Equatable {}

final class EditTodoPageInitial extends EditTodoPageState {
  @override
  List<Object?> get props => [];
}

final class EditTodoPageLoading extends EditTodoPageState {
  @override
  List<Object?> get props => [];
}

final class EditTodoPageLoaded extends EditTodoPageState {
  @override
  List<Object?> get props => [];
}

final class EditTodoPageFailure extends EditTodoPageState {
  EditTodoPageFailure({required this.exeption});

  final Object? exeption;

  @override
  List<Object?> get props => [exeption];
}
