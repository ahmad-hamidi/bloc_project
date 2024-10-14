part of 'add_task_bloc.dart';

enum FormStatus { initial, success, error }

final class AddTaskState {
  final FormStatus formStatus;
  final Status taskStatus;
  final String task;
  final bool isLoading;

  AddTaskState({this.task = '',
    this.taskStatus = Status.todo,
    this.formStatus = FormStatus.initial,
    this.isLoading = false});

  AddTaskState copyWith({
    String? task,
    Status? taskStatus,
    FormStatus? formStatus,
    bool? isLoading,
  }) {
    return AddTaskState(
      task: task ?? this.task,
      taskStatus: taskStatus ?? this.taskStatus,
      formStatus: formStatus ?? this.formStatus,
      isLoading: isLoading ?? this.isLoading,
    );
  }


}
