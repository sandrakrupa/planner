import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:planner/app/models/item_model.dart';

class ItemsRepository {
  Stream<List<ItemModel>> getItemsStream() {
    return FirebaseFirestore.instance
        .collection('items')
        .orderBy('date')
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map((doc) {
        return ItemModel(
          id: doc.id,
          title: doc['title'],
          description: doc['description'],
          date: (doc['date'] as Timestamp).toDate(),
        );
      }).toList();
    });
  }

  Future<void> delete({required String id}) {
    return FirebaseFirestore.instance.collection('items').doc(id).delete();
  }

  Future<ItemModel> get({required String id}) async {
    final doc =
        await FirebaseFirestore.instance.collection('items').doc(id).get();
    return ItemModel(
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
    await FirebaseFirestore.instance.collection('items').add(
      {
        'title': title,
        'description': description,
        'date': date,
      },
    );
  }
}
