import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:planner/app/models/item_model.dart';
import 'package:planner/app/repositories/items_repository.dart';

part 'gratitude_state.dart';

class GratitudeCubit extends Cubit<GratitudeState> {
  GratitudeCubit(this._itemsRepository) : super(const GratitudeState());

  final ItemsRepository _itemsRepository;

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    _streamSubscription = _itemsRepository.getItemsStream().listen(
      (items) {
        emit(GratitudeState(items: items));
      },
    )..onError(
        (error) {
          emit(const GratitudeState(loadingErrorOccured: true));
        },
      );
  }

  Future<void> remove({required String documentID}) async {
    try {
      await _itemsRepository.delete(id: documentID);
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
