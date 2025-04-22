abstract class RegisterStates {}

class AuthInitialState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterSuccessState extends RegisterStates {}

class FailedToRegisterState extends RegisterStates {
  final String errorMessage;
  FailedToRegisterState({required this.errorMessage});
}
