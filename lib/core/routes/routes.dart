import 'package:exam_app_elevate/core/routes/routes_name.dart';
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
      default:
        return MaterialPageRoute(builder: (context) => Scaffold());
    }
  }
}
