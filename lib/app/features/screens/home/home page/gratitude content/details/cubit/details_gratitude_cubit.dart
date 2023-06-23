import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:planner/app/models/item_model.dart';
import 'package:planner/app/repositories/items_repository.dart';

part 'details_gratitude_state.dart';

class GratitudeDetailsCubit extends Cubit<GratitudeDetailsState> {
  GratitudeDetailsCubit(this._itemsRepository)
      : super(
          const GratitudeDetailsState(itemModel: null),
        );

  final ItemsRepository _itemsRepository;

  Future<void> getItemWithID(String id) async {
    final itemModel = await _itemsRepository.get(id: id);
    try {
      emit(GratitudeDetailsState(itemModel: itemModel));
    } catch (error) {
      emit(
        GratitudeDetailsState(itemModel: itemModel, loadingErrorOccured: true),
      );
    }
  }
}
