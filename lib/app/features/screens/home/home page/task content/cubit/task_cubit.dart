import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:planner/app/models/task_model.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(const TaskState());

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    _streamSubscription = FirebaseFirestore.instance
        .collection('tasks')
        .orderBy('date')
        .snapshots()
        .listen(
      (tasks) {
        final taskModels = tasks.docs.map((doc) {
          return TaskModel(
            id: doc.id,
            title: doc['title'],
            description: doc['description'],
            date: (doc['date'] as Timestamp).toDate(),
          );
        }).toList();
        emit(TaskState(tasks: taskModels));
      },
    )..onError(
        (error) {
          emit(const TaskState(loadingErrorOccured: true));
        },
      );
  }

  Future<void> remove({required String documentID}) async {
    try {
      await FirebaseFirestore.instance
          .collection('tasks')
          .doc(documentID)
          .delete();
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
