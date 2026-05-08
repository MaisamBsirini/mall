import 'package:flutter/material.dart';

class PreviewTitle extends StatelessWidget {
  final String title;

  const PreviewTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 40,
      left: 0,
      right: 0,
      child: Center(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),

          child: Text(
            title,

            key: ValueKey(title),

            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Color(0xFF4A0E1E),
            ),
          ),
        ),
      ),
    );
  }
}