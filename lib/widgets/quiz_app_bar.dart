import 'package:flutter/material.dart';
import 'package:flutter_cardgame/theme_manager.dart';

class QuizAppBar extends StatelessWidget implements PreferredSizeWidget {
  const QuizAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // elevation: 4,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Color(0x99FFC107),
              blurRadius: 8,
              offset: Offset(0, 4),
              spreadRadius: 0,
            )
          ],
          borderRadius: BorderRadius.circular(8),
          gradient: const LinearGradient(
            begin: Alignment(0.00, -1.00),
            end: Alignment(0, 1),
            colors: [Color(0xFFFFBB7C), Color(0xFFFFECB3)],
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
      actions: [
        IconButton(
          color: const Color(0xFFE96F00),
          onPressed: () {},
          icon: const Icon(Icons.language),
        ),
        IconButton(
          color: const Color(0xFFE96F00),
          onPressed: () {},
          icon: const Icon(Icons.settings),
        ),
      ],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
