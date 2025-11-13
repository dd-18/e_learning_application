import 'package:e_learning_application/models/course.dart';
import 'package:e_learning_application/routes/app_routes.dart';
import 'package:e_learning_application/services/dummy_data_service.dart';
import 'package:e_learning_application/views/chat/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActionButtons extends StatelessWidget {
  final Course course;

  const ActionButtons({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () {
              if (course.isPremium &&
                  !DummyDataService.isCourseUnlocked(course.id)) {
                Get.toNamed(
                  AppRoutes.payment,
                  arguments: {
                    'courseId': course.id,
                    'courseName': course.title,
                    'price': course.price,
                  },
                );
                //payment screen
              } else {
                Get.toNamed(
                  AppRoutes.lesson.replaceAll(':id', course.lessons.first.id),
                  parameters: {'courseId': course.id},
                );
              }
              ;
            },
            label: Text('Start Learning'),
            icon: Icon(Icons.play_circle),
          ),
        ),
        if (!course.isPremium ||
            DummyDataService.isCourseUnlocked(course.id)) ...[
          const SizedBox(width: 16),
          IconButton(
            onPressed: () => Get.to(
              () => ChatScreen(
                courseId: course.id,
                instructorId: course.instructorId,
                isTeacherView: false,
              ),
            ),
            icon: const Icon(Icons.chat),
          ),
        ],
      ],
    );
  }
}
