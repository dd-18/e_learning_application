import 'package:e_learning_application/routes/app_routes.dart';
import 'package:e_learning_application/views/auth/login_screen.dart';
import 'package:e_learning_application/views/course/course_detail/course_detail_screen.dart';
import 'package:e_learning_application/views/course/lesson_screen/lesson_screen.dart';
import 'package:e_learning_application/views/home/home_screen.dart';
import 'package:e_learning_application/views/quiz/quiz_list/quiz_list_screen.dart';
import 'package:e_learning_application/views/splash/splash_screen.dart';
import 'package:get/get.dart';

import '../main_screen.dart';
import '../views/auth/forgot_password_screen.dart';
import '../views/auth/register_screen.dart';
import '../views/course/course_list/course_list_screen.dart';
import '../views/course/payment/payment_screen.dart';
import '../views/onboarding/onboarding_screen.dart';
import '../views/profile/profile_screen.dart';
import '../views/teacher/teacher_home_screen.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(name: AppRoutes.splash, page: () => SplashScreen()),
    GetPage(name: AppRoutes.onBoarding, page: () => OnboardingScreen()),
    GetPage(name: AppRoutes.login, page: () => LoginScreen()),
    GetPage(name: AppRoutes.register, page: () => RegisterScreen()),
    GetPage(name: AppRoutes.forgotPassword, page: () => ForgotPasswordScreen()),
    GetPage(
      name: AppRoutes.main,
      page: () => MainScreen(
        initialIndex: Get.arguments is Map<String, dynamic>
            ? Get.arguments['initialIndex'] as int?
            : null,
      ),
    ),
    GetPage(name: AppRoutes.home, page: () => HomeScreen()),
    GetPage(
      name: AppRoutes.courseList,
      page: () => CourseListScreen(
        categoryId: Get.arguments?['categoryId'] as String?,
        categoryName: Get.arguments?['categoryName'] as String?,
      ),
    ),
    GetPage(
      name: '/course/:id',
      page: () => CourseDetailScreen(courseId: Get.parameters['id'] ?? ''),
    ),
    GetPage(name: AppRoutes.quizList, page: () => QuizListScreen()),
    GetPage(
      name: AppRoutes.lesson,
      page: () => LessonScreen(lessonId: Get.parameters['id'] ?? ''),
    ),
    GetPage(
      name: AppRoutes.payment,
      page: () => PaymentScreen(
        courseId: Get.arguments['courseId'] as String,
        courseName: Get.arguments['courseName'] as String,
        price: Get.arguments['price'] as double,
      ),
    ),
    GetPage(name: AppRoutes.profile, page: () => ProfileScreen()),
    GetPage(name: AppRoutes.teacherHome, page: () => TeacherHomeScreen()),
  ];
}
