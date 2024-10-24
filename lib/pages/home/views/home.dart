import 'package:bloc_project/locator.dart';
import 'package:bloc_project/pages/add_task/views/add_task.dart';
import 'package:bloc_project/pages/home/blocs/task/task_bloc.dart';
import 'package:bloc_project/pages/home/views/task_card.dart';
import 'package:bloc_project/pages/home/views/task_status.dart';
import 'package:bloc_project/pages/home/views/task_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_repository/task_repository.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskBloc(lc.get()),
      child: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (cxt) => AddTaskPage(),
          ),
        ),
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: BlocBuilder<TaskBloc, TaskState>(
          builder: (context, state) {
            return ListView(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TaskStatus(
                        title:
                            '${lc.get<TaskRepository>().countByStatus(Status.all, state.tasks)} All',
                        bgColor: getBackgroundColor(Status.all),
                        clickListener: () {
                          context
                              .read<TaskBloc>()
                              .add(SelectStatus(status: Status.all));
                        },
                      ),
                    ),
                    Expanded(
                      child: TaskStatus(
                        title:
                            '${lc.get<TaskRepository>().countByStatus(Status.done, state.tasks)} Done',
                        bgColor: getBackgroundColor(Status.done),
                        clickListener: () {
                          context
                              .read<TaskBloc>()
                              .add(SelectStatus(status: Status.done));
                        },
                      ),
                    ),
                    Expanded(
                      child: TaskStatus(
                        title:
                            '${lc.get<TaskRepository>().countByStatus(Status.pending, state.tasks)} Pending',
                        bgColor: getBackgroundColor(Status.pending),
                        clickListener: () {
                          context
                              .read<TaskBloc>()
                              .add(SelectStatus(status: Status.pending));
                        },
                      ),
                    )
                  ],
                ),
                TaskStatus(
                  title:
                      '${lc.get<TaskRepository>().countByStatus(Status.todo, state.tasks)} Todo',
                  bgColor: getBackgroundColor(Status.todo),
                  clickListener: () {
                    context
                        .read<TaskBloc>()
                        .add(SelectStatus(status: Status.todo));
                  },
                ),
                const SizedBox(height: 20),
                TaskTitle(status: state.status),
                const SizedBox(height: 20),
                _buildList(state, context)
              ],
            );
          },
        ),
      ),
    );
  }

  List<TaskModel> listTaskByStatus(Status status, List<TaskModel> tasks) {
    if (status == Status.all) {
      return tasks;
    }

    return tasks.where((model) => model.status == status).toList();
  }

  Color getBackgroundColor(Status status) {
    switch (status) {
      case Status.all:
        return Colors.brown;
      case Status.todo:
        return Colors.purple;
      case Status.pending:
        return Colors.orange;
      case Status.done:
        return Colors.green;
    }
  }

  Widget _buildList(TaskState state, BuildContext context) {
    final listTask = listTaskByStatus(state.status, state.tasks);
    return listTask.isEmpty
        ? const Center(child: Text("No data"))
        : Column(
            children: listTask
                .map(
                  (e) => TaskCard(
                    text: '${e.title}.${e.status} ${DateTime.now()}',
                    backgroundColor: getBackgroundColor(e.status),
                    deleteListener: () {
                      context.read<TaskBloc>().add(
                            DeleteTaskEvent(id: e.id),
                          );
                    },
                    editListener: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddTaskPage(
                            taskModel: e,
                          ),
                        ),
                      );
                    },
                  ),
                )
                .toList(),
          );
  }
}
