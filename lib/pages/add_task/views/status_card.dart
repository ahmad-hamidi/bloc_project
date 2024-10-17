import 'package:bloc_project/locator.dart';
import 'package:bloc_project/pages/add_task/blocs/add_task_bloc.dart';
import 'package:bloc_project/pages/add_task/blocs/add_task_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_repository/task_repository.dart';

class StatusCard extends StatelessWidget {
  final String title;
  final Status status;
  final bool isSelect;

  const StatusCard({
    required this.title,
    required this.status,
    required this.isSelect,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          context
              .read<AddTaskBloc>()
              .add(ChangeStatusEvent(status: status));
        },
        child: Container(
          width: 100,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
          margin: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: lc.get<TaskRepository>().getBackgroundTaskColor(status),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color:
                  lc.get<TaskRepository>().getBorderSelectedTaskColor(isSelect),
              width: 5,
            ),
          ),
          child: Center(
            child: Text(
              title,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
