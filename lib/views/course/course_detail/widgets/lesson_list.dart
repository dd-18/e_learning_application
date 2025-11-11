import 'package:e_learning_application/core/theme/app_colors.dart';
import 'package:e_learning_application/services/dummy_data_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'lesson_tile.dart';

class LessonList extends StatelessWidget {
  final String courseId;
  final bool isUnlocked;
  final VoidCallback? onLessonComplete;

  const LessonList({
    super.key,
    required this.courseId,
    required this.isUnlocked,
    this.onLessonComplete,
  });

  @override
  Widget build(BuildContext context) {
    final course = DummyDataService.getCourseById(courseId);
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: course.lessons.length,
      itemBuilder: (context, index) {
        final lesson = course.lessons[index];
        final isLocked =
            !lesson.isPreview &&
            (index > 0 &&
                !DummyDataService.isLessonCompleted(
                  course.id,
                  course.lessons[index - 1].id,
                ));
        return LessonTile(
          title: lesson.title,
          duration: '${lesson.duration} min',
          isCompleted: DummyDataService.isLessonCompleted(course.id, lesson.id),
          isLocked: isLocked,
          isUnlocked: isUnlocked,
          onTap: () async {
            if (course.isPremium && !isUnlocked) {
              Get.snackbar(
                'Premium Course',
                'Please purchase this course to access all lessons',
                backgroundColor: AppColors.primary,
                colorText: Colors.white,
                duration: Duration(seconds: 3),
              );
            } else if (isLocked) {
              Get.snackbar(
                'Lesson Locked',
                'Please complete the previous lesson to access this one',
                backgroundColor: Colors.red,
                colorText: Colors.white,
                duration: Duration(seconds: 3),
              );
            } else {}
          },
        );
      },
    );
  }
}
