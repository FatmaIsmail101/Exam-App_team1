import 'package:exam_app_elevate/core/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/authentication/forget_password/presentation/screens/forget_password_screen.dart';
import '../../features/authentication/login/presentation/screens/login_screen.dart';
import '../../features/home/questions/presentation/screens/exams_screen.dart';
import '../../features/home/questions/presentation/screens/score/score_screen.dart';
import '../../features/home/questions/presentation/view_model/question_cubit.dart';

class Routes {
  static Route<dynamic> routes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.login:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case RoutesName.forgetPassword:
        return MaterialPageRoute(builder: (context) => ForgetPasswordScreen());
      case RoutesName.examsScreen:
        return MaterialPageRoute(builder: (context) => ExamsScreen());
      case RoutesName.scoreScreen:
        final cubit = settings.arguments as QuestionCubit?; // استلمي الـ Cubit
        if (cubit == null) {
          return MaterialPageRoute(
            builder: (_) => const Scaffold(
              body: Center(child: Text("Error: No Cubit found")),
            ),
          );
        }
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: cubit,
            child: ScoreScreen(cubit: cubit),
          ),
        );
      default:
        return MaterialPageRoute(builder: (context) => Scaffold());
    }
  }
}
