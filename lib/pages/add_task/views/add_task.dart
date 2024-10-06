import 'package:bloc_project/pages/add_task/views/status_card.dart';
import 'package:bloc_project/pages/add_task/views/submit_btn.dart';
import 'package:bloc_project/pages/add_task/views/text_input.dart';
import 'package:flutter/material.dart';

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
          children: const [
            SizedBox(height: 20),
            TextInput(),
            SizedBox(height: 40),
            Row(
              children: [
                StatusCard(title: "Todo", bgColor: Colors.black),
                StatusCard(title: "Pending", bgColor: Colors.orange),
                StatusCard(title: "Done", bgColor: Colors.green),
              ],
            ),
            SizedBox(height: 40),
            SubmitButton()
          ],
        ),
      ),
    );
  }
}
