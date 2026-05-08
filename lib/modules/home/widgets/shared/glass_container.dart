import 'dart:ui';
import 'package:flutter/material.dart';

class GlassContainer extends StatelessWidget {
  final Widget child;
  final double radius;
  final double blur;
  final Color color;
  final Border? border;
  final List<BoxShadow>? shadows;

  const GlassContainer({
    super.key,
    required this.child,
    this.radius = 26,
    this.blur = 6,
    this.color = const Color.fromRGBO(255, 255, 255, 0.20),
    this.border,
    this.shadows,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),

      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: blur,
          sigmaY: blur,
        ),

        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            color: color,
            border: border,
            boxShadow: shadows,
          ),

          child: child,
        ),
      ),
    );
  }
}