import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class LuxuryButton
    extends StatelessWidget {
  final String title;

  const LuxuryButton({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.symmetric(
        horizontal: 28,
        vertical: 12,
      ),

      decoration: BoxDecoration(
        color:
            AppColors.primary.withOpacity(
          0.08,
        ),

        borderRadius:
            BorderRadius.circular(30),
      ),

      child: Text(
        title,

        style: const TextStyle(
          color: AppColors.primary,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}