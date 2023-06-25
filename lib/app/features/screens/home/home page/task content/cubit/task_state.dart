part of 'task_cubit.dart';

@immutable
class TaskState {
  const TaskState({
    this.tasks = const [],
    this.loadingErrorOccured = false,
    this.removingErrorOccured = false,
 
  });
  final List<TaskModel> tasks;
  final bool loadingErrorOccured;
  final bool removingErrorOccured;

}
