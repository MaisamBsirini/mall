import 'dart:ui';

import 'package:flutter/material.dart';

class LuxuryGlass extends StatelessWidget {
  final Widget child;

  const LuxuryGlass({
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
          sigmaX: 14,
          sigmaY: 14,
        ),

        child: Container(
          decoration: BoxDecoration(
            color:
                Colors.white.withOpacity(
              0.10,
            ),

            borderRadius:
                BorderRadius.circular(30),

            border: Border.all(
              color:
                  Colors.white.withOpacity(
                0.12,
              ),
            ),
          ),

          child: child,
        ),
      ),
    );
  }
}