import 'package:e_learning_application/core/theme/app_colors.dart';
import 'package:e_learning_application/services/dummy_data_service.dart';
import 'package:e_learning_application/views/teacher/my_course/widgets/empty_courses_state.dart';
import 'package:e_learning_application/views/teacher/my_course/widgets/my_course_app_bar.dart';
import 'package:e_learning_application/views/teacher/my_course/widgets/teacher_course_card.dart';
import 'package:flutter/material.dart';

class MyCourseScreen extends StatelessWidget {
  const MyCourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final teacherCourses = DummyDataService.getInstructorCourses('inst_1');
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          MyCourseAppBar(),
          if (teacherCourses.isEmpty)
            const SliverFillRemaining(child: EmptyCoursesState())
          else
            SliverPadding(
              padding: EdgeInsets.all(16),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) =>
                      TeacherCourseCard(course: teacherCourses[index]),
                  childCount: teacherCourses.length,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
