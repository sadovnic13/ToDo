import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repositories/repositories.dart';

part 'homepage_event.dart';
part 'homepage_state.dart';

/// Block allowing to add and respond to requests, on the main screen
class HomepageBloc extends Bloc<HomepageEvent, HomepageState> {
  HomepageBloc(this.toDoRepositories) : super(HomepageInitial()) {
    on<DeleteToDoRecord>((event, emit) async {
      emit(HomepageLoading());
      await toDoRepositories.deleteTodo(event.id);
      final todoList = await toDoRepositories.filteringTodoList(event.parameter, event.hideDoneTasks);
      emit(HomepageLoaded(todoList: todoList));
    });

    on<FilteringTodoList>((event, emit) async {
      emit(HomepageLoading());
      final todoList = await toDoRepositories.filteringTodoList(event.parameter, event.hideDoneTasks);
      emit(HomepageLoaded(todoList: todoList));
    });
  }

  final ToDoRepositories toDoRepositories;
}
