import 'package:bloc_project/pages/home/blocs/task/task_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_repository/task_repository.dart';

class TaskTitle extends StatelessWidget {
  const TaskTitle({super.key});

  String _statusText(Status status) {
    switch(status) {
      case Status.all : return "All Tasks";
      case Status.todo : return "Todo Tasks";
      case Status.pending : return "Pending Tasks";
      case Status.done : return "Done Tasks";
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        return Align(
          child: Text(
            _statusText(state.status),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        );
      }
    );
  }
}
