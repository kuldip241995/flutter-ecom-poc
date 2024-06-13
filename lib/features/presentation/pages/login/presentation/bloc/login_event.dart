import 'package:flutter/material.dart';

abstract class LoginEvent {}

class LoginTextChangedEvent extends LoginEvent {
  final String emailValue;
  final String passwordValue;
  LoginTextChangedEvent(this.emailValue, this.passwordValue);
}

class LoginSubmittedEvent extends LoginEvent {
  final String email;
  final String password;
  final BuildContext context;
  LoginSubmittedEvent(this.context, this.email, this.password);
}
