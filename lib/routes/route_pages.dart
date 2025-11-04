import 'package:e_learning_application/routes/app_routes.dart';
import 'package:e_learning_application/views/auth/login_screen.dart';
import 'package:e_learning_application/views/home/home_screen.dart';
import 'package:e_learning_application/views/splash/splash_screen.dart';
import 'package:get/get.dart';

import '../views/onboarding/onboarding_screen.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(name: AppRoutes.splash, page: () => SplashScreen()),
    GetPage(name: AppRoutes.onBoarding, page: () => OnboardingScreen()),
    GetPage(name: AppRoutes.login, page: () => LoginScreen()),
    GetPage(name: AppRoutes.home, page: () => HomeScreen()),
  ];
}
