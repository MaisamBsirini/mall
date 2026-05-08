import 'package:flutter/material.dart';

class ParallaxTransform extends StatelessWidget {
  final Widget child;
  final double parallax;

  const ParallaxTransform({
    super.key,
    required this.child,
    required this.parallax,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, parallax * 12),
      child: child,
    );
  }
}