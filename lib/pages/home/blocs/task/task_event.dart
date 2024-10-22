part of 'task_bloc.dart';

@immutable
sealed class TaskEvent {}

final class SelectStatus extends TaskEvent {

  SelectStatus({required this.status});
  final Status status;
}

final class GetAllStatus extends TaskEvent {

  GetAllStatus({required this.tasks});
  final List<TaskModel> tasks;
}

final class DeleteTaskEvent extends TaskEvent {

  DeleteTaskEvent({required this.id});
  final String id;
}