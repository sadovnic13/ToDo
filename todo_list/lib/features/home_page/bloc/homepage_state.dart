part of 'homepage_bloc.dart';

abstract class HomepageState extends Equatable {}

final class HomepageInitial extends HomepageState {
  @override
  List<Object?> get props => [];
}

final class HomepageLoading extends HomepageState {
  @override
  List<Object?> get props => [];
}

final class HomepageLoaded extends HomepageState {
  HomepageLoaded({required this.todoList});

  final List<ToDo> todoList;

  @override
  List<Object?> get props => [todoList];
}

final class HomepageFailure extends HomepageState {
  HomepageFailure({required this.exception});

  final Object? exception;

  @override
  List<Object?> get props => [exception];
}
