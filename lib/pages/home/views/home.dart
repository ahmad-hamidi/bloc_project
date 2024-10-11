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
                TaskStatus(title: '3 Done', bgColor: Colors.green, clickListener: () {
                  context.read<TaskBloc>().add(SelectStatus(
                    status: Status.done
                  ));
                }),
                TaskStatus(title: '1 Pending', bgColor: Colors.orange, clickListener: () {
                  context.read<TaskBloc>().add(SelectStatus(
                      status: Status.pending
                  ));
                })
              ],
            ),
            TaskStatus(title: '5 Todo', bgColor: Colors.purple, clickListener: () {
              context.read<TaskBloc>().add(SelectStatus(
                  status: Status.todo
              ));
            }),
            const SizedBox(height: 20),
            const TaskTitle(),
            const SizedBox(height: 20),
            Column(
              children: [1, 2, 3, 4, 5]
                  .map(
                    (e) => TaskCard(text: 'Some Task $e')
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
