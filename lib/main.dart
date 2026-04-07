// ignore_for_file: depend_on_referenced_packages

import 'package:exam_app_elevate/exam_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talker/talker.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_observer.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_settings.dart';

import 'config/di/di.dart';

final talker = Talker();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();

  Bloc.observer = TalkerBlocObserver(
    talker: talker,
    settings: const TalkerBlocLoggerSettings(
      enabled: true,
      printTransitions: true, // مهمة جداً عشان تشوف تغيير الـ State
      printEvents: true, // مهمة عشان تشوف الـ Events اللي بتتبعت
      printChanges: true,
      printClosings: true,
    ),
  );

  runApp(
    ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => ExamApp(),
    ),
  );
}
