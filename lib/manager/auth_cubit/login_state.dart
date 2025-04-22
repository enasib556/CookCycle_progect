
import '../../models/authModels/auth_model.dart';

abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final AuthResponse authResponse;

  LoginSuccessState({required this.authResponse});
}

class LoginFailedState extends LoginState {
  final String errorMessage;

  LoginFailedState({required this.errorMessage});
}
