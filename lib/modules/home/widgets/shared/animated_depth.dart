import 'package:flutter/material.dart';

class AnimatedDepth
    extends StatelessWidget {
  final Widget child;

  final bool isActive;

  const AnimatedDepth({
    super.key,
    required this.child,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      duration:
          const Duration(milliseconds: 300),

      scale: isActive ? 1 : 0.82,

      child: child,
    );
  }
}