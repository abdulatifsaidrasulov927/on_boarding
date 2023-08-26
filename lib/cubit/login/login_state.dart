abstract class LoginState {}

class initialState extends LoginState {}

class SingInState extends LoginState {
  final String login;
  final String password;
  SingInState({
    required this.login,
    required this.password,
  });
}

class SingUpState extends LoginState {
  final String login;
  final String password;
  final String userName;
  SingUpState({
    required this.login,
    required this.password,
    required this.userName,
  });
}

class LoggedState extends LoginState {}

class RegistarErrorState extends LoginState {
  final String error;
  RegistarErrorState({
    required this.error,
  });
}

class UnAuthenticatedState extends LoginState {}
