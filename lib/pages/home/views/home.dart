import 'package:bloc_project/pages/add_task/views/add_task.dart';
import 'package:bloc_project/pages/home/views/task_card.dart';
import 'package:bloc_project/pages/home/views/task_status.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _HomeView();
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
            const Row(
              children: [
                TaskStatus(title: '3 Done', bgColor: Colors.green),
                TaskStatus(title: '1 Pending', bgColor: Colors.orange)
              ],
            ),
            const TaskStatus(title: '5 Todo', bgColor: Colors.purple),
            const SizedBox(height: 20),
            const Align(
              child: Text(
                'All Tasks',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
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
