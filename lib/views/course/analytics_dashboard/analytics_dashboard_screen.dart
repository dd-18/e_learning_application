import 'package:e_learning_application/core/theme/app_colors.dart';
import 'package:e_learning_application/views/course/analytics_dashboard/widget/learning_streak_card.dart';
import 'package:e_learning_application/views/course/analytics_dashboard/widget/recommendations_card.dart';
import 'package:e_learning_application/views/course/analytics_dashboard/widget/skills_progress_card.dart';
import 'package:e_learning_application/views/course/analytics_dashboard/widget/weekly_progress_card.dart';
import 'package:flutter/material.dart';

import '../../../models/analytics_data.dart';
import '../../../services/analytics_service.dart';

class AnalyticsDashboardScreen extends StatelessWidget {
  AnalyticsDashboardScreen({super.key});

  final _analyticsService = AnalyticsService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      appBar: AppBar(
        title: const Text(
          'Learning Analytics',
          style: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: FutureBuilder<AnalyticsData>(
        future: _analyticsService.getUserAnalytics('current_user_id'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final analytics = snapshot.data!;
          return SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LearningStreakCard(learningStreak: analytics.learningStreak),
                  const SizedBox(height: 20),
                  WeeklyProgressCard(weeklyProgress: analytics.weeklyProgress),
                  const SizedBox(height: 20),
                  SkillsProgressCard(skillProgress: analytics.skillProgress),
                  const SizedBox(height: 20),
                  RecommendationsCard(
                    recommendations: analytics.recommendations,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
