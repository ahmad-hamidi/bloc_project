enum TaskStatus {
  todo,
  pending,
  done
}

class TaskModel {

  final String id, title;
  final TaskStatus status;

  const TaskModel({required this.id, required this.title, required this.status});
}