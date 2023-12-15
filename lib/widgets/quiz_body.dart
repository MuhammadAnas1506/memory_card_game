import 'package:flutter/material.dart';
import 'package:flutter_cardgame/theme_manager.dart';

class QuizBody extends StatelessWidget {
  final Widget matchingQuiz;

  const QuizBody({Key? key,
    required this.matchingQuiz
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.secondaryContainer,
                )
              ],
              borderRadius: BorderRadius.circular(8),
              gradient: LinearGradient(
                colors: Theme.of(context).brightness == Brightness.light
                    ? gradientLight
                    : gradientDark,
                stops: const [
                  0.0,
                  0.15,
                  1.0,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Center(
              child: matchingQuiz
            ),
          ),
        ),
      ],
    );
  }
}
