import 'package:flutter/material.dart';

class FloorHighlight extends StatelessWidget {
  const FloorHighlight({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,

      child: Container(
        height: 1.5,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26),

          gradient: LinearGradient(
            colors: [
              Colors.white.withOpacity(0.8),
              Colors.transparent,
            ],
          ),
        ),
      ),
    );
  }
}