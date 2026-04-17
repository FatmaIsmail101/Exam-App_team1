import 'package:flutter/material.dart';

import 'core/routes/routes.dart';
import 'core/theme/theme_app.dart';

class ExamApp extends StatelessWidget {
  const ExamApp({super.key, required this.startRoute});
  final String startRoute;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exam Application',
      theme: ThemeApp.themeApp,
      initialRoute: startRoute,
      onGenerateRoute: Routes.routes,
    );
  }
}
