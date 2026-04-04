import 'package:exam_app_elevate/core/routes/routes_name.dart';
import 'package:exam_app_elevate/features/authentication/register/peresenation/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';

import '../../features/authentication/forget_password/presentation/screens/forget_password_screen.dart';
import '../../features/authentication/login/presentation/screens/login_screen.dart';

class Routes {
  static Route<dynamic> routes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.login:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case RoutesName.forgetPassword:
        return MaterialPageRoute(builder: (context) => ForgetPasswordScreen());
      case RoutesName.register:
        return MaterialPageRoute(builder: (context) => SignUpScreen());
      default:
        return MaterialPageRoute(builder: (context) => Scaffold());
    }
  }
}
