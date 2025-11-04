import 'package:e_learning_application/models/onboarding_item.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingItem> _pages = [
    OnboardingItem(image: '', title: '', description: ''),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Onboarding Screen')));
  }
}
