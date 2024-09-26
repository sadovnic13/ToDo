import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_list/repositories/repositories.dart';

part 'regpage_event.dart';
part 'regpage_state.dart';

///Bloc for controlling the status of the registration screen
class RegpageBloc extends Bloc<RegpageEvent, RegpageState> {
  RegpageBloc(this.registrationRepositories) : super(RegistrationInitial()) {
    on<SignUpUser>((event, emit) async {
      try {
        emit(RegistrationLoading());

        if (event.password != event.repeatedPassword) {
          emit(RegistrationFailure(exception: "The passwords don't match"));
          return;
        }
        await registrationRepositories.registrationUser(event.login, event.password);
        emit(RegistrationSuccess());
      } on DioException catch (e) {
        emit(RegistrationFailure(exception: e.response!.data['password'][0]));
      }
    });
  }

  RegistrationRepositories registrationRepositories;
}
