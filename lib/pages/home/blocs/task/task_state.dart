part of 'task_bloc.dart';

class TaskState {
  TaskState({required this.tasks, this.status = Status.all});

  List<TaskModel> tasks;

  Status status;

  TaskState copyWith({List<TaskModel>? taskListModel, Status? status}) {
    return TaskState(
        tasks: taskListModel ?? tasks, status: status ?? this.status);
  }
}
