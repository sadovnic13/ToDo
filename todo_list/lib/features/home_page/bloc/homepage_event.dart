part of 'homepage_bloc.dart';

abstract class HomepageEvent extends Equatable {}

class DeleteToDoRecord extends HomepageEvent {
  final int id;
  final String parameter;
  final bool hideDoneTasks;

  DeleteToDoRecord({required this.id, required this.parameter, required this.hideDoneTasks});

  @override
  List<Object?> get props => [id, parameter, hideDoneTasks];
}

class FilteringTodoList extends HomepageEvent {
  final String parameter;
  final bool hideDoneTasks;

  FilteringTodoList({required this.parameter, required this.hideDoneTasks});

  @override
  List<Object?> get props => [parameter, hideDoneTasks];
}
