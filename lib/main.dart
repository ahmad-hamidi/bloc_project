import 'package:bloc_project/locator.dart';
import 'package:bloc_project/pages/home/views/home.dart';
import 'package:flutter/material.dart';
import 'package:task_repository/task_repository.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    lc<TaskRepository>().allTodos.listen((c) => {

    });

    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BLoC Demo',
      home: HomePage(),
    );
  }
}
