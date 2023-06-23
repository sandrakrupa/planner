import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'add_state.dart';

class AddCubit extends Cubit<AddState> {
  AddCubit() : super(const AddState());

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
        const AddState(saved: true),
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
