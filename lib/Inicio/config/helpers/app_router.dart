import 'package:flutter/material.dart';
import 'package:front_medizin/Inicio/presentation/screens/welcome/welcome_screen.dart';
import 'package:front_medizin/iniciarsesion/presentation/screens/auth/login_screen.dart';
import 'package:front_medizin/registro/presentation/screens/auth/register_screen.dart';


class AppRouter {
  static const String welcome = '/';
  static const String login = '/login';
  static const String register = '/register';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case welcome:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case login:
        return MaterialPageRoute( builder: (_) => const LoginScreen());
       case register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      /*case phoneVerification:
        return MaterialPageRoute(
          builder: (_) => const PhoneVerificationScreen(),
        );*/
      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ),
        );
    }
  }
}
