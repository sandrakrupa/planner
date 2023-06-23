import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'add_gratitude_state.dart';

class AddGratitudeCubit extends Cubit<AddGratitudeState> {
  AddGratitudeCubit() : super(const AddGratitudeState());
  Future<void> add(
    String title,
    String description,
    DateTime date,
  ) async {
    try {
      await FirebaseFirestore.instance.collection('items').add(
        {
          'title': title,
          'description': description,
          'date': date,
        },
      );

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
