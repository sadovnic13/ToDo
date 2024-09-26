import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repositories/repositories.dart';

part 'edit_todo_page_event.dart';
part 'edit_todo_page_state.dart';

/// Block allowing to add and respond to requests, on the record change screen
class EditTodoPageBloc extends Bloc<EditTodoPageEvent, EditTodoPageState> {
  EditTodoPageBloc(this.toDoRepositories) : super(EditTodoPageInitial()) {
    on<EditTodo>((event, emit) async {
      emit(EditTodoPageLoading());
      await toDoRepositories.updateTodo(event.id, event.title, event.description, event.finishDate);
      emit(EditTodoPageLoaded());
    });
  }

  final ToDoRepositories toDoRepositories;
}
