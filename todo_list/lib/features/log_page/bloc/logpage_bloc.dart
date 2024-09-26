import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/repositories/requests/login_repositories.dart';

part 'logpage_event.dart';
part 'logpage_state.dart';

///Block for controlling the status of the authorization screen
class LogpageBloc extends Bloc<LogpageEvent, LogpageState> {
  LogpageBloc(this.loginRepositories) : super(LoginInitial()) {
    on<SignInUser>((event, emit) async {
      try {
        emit(LoginLoading());
        await loginRepositories.loginUser(event.email, event.password);
        emit(LoginSuccess());
      } on DioException catch (e) {
        if (e.response != null) {
          Map responseData = e.response!.data;
          emit(LoginFailure(exception: responseData[responseData.keys.toList().first][0]));
        } else {
          emit(LoginFailure(exception: "Server ERROR"));
        }
      }
    });
  }

  final LoginRepositories loginRepositories;
}
