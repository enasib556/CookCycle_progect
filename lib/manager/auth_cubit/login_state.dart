abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final String token;

  LoginSuccessState({required this.token});
}

class LoginFailedState extends LoginState {
  final String errorMessage;
  LoginFailedState({required this.errorMessage});
}
