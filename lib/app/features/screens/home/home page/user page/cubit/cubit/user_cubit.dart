import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

  Future<void> remove({required String documentID}) async {
    try {
      await _namesRepository.delete(id: documentID);
    } catch (error) {
      emit(
        const UserState(removingErrorOccured: true),
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
