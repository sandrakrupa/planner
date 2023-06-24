import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:planner/app/models/name_model.dart';

class NamesRepository {
  Stream<List<NameModel>> getNamesSteram() {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('User is not logged in');
    }
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('names')
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map((doc) {
        return NameModel(
          id: doc.id,
          title: doc['title'],
        );
      }).toList();
    });
  }

  Future<void> update({required String id, required String title}) {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('User is not logged in');
    }
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('names')
        .doc(id)
        .update(
      {
        'title': title,
      },
    );
  }

  Future<void> add(
    String title,
  ) async {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('User is not logged in');
    }
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('names')
        .add(
      {
        'title': title,
      },
    );
  }
}
