import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repositories/repositories.dart';

part 'add_todo_page_event.dart';
part 'add_todo_page_state.dart';

/// Block allowing to add and respond to requests, on the screen of adding a record

class AddTodoPageBloc extends Bloc<AddTodoPageEvent, AddTodoPageState> {
  AddTodoPageBloc(this.toDoRepositories) : super(AddTodoPageInitial()) {
    on<AddTodo>((event, emit) {
      try {
        emit(AddTodoPageLoading());
        toDoRepositories.setTodo(event.title, event.description, event.finishDate);
        emit(AddTodoPageLoaded());
      } catch (e) {
        emit(AddTodoPageFailure(exeption: e));
      }
    });
  }

  final ToDoRepositories toDoRepositories;
}
