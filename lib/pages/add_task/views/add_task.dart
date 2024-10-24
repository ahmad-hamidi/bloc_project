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
  final TaskModel? taskModel;
  final TextEditingController editText = TextEditingController();

  AddTaskPage({this.taskModel, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddTaskBloc(lc()),
      child: _buildAddTaskView(),
    );
  }

  Widget _buildAddTaskView() {
    editText.text = taskModel?.title ??"";
    return BlocListener<AddTaskBloc, AddTaskState>(
      listener: (context, state) {
        if (state.formStatus == FormStatus.success) {
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(taskModel != null ? 'Edit Task' : 'Add Task'),
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
              _buildButtonSubmit()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButtonSubmit() {
    return BlocBuilder<AddTaskBloc, AddTaskState>(
      builder: (context, state) {
        return SubmitButton(
          textButton: taskModel != null ? 'Edit Todo' : 'Add New Todo',
          clickListener: () {
            if (taskModel != null) {
              context.read<AddTaskBloc>().add(
                EditEvent(
                  model: TaskModel(id : taskModel?.id ?? "", title : editText.text, status : state.taskStatus)
                ),
              );
              return;
            }
            final Status status = context.read<AddTaskBloc>().state.taskStatus;

            context.read<AddTaskBloc>().add(
                  SubmitEvent(
                    task: editText.text,
                    status: status,
                  ),
                );
          },
        );
      },
    );
  }
}
