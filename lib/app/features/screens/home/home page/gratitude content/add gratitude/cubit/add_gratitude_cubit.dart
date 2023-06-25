import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:planner/app/repositories/items_repository.dart';

part 'add_gratitude_state.dart';

class AddGratitudeCubit extends Cubit<AddGratitudeState> {
  AddGratitudeCubit(this._itemsRepository) : super(const AddGratitudeState());

  final ItemsRepository _itemsRepository;

  Future<void> add(
    String title,
    String description,
    DateTime date,
  ) async {
    try {
      await _itemsRepository.add(title, description, date);

      emit(
        const AddGratitudeState(saved: true),
      );
    } catch (error) {
      emit(
        AddGratitudeState(
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
