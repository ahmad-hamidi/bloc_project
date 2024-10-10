

import 'package:task_repository/src/enums/status.dart';

class TaskModel {

  final String id, title;
  final Status status;

  const TaskModel({required this.id, required this.title, required this.status});
}