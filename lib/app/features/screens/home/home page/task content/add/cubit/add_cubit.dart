import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:planner/app/repositories/tasks_repository.dart';

part 'add_state.dart';

class AddCubit extends Cubit<AddState> {
  AddCubit(this._tasksRepository) : super(const AddState());

  final TasksRepository _tasksRepository;

  Future<void> add(
    String title,
    String description,
    DateTime date,
  ) async {
    try {
      await _tasksRepository.add(title, description, date);

      emit(
        const AddState(
          saved: true,
        ),
      );
    } catch (error) {
      emit(
        AddState(
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
