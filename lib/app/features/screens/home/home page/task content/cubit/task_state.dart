part of 'task_cubit.dart';

@immutable
class TaskState {
  const TaskState({
    this.tasks,
    this.loadingErrorOccured = false,
    this.removingErrorOccured = false,
  });
  final QuerySnapshot<Map<String, dynamic>>? tasks;
  final bool loadingErrorOccured;
  final bool removingErrorOccured;
}
