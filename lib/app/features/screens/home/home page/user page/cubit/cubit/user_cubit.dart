import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:planner/app/repositories/names_repository.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this._namesRepository)
      : super(const UserState(name: '', newName: ''));

  final NamesRepository _namesRepository;

  Future<void> update({required String newName}) async {
    try {
      await _namesRepository.update(newName: newName);
      emit(UserState(newName: newName, name: ''));
    } catch (error) {
      emit(
        const UserState(newName: '', name: ''),
      );
    }
  }

  Future<void> add({required String name}) async {
    try {
      await _namesRepository.add(name);

      emit(
        UserState(name: name, newName: '', saved: true),
      );
    } catch (error) {
      emit(
        UserState(
          errorMessage: error.toString(),
          name: '',
          newName: '',
        ),
      );
    }
  }
}
