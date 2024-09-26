part of 'logpage_bloc.dart';

abstract class LogpageEvent extends Equatable {}

class SignInUser extends LogpageEvent {
  SignInUser({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  @override
  List<Object?> get props => [email, password];
}
