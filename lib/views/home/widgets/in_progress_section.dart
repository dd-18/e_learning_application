import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_learning_application/core/theme/app_colors.dart';
import 'package:e_learning_application/services/dummy_data_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class InProgressSection extends StatelessWidget {
  const InProgressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final inProgressCourse = DummyDataService.course
        .where(
          (course) =>
              course.lessons.any((lesson) => lesson.isCompleted) &&
              !course.lessons.every((lesson) => lesson.isCompleted),
        )
        .toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (inProgressCourse.isNotEmpty)
          Text(
            'In Progress',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        const SizedBox(height: 16),
        if (inProgressCourse.isEmpty) SizedBox.shrink(),
        Column(
          children: inProgressCourse.map((course) {
            final completedLessons = course.lessons
                .where((lesson) => lesson.isCompleted)
                .length;
            final totalLessons = course.lessons.length;
            final progress = completedLessons / totalLessons;
            return Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.accent,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.1),
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () => _handleInProgressCourseTap(
                      context,
                      course.id,
                      completedLessons,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: CachedNetworkImage(
                                imageUrl: course.imageUrl,
                                fit: BoxFit.contain,
                                placeholder: (context, url) =>
                                    Shimmer.fromColors(
                                      baseColor: AppColors.primary.withOpacity(
                                        0.1,
                                      ),
                                      highlightColor: AppColors.accent,
                                      child: Container(color: Colors.white),
                                    ),
                                errorWidget: (context, url, error) => Container(
                                  color: AppColors.primary.withOpacity(0.1),
                                  child: Icon(Icons.error),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  course.title,
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Progress: ${(progress * 100).toInt()}%',
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    color: AppColors.secondary,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                LinearProgressIndicator(
                                  value: progress,
                                  backgroundColor: AppColors.primary
                                      .withOpacity(0.1),
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    AppColors.primary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  void _handleInProgressCourseTap(
    BuildContext context,
    String courseId,
    int lastLesson,
  ) {
    Get.toNamed(
      '/course/$courseId',
      parameters: {'id': courseId, 'lastLesson': lastLesson.toString()},
    );
  }
}
