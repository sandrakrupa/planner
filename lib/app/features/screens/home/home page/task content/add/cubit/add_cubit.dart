import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:planner/app/core/enums.dart';
import 'package:planner/app/repositories/items_repository.dart';

part 'add_state.dart';

class AddCubit extends Cubit<AddState> {
  AddCubit(this._itemsRepository)
      : super(const AddState(status: Status.initial));

  final ItemsRepository _itemsRepository;

  Future<void> add(
    String title,
    String description,
    DateTime date,
  ) async {
    try {
      await _itemsRepository.add(title, description, date);

      emit(
        const AddState(saved: true, status: Status.success),
      );
    } catch (error) {
      emit(
        AddState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
