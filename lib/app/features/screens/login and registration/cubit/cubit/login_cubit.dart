import 'package:bloc/bloc.dart';
import 'package:planner/app/core/enums.dart';
import 'package:planner/app/repositories/auth_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _authRepository;

  LoginCubit(this._authRepository)
      : super(
          LoginState(status: Status.initial),
        );

  bool isPasswordVisible = false;
  bool isRegistration = false;

  Future<void> login(String email, String password, bool isRegistration) async {
    try {
      if (isRegistration) {
        // registration
        await _authRepository.registerUser(email, password);
      } else {
        // logging
        await _authRepository.loginUser(email, password);
      }
      emit(
        LoginState(
          status: Status.success,
        ),
      );
    } catch (e) {
      emit(
        LoginState(
          status: Status.error,
          errorMessage: _authRepository.getExceptionMessage(e, email, password),
        ),
      );
    }
  }

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    emit(
      LoginState(
        status: Status.initial,
        isPasswordVisible: isPasswordVisible,
      ),
    );
  }

  void toggleRegistrationMode() {
    isRegistration = !isRegistration;
    emit(
      LoginState(
        status: Status.initial,
        isRegistration: isRegistration,
      ),
    );
  }
}
