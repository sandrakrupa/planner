import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

part 'root_state.dart';

class RootCubit extends Cubit<RootState> {
  StreamSubscription? _streamSubscription;

  RootCubit() : super(RootInitial()) {
    _streamSubscription = FirebaseAuth.instance.userChanges().listen((user) {
      if (user == null) {
        emit(RootUnauthenticated());
      } else {
        emit(RootAuthenticated(user: user));
      }
    }, onError: (error, stackTrace) {
      emit(
        RootError(
          error.toString(),
        ),
      );
    });
  }

  void logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      emit(RootUnauthenticated());
    } catch (error) {
      emit(RootError(error.toString()));
    }
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    // _streamSubscription = null;
    return super.close();
  }
}
