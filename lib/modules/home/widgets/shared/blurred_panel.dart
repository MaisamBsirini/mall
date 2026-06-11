import 'dart:ui';

import 'package:flutter/material.dart';

class BlurredPanel
    extends StatelessWidget {
  final Widget child;

  const BlurredPanel({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius:
          BorderRadius.circular(30),

      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 12,
          sigmaY: 12,
        ),

        child: Container(
          color:
              Colors.white.withOpacity(
            0.08,
          ),

          child: child,
        ),
      ),
    );
  }
}