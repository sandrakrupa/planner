import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:planner/app/core/enums.dart';
import 'package:planner/app/repositories/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;
  StreamSubscription? _streamSubscription;

  AuthCubit(this._authRepository)
      : super(
          const AuthState(status: Status.initial),
        ) {
    _streamSubscription = _authRepository.authChanges().listen(
      (user) {
        if (user != null) {
          emit(
            AuthState(status: Status.success, user: user),
          );
        }
      },
      onError: (error, stackTrace) {
        emit(
          AuthState(
            status: Status.error,
            errorMessage: error.toString(),
          ),
        );
      },
    );
  }

  void logout() async {
    await _authRepository.signOut();
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
