import 'package:flutter/material.dart';

class QuizBar extends StatelessWidget implements PreferredSizeWidget {
  const QuizBar({
    super.key,
    this.showBackButton = false,
  });

  final bool showBackButton;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: RichText(
        text: TextSpan(
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
          children: [
            TextSpan(
              text: 'Quiz',
              style: TextStyle(
                color: Colors.blueGrey.shade900,
              ),
            ),
            TextSpan(
              text: 'App',
              style: TextStyle(
                color: Colors.blueGrey.shade300,
              ),
            ),
          ],
        ),
      ),
      leading: showBackButton
          ? IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {},
            )
          : null,
    );
  }
}
