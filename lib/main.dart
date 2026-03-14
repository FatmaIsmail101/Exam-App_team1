// ignore_for_file: depend_on_referenced_packages

import 'package:exam_app_elevate/exam_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talker/talker.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_observer.dart';

import 'config/di/di.dart';
import 'config/secure/flutter_secure_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CashingFlutterSecureStorage.init();
  configureDependencies();
  final talker = Talker();

  Bloc.observer = TalkerBlocObserver(talker: talker);

  runApp(
    ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => ExamApp(),
    ),
  );
}
