abstract class AuthStates{}
class AuthInitialState extends AuthStates{}
class RegisterLoadingState extends AuthStates{}
class RegisterSuccessState extends AuthStates{}
class FailedToRegisterState extends AuthStates{
  String errorMessage;
  FailedToRegisterState({required this.errorMessage});

}
