import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_boarding/cubit/login/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(initialState());
  Future<void> SignIn({
    required String login,
    required String password,
  }) async {
    emit(
      SingInState(
        login: login,
        password: password,
      ),
    );
    await Future.delayed(
      const Duration(seconds: 3),
    );
    emit(LoggedState());
  }

  Future<void> SingUp({
    required String login,
    required String password,
    required String userName,
  }) async {
    emit(
      SingUpState(
        login: login,
        password: password,
        userName: userName,
      ),
    );
    await Future.delayed(
      const Duration(seconds: 3),
    );
    emit(
      RegistarErrorState(error: 'Invalid username or password'),
    );
  }

  LogOutUser() {
    emit(UnAuthenticatedState());
  }
}
