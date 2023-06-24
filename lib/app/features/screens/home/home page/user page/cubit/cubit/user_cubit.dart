import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:planner/app/models/name_model.dart';
import 'package:planner/app/repositories/names_repository.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this._namesRepository) : super(const UserState());

  final NamesRepository _namesRepository;

  StreamSubscription? _streamSubscription;

  Future<void> add(
    String title,
  ) async {
    try {
      await _namesRepository.add(title);

      emit(
        const UserState(saved: true),
      );
    } catch (error) {
      emit(
        UserState(
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> start() async {
    _streamSubscription = _namesRepository.getNamesSteram().listen(
      (names) {
        emit(UserState(names: names));
      },
    )..onError(
        (error) {
          emit(const UserState(loadingErrorOccured: true));
        },
      );
  }

  Future<void> update(
      {required String documentID, required String title}) async {
    try {
      await _namesRepository.update(id: documentID, title: title);
    } catch (error) {
      emit(
        const UserState(removingErrorOccured: true),
      );
    }
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
