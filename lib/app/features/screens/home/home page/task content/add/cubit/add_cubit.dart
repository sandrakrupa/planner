import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:planner/app/core/enums.dart';

part 'add_state.dart';

class AddCubit extends Cubit<AddState> {
  AddCubit() : super(const AddState(status: Status.initial));

  Future<void> add(
    String title,
    String description,
    DateTime date,
  ) async {
    try {
      await FirebaseFirestore.instance.collection('tasks').add(
        {
          'title': title,
          'description': description,
          'date': date,
        },
      );

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
