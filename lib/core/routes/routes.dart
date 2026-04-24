import 'package:exam_app_elevate/core/routes/routes_name.dart';
import 'package:exam_app_elevate/features/home/subject/presentation/screen/subject_screen.dart';
import 'package:flutter/material.dart';
import '../../features/authentication/forget_password/presentation/screens/forget_password_screen.dart';
import '../../features/authentication/login/presentation/screens/login_screen.dart';
import '../../features/home/questions/presentation/screens/exams_screen.dart';
import '../../features/home/questions/presentation/screens/score/score_screen.dart';
import '../../features/result/presentation/screens/result_screen.dart';

class Routes {
  static Route<dynamic> routes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.login:
        return MaterialPageRoute(
          builder: (context) => LoginScreen(),
          settings: settings,
        );
      case RoutesName.forgetPassword:
        return MaterialPageRoute(
          builder: (context) => ForgetPasswordScreen(),
          settings: settings,
        );
      case RoutesName.examsScreen:
        return MaterialPageRoute(
          builder: (context) => ExamsScreen(),
          settings: settings,
        );
      case RoutesName.scoreScreen:
        return MaterialPageRoute(
          builder: (_) => const ScoreScreen(),
          settings: settings,
        );
      case RoutesName.resultScreen:
        return MaterialPageRoute(
          builder: (_) => const ResultScreen(),
          settings: settings,
        );
      case RoutesName.subjectScreen:
        return MaterialPageRoute(
          builder: (_) => const SubjectScreen(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(builder: (context) => Scaffold());
    }
  }
}
