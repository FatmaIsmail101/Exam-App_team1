import 'package:flutter/material.dart';

import 'core/routes/routes.dart';
import 'core/routes/routes_name.dart';
import 'core/theme/theme_app.dart';

class ExamApp extends StatelessWidget {
  const ExamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exam Application',
      theme: ThemeApp.themeApp,
      initialRoute: RoutesName.login,
      onGenerateRoute: Routes.routes,
    );
  }
}
