
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:bloc_project/pages/add_task/blocs/add_task_event.dart';
import 'package:equatable/equatable.dart';
import 'package:task_repository/task_repository.dart';

part 'add_task_state.dart';

class AddTaskBloc extends Bloc<AddTaskEvent, AddTaskState> {
  final TaskRepository taskRepository;

  AddTaskBloc(this.taskRepository) : super(AddTaskState()) {
    on<ChangeTaskEvent>(_changeTask);
    on<ChangeStatusEvent>(_changeStatus);
    on<SubmitEvent>(_submit);
    on<EditEvent>(_editEvent);
  }

  void _changeTask(ChangeTaskEvent event, Emitter<AddTaskState> emit) {
    emit(state.copyWith(task: event.task));
  }

  void _changeStatus(ChangeStatusEvent event, Emitter<AddTaskState> emit) {
    emit(state.copyWith(taskStatus: event.status));
  }

  void _submit(SubmitEvent event, Emitter<AddTaskState> emit) {

    emit(state.copyWith(isLoading: true));

    TaskModel taskModel = TaskModel(
      id : Random().nextInt(10000).toString(),
      title: event.task,
      status: event.status
    );

    taskRepository.addTask(taskModel);

    emit(state.copyWith(formStatus: FormStatus.success, isLoading: false));

  }

  void _editEvent(EditEvent event, Emitter<AddTaskState> emit) {
    emit(state.copyWith(isLoading: true));

    taskRepository.editTask(event.model);

    emit(state.copyWith(formStatus: FormStatus.success, isLoading: false));
  }
}
