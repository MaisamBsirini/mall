import 'package:flutter/material.dart';

class FloorTitle extends StatelessWidget {
  final String title;
  final bool isActive;

  const FloorTitle({
    super.key,
    required this.title,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 40,
      left: 20,

      child: Text(
        title,

        style: TextStyle(
          fontSize: isActive ? 20 : 14,
          fontWeight: FontWeight.bold,
          color: const Color(0xFF6A0D25),
        ),
      ),
    );
  }
}