
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
    return BlocProvider(
      create: (context) => AddTaskBloc(lc()),
      child: const _AddTaskView(),
    );
  }
}

class _AddTaskView extends StatelessWidget {
  const _AddTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController editText = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            TextInput(editTextController: editText),
            const SizedBox(height: 40),
            BlocBuilder<AddTaskBloc, AddTaskState>(
              builder: (context, state) {
                return Row(
                  children: [
                    StatusCard(
                      title: "Todo",
                      status: Status.todo,
                      isSelect: state.taskStatus == Status.todo,
                    ),
                    StatusCard(
                      title: "Pending",
                      status: Status.pending,
                      isSelect: state.taskStatus == Status.pending,
                    ),
                    StatusCard(
                      title: "Done",
                      status: Status.done,
                      isSelect: state.taskStatus == Status.done,
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 40),
            SubmitButton(
              clickListener: () {
                final Status status = context.read<AddTaskBloc>().state.taskStatus;
                AddTaskBloc(lc.get()).add(
                  SubmitEvent(
                    task: editText.text,
                    status: status,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
