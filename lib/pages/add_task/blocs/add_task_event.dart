
import 'package:flutter/material.dart';
import 'package:task_repository/task_repository.dart';

@immutable
sealed class AddTaskEvent {}

final class ChangeTaskEvent extends AddTaskEvent {
  final String task;

  ChangeTaskEvent({required this.task});
}

final class ChangeStatusEvent extends AddTaskEvent {
  final Status status;

  ChangeStatusEvent({required this.status});
}

final class SubmitEvent extends AddTaskEvent {
  final String task;
  final Status status;

  SubmitEvent({required this.task, required this.status});
}

final class EditEvent extends AddTaskEvent {
  final TaskModel model;

  EditEvent({required this.model});
}
