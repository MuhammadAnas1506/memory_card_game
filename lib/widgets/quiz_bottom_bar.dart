import 'package:flutter/material.dart';
import 'package:flutter_cardgame/theme_manager.dart';

class QuizBottomBar extends StatelessWidget {
  const QuizBottomBar
      ({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Color(0x99FFC107),
              blurRadius: 8,
              offset: Offset(0, 0),
              spreadRadius: 2,
            )
          ],
          gradient: LinearGradient(
            colors: Theme.of(context).brightness == Brightness.light
                ? gradientLightBottomBar
                : gradientDarkBottomBar,
            stops: const [
              0.0,
              0.85,
              1.0,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {},
              color: const Color(0xFFE96F00),
              icon: const Icon(
                Icons.navigate_before,
                size: 40,
              ),
            ),
            Container(
              width: 44,
              height: 20,
              decoration: const ShapeDecoration(
                shape: StadiumBorder(),
                color: Color(0xFFFFF8E1),
                shadows: [
                  BoxShadow(
                    color: Color(0x66FFC107),
                    blurRadius: 8,
                    offset: Offset(0, 0),
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  "1",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ),
            IconButton(
              color: const Color(0xFFE96F00),
              onPressed: () {},
              icon: const Icon(
                Icons.navigate_next,
                size: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
