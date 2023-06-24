import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:planner/app/repositories/names_repository.dart';

part 'add_name_state.dart';

class AddNameCubit extends Cubit<AddNameState> {
  AddNameCubit(this._namesRepository) : super(const AddNameState());

  final NamesRepository _namesRepository;

  Future<void> add(
    String title,
  ) async {
    try {
      await _namesRepository.add(title);

      emit(
        const AddNameState(saved: true),
      );
    } catch (error) {
      emit(
        AddNameState(
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
