import 'package:exam_app_elevate/core/routes/routes_name.dart';
import 'package:flutter/material.dart';

import '../../features/authentication/login/presentation/screens/login_screen.dart';

class Routes {
  static Route<dynamic> routes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.login:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      default:
        return MaterialPageRoute(builder: (context) => Scaffold());
    }
  }
}
