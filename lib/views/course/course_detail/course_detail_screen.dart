import 'package:e_learning_application/services/dummy_data_service.dart';
import 'package:e_learning_application/views/course/course_detail/widgets/action_buttons.dart';
import 'package:e_learning_application/views/course/course_detail/widgets/course_detail_app_bar.dart';
import 'package:e_learning_application/views/course/course_detail/widgets/course_info_card.dart';
import 'package:e_learning_application/views/course/course_detail/widgets/lesson_list.dart';
import 'package:e_learning_application/views/course/course_detail/widgets/review_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_routes.dart';

class CourseDetailScreen extends StatefulWidget {
  final String courseId;

  const CourseDetailScreen({super.key, required this.courseId});

  @override
  State<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final lastLesson = Get.parameters['lastLesson'];
    final id = Get.parameters['id'] ?? widget.courseId;
    final course = DummyDataService.getCourseById(id);
    final isCompleted = DummyDataService.isCourseCompleted(course.id);
    final isUnlocked = DummyDataService.isCourseUnlocked(widget.courseId);

    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            CourseDetailAppBar(imageUrl: course.imageUrl),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      course.title,
                      style: theme.textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber),
                        SizedBox(width: 4),
                        Text(
                          course.rating.toString(),
                          style: theme.textTheme.bodyMedium,
                        ),
                        SizedBox(width: 4),
                        Text(
                          '(${course.reviewCount} reviews)',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.secondary,
                          ),
                        ),
                        Spacer(),
                        Text(
                          '\$${course.price}',
                          style: theme.textTheme.titleLarge?.copyWith(
                            color: theme.colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Text(course.description, style: theme.textTheme.bodyLarge),
                    SizedBox(height: 16),
                    CourseInfoCard(course: course),
                    SizedBox(height: 24),
                    Text(
                      'Course Content',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    LessonList(
                      courseId: widget.courseId,
                      isUnlocked: isUnlocked,
                      onLessonComplete: () => setState(() {}),
                    ),
                    SizedBox(height: 24),
                    ReviewSection(courseId: widget.courseId),
                    SizedBox(height: 16),
                    ActionButtons(course: course),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: course.isPremium && !isUnlocked
            ? Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: theme.scaffoldBackgroundColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: Offset(0, -5),
                    ),
                  ],
                ),
                child: ElevatedButton(
                  onPressed: () {
                    //payment screen
                    Get.toNamed(
                      AppRoutes.payment,
                      arguments: {
                        'courseId': widget.courseId,
                        'courseName': course.title,
                        'price': course.price,
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.primary,
                    padding: EdgeInsets.all(16),
                  ),
                  child: Text('Buy Now for \$${course.price}'),
                ),
              )
            : null,
      ),
    );
  }
}
