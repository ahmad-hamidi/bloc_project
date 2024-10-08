
import 'dart:async';
import 'package:task_repository/task_repository.dart';

class TaskRepository {

  final _controller = StreamController<List<TaskModel>>.broadcast();

  List <TaskModel> _tasks = [];

  Stream<List<TaskModel>> get allTodos async* {
    yield* _controller.stream;
  }

  void addTask(TaskModel model) {
    _tasks.add(model);
    _controller.add(_tasks);
  }

  void editTask(TaskModel model) {
    List<TaskModel> newList = [];
    for (TaskModel todo in _tasks) {
      if (todo.id == model.id) {
        newList.add(model);
      } else {
        newList.add(todo);
      }
    }

    _tasks = newList;
    _controller.add(_tasks);
  }

  void deleteTask(TaskModel model) {
    List<TaskModel> newList = [];
    for (TaskModel todo in _tasks) {
      if (todo.id != model.id) {
        newList.add(model);
      }
    }

    _tasks = newList;
    _controller.add(_tasks);
  }

}
