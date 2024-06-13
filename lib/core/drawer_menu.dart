import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_poc/core/constants/string.dart';
import 'package:flutter_poc/core/services/shared_preference_service.dart';
import 'package:flutter_poc/features/presentation/pages/home/presentation/ui/home_screen.dart';
import 'package:flutter_poc/features/presentation/pages/login/presentation/bloc/login_bloc.dart';
import 'package:flutter_poc/features/presentation/pages/login/presentation/ui/login_screen.dart';
import 'package:flutter_poc/features/presentation/pages/moreSettings/more_settings_screen.dart';

class DrawerMenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Hello, Kuldip',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: Text(Strings.homeTitle.capitalize()),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              // Navigate to the HomeScreen
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.more_vert),
            title: const Text(Strings.moreSettingsText),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              // Navigate to the SettingsScreen
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MoreSettingsScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text(Strings.logoutText),
            onTap: () {
              showLogoutAlert(context);
            },
          ),
          // Add more ListTile items as needed
        ],
      ),
    );
  }

  void showLogoutAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(Strings.logoutText),
          content: const Text(Strings.logoutMessageText),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the alert dialog
              },
              child: const Text(Strings.cancelText),
            ),
            TextButton(
              onPressed: () async {
                await SharedPreferencesService().setLoginStatus(false);
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => BlocProvider(
                      create: (context) => LoginBloc(),
                      child: LoginScreen(),
                    ),
                  ),
                  (Route<dynamic> route) =>
                      false, // This predicate removes all previous routes
                );
              },
              child: const Text(Strings.logoutText),
            ),
          ],
        );
      },
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}
