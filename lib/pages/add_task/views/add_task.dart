import 'dart:math';

import 'package:bloc_project/locator.dart';
import 'package:bloc_project/pages/add_task/blocs/add_task_bloc.dart';
import 'package:bloc_project/pages/add_task/blocs/add_task_event.dart';
import 'package:bloc_project/pages/add_task/views/status_card.dart';
import 'package:bloc_project/pages/add_task/views/submit_btn.dart';
import 'package:bloc_project/pages/add_task/views/text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_repository/task_repository.dart';

class AddTaskPage extends StatelessWidget {
  const AddTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _AddTaskView();
  }
}

class _AddTaskView extends StatelessWidget {
  const _AddTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            const TextInput(),
            const SizedBox(height: 40),
            const Row(
              children: [
                StatusCard(title: "Todo", bgColor: Colors.black),
                StatusCard(title: "Pending", bgColor: Colors.orange),
                StatusCard(title: "Done", bgColor: Colors.green),
              ],
            ),
            const SizedBox(height: 40),
            SubmitButton(
              clickListener: () {
                List<Status> status = [Status.all, Status.todo, Status.done, Status.pending];
                AddTaskBloc(lc.get()).add(SubmitEvent(
                  task: "New Task ${Random().nextInt(999)}",
                  status: status[Random().nextInt(status.length)],
                ),);
              },
            ),
          ],
        ),
      ),
    );
  }
}
