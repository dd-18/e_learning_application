import 'package:e_learning_application/main_screen.dart';
import 'package:e_learning_application/views/auth/login_screen.dart';
import 'package:e_learning_application/views/auth/register_screen.dart';
import 'package:e_learning_application/views/chat/chat_list_screen.dart';
import 'package:e_learning_application/views/course/analytics_dashboard/analytics_dashboard_screen.dart';
import 'package:e_learning_application/views/course/lesson_screen/lesson_screen.dart';
import 'package:e_learning_application/views/home/home_screen.dart';
import 'package:e_learning_application/views/onboarding/onboarding_screen.dart';
import 'package:e_learning_application/views/quiz/quiz_attempt/quiz_attempt_screen.dart';
import 'package:e_learning_application/views/quiz/quiz_list/quiz_list_screen.dart';
import 'package:e_learning_application/views/teacher/create_course/create_course_screen.dart';
import 'package:e_learning_application/views/teacher/my_course/my_course_screen.dart';
import 'package:e_learning_application/views/teacher/student_progress/student_progress_screen.dart';
import 'package:flutter/material.dart';

import '../views/auth/forgot_password_screen.dart';
import '../views/course/course_detail/course_detail_screen.dart';
import '../views/course/course_list/course_list_screen.dart';
import '../views/course/payment/payment_screen.dart';
import '../views/notifications/notification_screen.dart';
import '../views/profile/edit_profile_screen.dart';
import '../views/profile/profile_screen.dart';
import '../views/splash/splash_screen.dart';
import '../views/teacher/teacher_analytics/teacher_analytics_screen.dart';
import '../views/teacher/teacher_home/teacher_home_screen.dart';

class AppRoutes {
  // main
  static const String main = "/main";

  //auth routes
  static const String splash = "/splash";
  static const String onBoarding = "/onboarding";
  static const String login = "/login";
  static const String register = "/register";
  static const String forgotPassword = "/forgot-password";
  static const String home = "/home";

  // course routes
  static const String courseList = "/courses";
  static const String courseDetail = "/course/:id";
  static const String payment = "/payment";
  static const String analytics = "/analytics";
  static const String lesson = "/lesson/:id";

  // course routes
  static const String quizList = "/quizzes";
  static const String quizAttempt = "/quiz/:id";
  static const String quizResult = "/quiz/result";

  // profile routes
  static const String profile = "/profile";
  static const String editProfile = "/profile/edit";
  static const String notifications = "/notifications";

  // teacher
  static const String teacherHome = "/teacher/home";
  static const String myCourse = "/teacher/courses";
  static const String teacherChats = "/teacher/chats";
  static const String createCourse = "/teacher/courses/create";
  static const String teacherAnalytics = "/teacher/analytics";
  static const String studentProgress = "/teacher/students";

  static Route<dynamic> onGenerateRoute(RouteSettings setting) {
    switch (setting.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case onBoarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case forgotPassword:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
      case main:
        return MaterialPageRoute(
          builder: (_) => MainScreen(
            initialIndex: setting.arguments is Map
                ? (setting.arguments as Map<String, dynamic>)['initialIndex']
                      as int?
                : null,
          ),
        );
      case home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case teacherHome:
        return MaterialPageRoute(builder: (_) => const TeacherHomeScreen());
      case teacherChats:
        return MaterialPageRoute(builder: (_) => const ChatListScreen());
      case myCourse:
        return MaterialPageRoute(builder: (_) => const MyCourseScreen());
      case studentProgress:
        return MaterialPageRoute(builder: (_) => const StudentProgressScreen());
      case createCourse:
        return MaterialPageRoute(builder: (_) => const CreateCourseScreen());
      case teacherAnalytics:
        return MaterialPageRoute(
          builder: (_) => const TeacherAnalyticsScreen(),
        );
      case courseList:
        final args = setting.arguments as Map<String, dynamic>?;
        return MaterialPageRoute(
          builder: (_) => CourseListScreen(
            categoryId: args?['category'] as String?,
            categoryName: args?['categoryName'] as String?,
          ),
        );
      case courseDetail:
        String courseId;
        if (setting.arguments != null) {
          courseId = setting.arguments as String;
        } else {
          final uri = Uri.parse(setting.name ?? '');
          courseId = uri.pathSegments.last;
        }
        return MaterialPageRoute(
          builder: (_) => CourseDetailScreen(courseId: courseId),
        );
      case quizList:
        return MaterialPageRoute(builder: (_) => const QuizListScreen());
      case quizAttempt:
        final quizId = setting.arguments as String?;
        return MaterialPageRoute(
          builder: (_) => QuizAttemptScreen(quizId: quizId ?? ''),
        );
      case lesson:
        final lessonId = setting.arguments as String?;
        return MaterialPageRoute(
          builder: (_) => LessonScreen(lessonId: lessonId ?? ''),
        );
      case profile:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case editProfile:
        return MaterialPageRoute(builder: (_) => const EditProfileScreen());
      case notifications:
        return MaterialPageRoute(builder: (_) => const NotificationScreen());
      case analytics:
        return MaterialPageRoute(builder: (_) => AnalyticsDashboardScreen());
      case payment:
        final args = setting.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => PaymentScreen(
            courseId: args['courseId'] ?? '',
            courseName: args['courseName'] ?? '',
            price: args['price'] ?? 0.0,
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Route not found!'))),
        );
    }
  }
}
