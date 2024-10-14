import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:task_repository/task_repository.dart';

part 'task_event.dart';

part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {

  final TaskRepository taskRepository;

  TaskBloc(this.taskRepository) : super(TaskState(tasks: [])) {

    taskRepository.allTodos.listen((todoList) {
      add(GetAllStatus(tasks: todoList));
    });
    
    on<GetAllStatus>(_allStatus);
    on<SelectStatus>(_selectStatus);
  }

  void _allStatus(GetAllStatus event, Emitter<TaskState> emit) {
    emit(state.copyWith(taskListModel: event.tasks));
  }

  void _selectStatus(SelectStatus event, Emitter<TaskState> emit) {
    emit(state.copyWith(status: event.status));
  }
}
