import 'package:exam_app_elevate/features/home/questions/presentation/view_model/question_cubit.dart';
import 'package:exam_app_elevate/features/result/presentation/screens/widgets/question_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/di/di.dart';
import '../../../../core/values/app_strings.dart';
import '../../../home/questions/domain/entity/exam_entity.dart';
import '../../../home/questions/domain/use_case/question_usecase.dart';
import '../../../home/questions/presentation/view_model/question_state.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final examEntity = ExamEntity(
      id: "670070a830a3c3c1944a9c63",
      duration: 30,
      numOfQuestions: 23,
    );
    return BlocProvider(
      create: (context) => QuestionCubit(getIt<QuestionUsecase>(), examEntity),
      child: Scaffold(
        backgroundColor: Color(0xffF9F9F9),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xffF9F9F9),
          titleSpacing: 8.w,
          title: Row(
            children: [
              IconButton(
                constraints: const BoxConstraints(),
                padding: EdgeInsets.zero,
                icon: Icon(Icons.arrow_back_ios, size: 22.w),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Text(AppStrings.answer, style: theme.textTheme.bodyMedium),
            ],
          ),
        ),
        body: BlocBuilder<QuestionCubit, QuestionState>(
          builder: (context, state) {
            final questions = state.cachedQuestions ?? [];

            return ListView.separated(
              separatorBuilder: (context, index) => SizedBox(height: 24.h),
              padding: EdgeInsets.all(16.w),
              itemCount: questions.length,
              itemBuilder: (context, index) {
                final item = questions[index];
                return QuestionWidget(questionEntity: item);
              },
            );
          },
        ),
      ),
    );
  }
}
