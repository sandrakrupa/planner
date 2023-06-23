import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:planner/app/models/task_model.dart';

class TasksRepository {
  Stream<List<TaskModel>> getTasksStream() {
    return FirebaseFirestore.instance
        .collection('tasks')
        .orderBy('date')
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map((doc) {
        return TaskModel(
          id: doc.id,
          title: doc['title'],
          description: doc['description'],
          date: (doc['date'] as Timestamp).toDate(),
        );
      }).toList();
    });
  }

  Future<void> delete({required String id}) async {
    await FirebaseFirestore.instance.collection('tasks').doc(id).delete();
  }

  Future<TaskModel> get({required String id}) async {
    final doc =
        await FirebaseFirestore.instance.collection('tasks').doc(id).get();
    return TaskModel(
      id: doc.id,
      title: doc['title'],
      description: doc['description'],
      date: (doc['date'] as Timestamp).toDate(),
    );
  }

  Future<void> add(
    String title,
    String description,
    DateTime date,
  ) async {
    await FirebaseFirestore.instance.collection('tasks').add(
      {
        'title': title,
        'description': description,
        'date': date,
      },
    );
  }
}
