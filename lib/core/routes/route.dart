import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_poc/features/presentation/pages/charts/presentation/ui/chart_screen.dart';
import 'package:flutter_poc/features/presentation/pages/home/presentation/ui/home_screen.dart';
import 'package:flutter_poc/features/presentation/pages/imageEditor/presentation/bloc/image_editor_bloc.dart';
import 'package:flutter_poc/features/presentation/pages/imageEditor/presentation/ui/image_editor.dart';
import 'package:flutter_poc/features/presentation/pages/login/presentation/ui/login_screen.dart';
import 'package:flutter_poc/features/presentation/pages/moreSettings/more_settings_screen.dart';
import 'package:flutter_poc/features/presentation/pages/pdp/presentation/ui/pdp_screen.dart';
import 'package:flutter_poc/features/presentation/pages/plp/presentation/ui/plp_screen.dart';
import 'package:flutter_poc/features/presentation/pages/profile/presentation/ui/my_profile.screen.dart';
import 'package:flutter_poc/features/presentation/pages/razorpay/presentation/ui/razorpay_screen.dart';
import 'package:flutter_poc/features/presentation/pages/splash/presentation/ui/splash_screen.dart';

class AppRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case '/login_screen':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case '/home_screen':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case '/plp_screen':
        return MaterialPageRoute(builder: (_) => PLPScreen());
      case '/pdp_screen':
        // Extract the arguments from settings
        final Map<String, dynamic>? args =
            settings.arguments as Map<String, dynamic>?;
        // Check if args is not null and contains required keys
        if (args != null &&
            args.containsKey('productId') &&
            args.containsKey('productName') &&
            args.containsKey('productDescription') &&
            args.containsKey('productImages')) {
          // Create PDPScreen with arguments
          return MaterialPageRoute(
            builder: (_) => PDPScreen(
              productId: args['productId'],
              productName: args['productName'],
              productDescription: args['productDescription'],
              productImages: args['productImages'],
            ),
          );
        } else {
          return _errorRoute();
        }
      case '/more_setting_screen':
        return MaterialPageRoute(builder: (_) => const MoreSettingsScreen());
      case '/charts_screen':
        return MaterialPageRoute(
          builder: (_) => const ChartScreen(),
        );
      case '/image_editor':
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => ImageEditorBloc(),
            child: ImageEditorScreen(),
          ),
        );
      case '/my_profile_screen':
        return MaterialPageRoute(
          builder: (_) => const MyProfileScreen(),
        );
      case '/razorpay_example_screen':
        return MaterialPageRoute(
          builder: (_) => RazorPayExample(),
        );
      default:
        return MaterialPageRoute(builder: (_) => SplashScreen());
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Container(
        child: Center(child: Text('Data is missing')),
      ),
    );
  }
}
