part of 'logpage_bloc.dart';

abstract class LogpageState extends Equatable {}

class LoginInitial extends LogpageState {
  @override
  List<Object?> get props => [];
}

class LoginLoading extends LogpageState {
  @override
  List<Object?> get props => [];
}

class LoginSuccess extends LogpageState {
  @override
  List<Object?> get props => [];
}

class LoginFailure extends LogpageState {
  LoginFailure({required this.exception});

  final Object? exception;
  // final String errorMessage;

  @override
  List<Object?> get props => [exception];
}
