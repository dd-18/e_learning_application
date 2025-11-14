import 'package:e_learning_application/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AnalyticsDashboardScreen extends StatelessWidget {
  const AnalyticsDashboardScreen({super.key});

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
      // body: FutureBuilder<AnalyticsData>(
      //   future: future,
      //   builder: (context, snapshot) {},
      // ),
    );
  }
}
