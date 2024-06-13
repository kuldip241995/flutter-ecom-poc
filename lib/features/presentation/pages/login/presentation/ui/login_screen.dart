import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_poc/core/components/theme_button.dart';
import 'package:flutter_poc/core/components/theme_textfield.dart';
import 'package:flutter_poc/core/constants/color.dart';
import 'package:flutter_poc/core/constants/images.dart';
import 'package:flutter_poc/core/constants/paddingConstant.dart';
import 'package:flutter_poc/features/presentation/pages/login/presentation/bloc/login_bloc.dart';
import 'package:flutter_poc/features/presentation/pages/login/presentation/bloc/login_event.dart';
import 'package:flutter_poc/features/presentation/pages/login/presentation/bloc/login_state.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:flutter_poc/core/constants/string.dart';

class LoginScreen extends StatelessWidget {
  bool showSpinner = false;
  TextEditingController userEmailController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: GapConstants.LARGE_GAP),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Container(
                  height: GapConstants.XXXXXLARGE_GAP,
                  child: Image.asset(Images.appIcon),
                ),
              ),
              const SizedBox(
                height: GapConstants.XXXLARGE_GAP,
              ),
              AppTextField(
                controller: userEmailController,
                autovalidateMode: AutovalidateMode.always,
                keyboardType: TextInputType.emailAddress,
                validator: (input) {
                  final state = BlocProvider.of<LoginBloc>(context).state;
                  if (state is LoginEmailErrorState) {
                    return state.errorMessage;
                  }
                  return null;
                },
                onChanged: (value) {
                  BlocProvider.of<LoginBloc>(context).add(LoginTextChangedEvent(
                    userEmailController.text,
                    userPasswordController.text,
                  ));
                },
              ),
              const SizedBox(
                height: GapConstants.MEDIUM_GAP,
              ),
              AppTextField(
                controller: userPasswordController,
                autovalidateMode: AutovalidateMode.always,
                obscureText: true,
                validator: (input) {
                  final state = BlocProvider.of<LoginBloc>(context).state;
                  if (state is LoginPasswordErrorState) {
                    return state.errorMessage;
                  }
                  return null;
                },
                onChanged: (value) {
                  BlocProvider.of<LoginBloc>(context).add(LoginTextChangedEvent(
                    userEmailController.text,
                    userPasswordController.text,
                  ));
                },
              ),
              const SizedBox(
                height: GapConstants.LARGE_GAP,
              ),
              BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  return ThemeButton(
                    title: Strings.logIn,
                    colour: (state is LoginValidState)
                        ? AppColors.black
                        : AppColors.darkGrayBorder,
                    onPressed: () async {
                      if (state is LoginValidState) {
                        BlocProvider.of<LoginBloc>(context)
                            .add(LoginSubmittedEvent(
                          context,
                          userEmailController.text,
                          userPasswordController.text,
                        ));
                      }
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
