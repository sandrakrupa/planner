import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:planner/app/models/task_model.dart';
import 'package:planner/app/repositories/tasks_repository.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit(this._tasksRepository) : super(const TaskState());

  final TasksRepository _tasksRepository;

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    _streamSubscription = _tasksRepository.getTasksStream().listen(
      (tasks) {
        emit(TaskState(tasks: tasks));
      },
    )..onError(
        (error) {
          emit(const TaskState(loadingErrorOccured: true));
        },
      );
  }

  Future<void> remove({required String documentID}) async {
    try {
      await _tasksRepository.delete(id: documentID);
    } catch (error) {
      emit(
        const TaskState(removingErrorOccured: true),
      );
      start();
    }
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
