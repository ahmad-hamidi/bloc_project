
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
            builder: (cxt) => const AddTaskPage(),
          ),
        ),
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: ListView(
          children: [
            Row(
              children: [
                Expanded(
                  child: TaskStatus(
                    title:
                        '${lc.get<TaskRepository>().countByStatus(Status.done, [])} Done',
                    bgColor: Colors.green,
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
                        '${lc.get<TaskRepository>().countByStatus(Status.pending, [])} Pending',
                    bgColor: Colors.orange,
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
                  '${lc.get<TaskRepository>().countByStatus(Status.todo, [])} Todo',
              bgColor: Colors.purple,
              clickListener: () {
                context.read<TaskBloc>().add(SelectStatus(status: Status.todo));
              },
            ),
            const SizedBox(height: 20),
            const TaskTitle(),
            const SizedBox(height: 20),
            BlocBuilder<TaskBloc, TaskState>(
              builder: (context, state) {

                final tasks = listTaskByStatus(state.status, state.tasks);

                if (tasks.isEmpty) {
                  return const Center(child: Text("No data"));
                }

                return Column(
                  children: tasks
                      .map((e) => TaskCard(text: '${e.title} ${DateTime.now()}'))
                      .toList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  List<TaskModel> listTaskByStatus(Status status, List<TaskModel> tasks) {
    if (status == Status.all) {
      //return tasks;
      return TaskRepository().dummyList();
    }

    //return tasks.where((model) => model.status == status).toList();
    return TaskRepository().dummyList().where((model) => model.status == status).toList();
  }
}
