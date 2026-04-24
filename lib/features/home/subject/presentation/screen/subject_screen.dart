import 'package:bloc/bloc.dart';
import 'package:exam_app_elevate/features/home/subject/presentation/cubit/subject_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:injectable/injectable.dart';

import '../../../../../config/di/di.dart';
import '../../../../../core/theme/text/text_theme_app.dart';
import '../../../../../core/values/app_strings.dart';
import '../../widget/nav_botton_bar.dart';
import '../widget/subject_card.dart';
import '../cubit/subject_view_model.dart';

class SubjectScreen extends StatelessWidget {
  const SubjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SubjectViewModel>()..getSubject(),
      child: const _SubjectView(),
    );
  }
}

class _SubjectView extends StatelessWidget {
  const _SubjectView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F4F8),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
          AppStrings.survey,
                style: TextThemeApp.medium20Black.copyWith(
                  fontSize: 25.sp,
                  color: const Color(0xff02369C),
                ),
              ),
              const SizedBox(height: 16),

              // ── Search Bar ──
              SearchBar(
                onChanged: (query) =>
                    context.read<SubjectViewModel>().searchSubjects(query),
              ),              const SizedBox(height: 28),

              // ── Section Label ──
              const Text(
                'Browse by subject',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1A1A2E),
                ),
              ),
              const SizedBox(height: 14),

              // ── Subject List ──
              Expanded(
                child: BlocBuilder<SubjectViewModel, SubjectState>(
                  builder: (context, state) {
                    return switch (state) {
                      SubjectLoadingState() => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      SubjectsuccessState(:final subject) when subject.isEmpty =>
                      const Center(
                        child: Text(
                          'No subjects found',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      SubjectsuccessState(:final subject) => ListView.separated(
                        itemCount: subject.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 12),
                        itemBuilder: (context, i) => SubjectCard(  subject:subject[i], ),
                      ),

                      SubjectErrorState(:final errorMessage) => Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              errorMessage,
                              style: const TextStyle(color: Colors.red),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 12),
                            ElevatedButton(
                              onPressed: () =>
                                  context.read<SubjectViewModel>().getSubject(),
                              child: const Text('Retry'),
                            ),
                          ],
                        ),
                      ),

                      _ => const SizedBox.shrink(),
                    };
                  },
                ),
              ),
            ],
          ),
        ),
      ),

      // ── Bottom Navigation ──
      bottomNavigationBar: BlocBuilder<SubjectViewModel, SubjectState>(
        builder: (context, state) {
          return BottomNav(
            selectedIndex: 0,
            onTap: (_) {},
          );
        },
      ),
    );
  }
}