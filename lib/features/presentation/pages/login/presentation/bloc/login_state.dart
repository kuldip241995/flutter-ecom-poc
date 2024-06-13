abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginValidState extends LoginState {}

class LoginEmailErrorState extends LoginState {
  final String errorMessage;
  LoginEmailErrorState(this.errorMessage);
}

class LoginPasswordErrorState extends LoginState {
  final String errorMessage;
  LoginPasswordErrorState(this.errorMessage);
}

class LoginLoadingState extends LoginState {}
