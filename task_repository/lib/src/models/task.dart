import 'package:task_repository/src/enums/status.dart';

class TaskModel {
  final String id, title;
  final Status status;

  const TaskModel(
      {required this.id, required this.title, required this.status});

  TaskModel copyWith({String? id, String? title, Status? status}) {
    return TaskModel(
      id: id ?? this.id,
      title: title ?? this.title,
      status: status ?? this.status,
    );
  }
}
