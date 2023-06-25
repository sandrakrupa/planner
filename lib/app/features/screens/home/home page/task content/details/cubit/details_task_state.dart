part of 'details_task_cubit.dart';

@immutable
class DetailsTaskState {
  const DetailsTaskState({
    required this.taskModel,
    this.loadingErrorOccured = false,
  });
  final TaskModel? taskModel;
   final bool loadingErrorOccured;
}
