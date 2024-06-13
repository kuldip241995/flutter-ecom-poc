import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_poc/core/constants/color.dart';
import 'package:flutter_poc/core/constants/constants.dart';
import 'package:flutter_poc/core/constants/images.dart';
import 'package:flutter_poc/core/services/shared_preference_service.dart';
import 'package:flutter_poc/features/presentation/pages/home/presentation/ui/home_screen.dart';
import 'package:flutter_poc/features/presentation/pages/login/presentation/bloc/login_bloc.dart';
import 'package:flutter_poc/features/presentation/pages/login/presentation/ui/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: kSplashDuration),
      () async {
        bool isLoggedIn = await SharedPreferencesService().getLoginStatus();
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (BuildContext context) => isLoggedIn
                ? HomeScreen()
                : BlocProvider(
                    create: (context) => LoginBloc(),
                    child: LoginScreen(),
                  ),
          ),
        );
      },
    );
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Image.asset(Images.splashImage),
      ),
    );
  }
}
