part of 'regpage_bloc.dart';

abstract class RegpageEvent extends Equatable {}

class SignUpUser extends RegpageEvent {
  SignUpUser({
    required this.login,
    required this.password,
    required this.repeatedPassword,
  });

  final String login;
  final String password;
  final String repeatedPassword;

  @override
  List<Object?> get props => [login, password, repeatedPassword];
}
