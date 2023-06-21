import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:planner/app/repositories/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;
  StreamSubscription? _streamSubscription;

  AuthCubit(this._authRepository) : super(AuthInitial()) {
    _streamSubscription = _authRepository.authChanges().listen((user) {
      if (user == null) {
        emit(
          AuthUnauthenticated(),
        );
      } else {
        emit(
          AuthAuthenticated(user: user),
        );
      }
    }, onError: (error, stackTrace) {
      emit(
        AuthError(
          error.toString(),
        ),
      );
    });
  }

  void logout() async {
    try {
      await _authRepository.signOut();
      emit(
        AuthUnauthenticated(),
      );
    } catch (error) {
      emit(
        AuthError(
          error.toString(),
        ),
      );
    }
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
