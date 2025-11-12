import 'package:flutter/material.dart';

class QuizAttemptAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String formattedTime;
  final VoidCallback onSubmit;

  const QuizAttemptAppBar({
    super.key,
    required this.formattedTime,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppBar();
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
