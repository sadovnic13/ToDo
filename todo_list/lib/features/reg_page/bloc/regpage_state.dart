part of 'regpage_bloc.dart';

sealed class RegpageState extends Equatable {}

class RegistrationInitial extends RegpageState {
  @override
  List<Object?> get props => [];
}

class RegistrationLoading extends RegpageState {
  @override
  List<Object?> get props => [];
}

class RegistrationSuccess extends RegpageState {
  @override
  List<Object?> get props => [];
}

class RegistrationFailure extends RegpageState {
  RegistrationFailure({required this.exception});

  final Object? exception;

  @override
  List<Object?> get props => [exception];
}
