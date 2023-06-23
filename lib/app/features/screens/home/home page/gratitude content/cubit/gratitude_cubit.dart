import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:planner/app/models/item_model.dart';

part 'gratitude_state.dart';

class GratitudeCubit extends Cubit<GratitudeState> {
  GratitudeCubit() : super(const GratitudeState());

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    _streamSubscription = FirebaseFirestore.instance
        .collection('items')
        .orderBy('date')
        .snapshots()
        .listen(
      (items) {
        final itemModels = items.docs.map((doc) {
          return ItemModel(
            id: doc.id,
            title: doc['title'],
            description: doc['description'],
            date: (doc['date'] as Timestamp).toDate(),
          );
        }).toList();
        emit(GratitudeState(items: itemModels));
      },
    )..onError(
        (error) {
          emit(const GratitudeState(loadingErrorOccured: true));
        },
      );
  }

  Future<void> remove({required String documentID}) async {
    try {
      await FirebaseFirestore.instance
          .collection('items')
          .doc(documentID)
          .delete();
    } catch (error) {
      emit(
        const GratitudeState(removingErrorOccured: true),
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
