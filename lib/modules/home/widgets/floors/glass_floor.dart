import 'package:flutter/material.dart';

import '../shared/glass_container.dart';
import '../shared/luxury_shadow.dart';

class GlassFloor extends StatelessWidget {
  final bool isActive;
  final double parallax;

  const GlassFloor({
    super.key,
    required this.isActive,
    required this.parallax,
  });

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.center,

      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001)
        ..rotateX(1.3)
        ..translate(0.0, parallax * 25),

      child: GlassContainer(
        radius: 26,

        color: Colors.white.withOpacity(
          isActive ? 0.25 : 0.15,
        ),

        border: Border.all(
          color: Colors.white.withOpacity(0.35),
        ),

        shadows: isActive
            ? LuxuryShadow.activeShadow
            : LuxuryShadow.inactiveShadow,

        child: const SizedBox.expand(),
      ),
    );
  }
}