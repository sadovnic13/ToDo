import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repositories/repositories.dart';

part 'homepage_event.dart';
part 'homepage_state.dart';

/// Block allowing to add and respond to requests, on the main screen
class HomepageBloc extends Bloc<HomepageEvent, HomepageState> {
  HomepageBloc(this.toDoRepositories) : super(HomepageInitial()) {
    on<DeleteToDoRecord>((event, emit) async {
      try {
        emit(HomepageLoading());
        await toDoRepositories.deleteTodo(event.id);
        final todoList = await toDoRepositories.filteringTodoList(event.parameter, event.hideDoneTasks);
        emit(HomepageLoaded(todoList: todoList));
      } on DioException catch (e) {
        if (e.response != null) {
          Map responseData = e.response!.data;
          emit(HomepageFailure(exception: responseData[responseData.keys.toList().first][0]));
        } else {
          emit(HomepageFailure(exception: "Server ERROR"));
        }
      }
    });

    on<FilteringTodoList>((event, emit) async {
      try {
        emit(HomepageLoading());
        final todoList = await toDoRepositories.filteringTodoList(event.parameter, event.hideDoneTasks);
        emit(HomepageLoaded(todoList: todoList));
      } on DioException catch (e) {
        if (e.response != null) {
          Map responseData = e.response!.data;
          emit(HomepageFailure(exception: responseData[responseData.keys.toList().first][0]));
        } else {
          emit(HomepageFailure(exception: "Server ERROR"));
        }
      }
    });
  }

  final ToDoRepositories toDoRepositories;
}
