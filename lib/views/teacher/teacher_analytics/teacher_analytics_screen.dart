import 'package:e_learning_application/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class TeacherAnalyticsScreen extends StatelessWidget {
  const TeacherAnalyticsScreen({super.key});

  final String instructorId = 'inst_1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      body: CustomScrollView(),
    );
  }
}
