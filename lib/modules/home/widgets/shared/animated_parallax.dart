import 'package:flutter/material.dart';

class AnimatedParallax extends StatelessWidget {
  final double parallax;
  final Widget child;

  const AnimatedParallax({
    super.key,
    required this.parallax,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(parallax * 20, 0),
      child: child,
    );
  }
}