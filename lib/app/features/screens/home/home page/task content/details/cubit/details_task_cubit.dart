import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:planner/app/models/task_model.dart';
import 'package:planner/app/repositories/tasks_repository.dart';

part 'details_task_state.dart';

class DetailsTaskCubit extends Cubit<DetailsTaskState> {
  DetailsTaskCubit(this._tasksRepository)
      : super(const DetailsTaskState(
          taskModel: null,
        ));

  final TasksRepository _tasksRepository;

  Future<void> getTaskWithID(String id) async {
    final taskModel = await _tasksRepository.get(id: id);
    try {
      emit(DetailsTaskState(taskModel: taskModel));
    } catch (error) {
      emit(DetailsTaskState(
        taskModel: taskModel,
        loadingErrorOccured: true,
      ));
    }
  }
}
