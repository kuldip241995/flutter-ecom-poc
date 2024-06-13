import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_poc/core/constants/string.dart';
import 'package:flutter_poc/core/services/firebase_service.dart';
import 'package:flutter_poc/core/services/shared_preference_service.dart';
import 'package:flutter_poc/features/presentation/pages/home/presentation/ui/home_screen.dart';
import 'package:flutter_poc/features/presentation/pages/login/presentation/bloc/login_event.dart';
import 'package:flutter_poc/features/presentation/pages/login/presentation/bloc/login_state.dart';

final emailRegex = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
final passwordRegex =
    RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialState()) {
    on<LoginTextChangedEvent>((event, emit) {
      if (!emailRegex.hasMatch(event.emailValue)) {
        emit(LoginEmailErrorState(Strings.emailValidationMessage));
      } else if (!passwordRegex.hasMatch(event.passwordValue)) {
        emit(LoginPasswordErrorState(Strings.passwordValidationMessage));
      } else {
        emit(LoginValidState());
      }
    });

    on<LoginSubmittedEvent>((event, emit) async {
      await SharedPreferencesService().setLoginStatus(true);
      FirebaseService().sendCustomLogEvents(
        'login_screen',
        {
          'screenName': 'login_screen_event',
          'userEmail': event.email,
          'userPassword': event.password
        },
      );
      Navigator.of(event.context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
    });
  }
}
