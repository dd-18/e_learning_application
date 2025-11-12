import 'dart:async';

import 'package:e_learning_application/core/theme/app_colors.dart';
import 'package:e_learning_application/models/quiz.dart';
import 'package:e_learning_application/models/quiz_attempt.dart';
import 'package:e_learning_application/services/dummy_data_service.dart';
import 'package:e_learning_application/views/quiz/quiz_attempt/widgets/quiz_attempt_app_bar.dart';
import 'package:flutter/material.dart';

class QuizAttemptScreen extends StatefulWidget {
  final String quizId;

  const QuizAttemptScreen({super.key, required this.quizId});

  @override
  State<QuizAttemptScreen> createState() => _QuizAttemptScreenState();
}

class _QuizAttemptScreenState extends State<QuizAttemptScreen> {
  late final Quiz quiz;
  late final PageController _pageController;
  int _currentPage = 0;
  Map<String, String> selectedAnswers = {};
  int remainingSeconds = 0;
  Timer? _timer;
  QuizAttempt? currentAttempt;

  @override
  void initState() {
    super.initState();
    quiz = DummyDataService.getQuizById(widget.quizId);
    _pageController = PageController();
    _pageController.addListener(_onPageChanged);
    remainingSeconds = quiz.timeLimit * 60;
    _startTimer();
  }

  void _onPageChanged() {
    if (_pageController.page != null) {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds > 0) {
        setState(() {
          remainingSeconds--;
        });
      } else {
        _submitQuiz();
      }
    });
  }

  void _submitQuiz() {
    _timer?.cancel();
    final score = calculateScore();
    currentAttempt = QuizAttempt(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      quizId: quiz.id,
      userId: 'Current user is ',
      answers: selectedAnswers,
      score: score,
      startedAt: DateTime.now().subtract(
        Duration(seconds: quiz.timeLimit * 60 - remainingSeconds),
      ),
      completedAt: DateTime.now(),
      timeSpent: quiz.timeLimit * 60 - remainingSeconds,
    );
    DummyDataService.saveQuizAttempt(currentAttempt!);
  }

  int calculateScore() {
    int score = 0;
    for (final question in quiz.questions) {
      if (selectedAnswers[question.id] == question.correctOptionId) {
        score += question.points;
      }
    }
    return score;
  }

  String get formattedTime {
    final minutes = (remainingSeconds / 60).floor();
    final seconds = remainingSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      appBar: QuizAttemptAppBar(
        formattedTime: formattedTime,
        onSubmit: () => _showSubmitDialog(context),
      ),
    );
  }

  Future<void> _showSubmitDialog(BuildContext context) async {}
}
