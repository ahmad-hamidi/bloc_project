
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

  int countByStatus(Status status, List<TaskModel> tasks) {

    final listDummy = dummyList();

    if (status == Status.all) {
      //return tasks.length;
      return listDummy.length;
    }

    //return tasks.where((model) => model.status == status).toList().length;
    return listDummy.where((model) => model.status == status).toList().length;
  }

  List<TaskModel> dummyList() {
    List<TaskModel> tasks = [];
    for (int index = 0; index < 100; index++) {
      Status result;
      if (index == 4) {
        result = Status.todo;
      } else if (index % 2 == 1) {
        result = Status.pending;
      } else if (index % 3 == 0) {
        result = Status.done;
      } else {
        result = Status.all;
      }
      tasks.add(TaskModel(id: "$index", title: "title $index", status: result));
    }
    return tasks;
  }

}
