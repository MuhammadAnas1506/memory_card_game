import 'package:flutter/material.dart';
import 'package:flutter_cardgame/theme_manager.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer({Key? key, this.child}) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: Theme.of(context).brightness == Brightness.light
              ? gradientLightBody
              : gradientDarkBody,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: child,
    );
  }
}