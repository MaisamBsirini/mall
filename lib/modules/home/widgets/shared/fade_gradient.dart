import 'package:flutter/material.dart';

class FadeGradient extends StatelessWidget {
  const FadeGradient({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Colors.black.withOpacity(0.55),
            Colors.transparent,
          ],
        ),
      ),
    );
  }
}