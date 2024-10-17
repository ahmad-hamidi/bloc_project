import 'package:flutter/material.dart';
import 'package:task_repository/task_repository.dart';

class TaskTitle extends StatelessWidget {
  final Status status;

  const TaskTitle({required this.status, super.key});

  String _statusText(Status status) {
    switch (status) {
      case Status.all:
        return "All Tasks";
      case Status.todo:
        return "Todo Tasks";
      case Status.pending:
        return "Pending Tasks";
      case Status.done:
        return "Done Tasks";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Text(
        _statusText(status),
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
