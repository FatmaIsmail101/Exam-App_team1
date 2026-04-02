import 'package:exam_app_elevate/config/di/di.dart';
import 'package:exam_app_elevate/core/values/icon_paths.dart';
import 'package:exam_app_elevate/features/home/questions/domain/entity/exam_entity.dart';
import 'package:exam_app_elevate/features/home/questions/presentation/screens/general_function/formate_time.dart';
import 'package:exam_app_elevate/features/home/questions/presentation/screens/widgets/question_content.dart';
import 'package:exam_app_elevate/features/home/questions/presentation/screens/widgets/question_header.dart';
import 'package:exam_app_elevate/features/home/questions/presentation/view_model/question_cubit.dart';
import 'package:exam_app_elevate/features/home/questions/presentation/view_model/question_state.dart';
import 'package:exam_app_elevate/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/routes/routes_name.dart';
import '../../../../../core/values/app_strings.dart';
import '../../../../../core/widgets/custom_dialog.dart';
import '../../domain/use_case/question_usecase.dart';
import '../view_model/question_event.dart';

class ExamsScreen extends StatelessWidget {
  const ExamsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final examEntity = ExamEntity(
      id: "670070a830a3c3c1944a9c63",
      duration: 1,
      numOfQuestions: 23,
    );

    return BlocProvider<QuestionCubit>(
      create: (context) =>
          QuestionCubit(getIt<QuestionUsecase>(), examEntity)
            ..doIntent(GetQuestionEvent()),
      child: Builder(
        builder: (context) {
          var cubit = context.read<QuestionCubit>();

          return Scaffold(
            appBar: AppBar(
              actionsPadding: .symmetric(horizontal: 12.w),
              automaticallyImplyLeading: false,
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
                  Text(AppStrings.exam, style: theme.textTheme.bodyMedium),
                ],
              ),
              actions: [
                Image.asset(IconPaths.timerIcon),
                SizedBox(width: 6.w),
                BlocBuilder<QuestionCubit, QuestionState>(
                  builder: (context, state) {
                    return Text(
                      FormateTime.formatTime(cubit.remainingSec),
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: (cubit.remainingSec <= 15 * 60)
                            ? const Color(0xffCC1010)
                            : const Color(0xff11CE19),
                      ),
                    );
                  },
                ),
              ],
            ),
            resizeToAvoidBottomInset: true,

            body: BlocConsumer<QuestionCubit, QuestionState>(
              listener: (context, state) {
                if (cubit.remainingSec == 0 &&
                    state.questionsState.data!.isNotEmpty) {
                  CustomDialog.showTimeOutDialog(context, () {
                    talker.warning("msg");
                    context.read<QuestionCubit>().doIntent(FinishExamEvent());
                    Navigator.pushReplacementNamed(
                      context,
                      RoutesName.scoreScreen,
                      arguments: cubit.examResult,
                    );
                  });
                }
              },
              buildWhen: (previous, current) {
                return previous.currentIndexPage != current.currentIndexPage ||
                    previous.questionsState != current.questionsState;
              },
              builder: (context, state) {
                if (state.questionsState.isLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state.questionsState.errorMessage != null &&
                    state.questionsState.data == null) {
                  return Center(
                    child: Padding(
                      padding: EdgeInsets.all(20.w),
                      child: Text(
                        state.questionsState.errorMessage!,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  );
                } else if (state.questionsState.data!.isEmpty &&
                    state.questionsState.isLoading == false &&
                    state.questionsState.errorMessage == null) {
                  return Center(child: Text(AppStrings.noData));
                } else if (state.questionsState.data!.isNotEmpty &&
                    state.questionsState.isLoading == false &&
                    state.questionsState.errorMessage == null) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                    child: Column(
                      spacing: 24.h,
                      children: [
                        QuestionHeader(
                          totalQuetionNum: state.currentIndexPage,
                          questionNum: state.questionsState.data!.length,
                        ),
                        Expanded(
                          child: PageView.builder(
                            controller: cubit.controller,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              var question = state.questionsState.data?[index];
                              return QuestionContent(
                                questionEntity: question!,
                                onTap: (answer) {
                                  context.read<QuestionCubit>().doIntent(
                                    AnswerSelectedEvent(index, answer),
                                  );
                                },
                              );
                            },
                            itemCount: state.questionsState.data!.length,
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return Container();
              },
            ),
          );
        },
      ),
    );
  }
}
