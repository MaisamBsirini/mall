import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';

class SizeChip extends StatelessWidget {
  final String title;

  final bool isSelected;

  final VoidCallback onTap;

  const SizeChip({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,

      child: AnimatedContainer(
        duration:
            const Duration(
          milliseconds: 300,
        ),

        margin:
            const EdgeInsets.symmetric(
          horizontal: 8,
        ),

        padding: EdgeInsets.symmetric(
          horizontal:
              AppSizes.w(context, 0.05),

          vertical:
              AppSizes.h(context, 0.012),
        ),

        decoration: BoxDecoration(
          color: isSelected
              ? Colors.white
              : Colors.transparent,

          borderRadius:
              BorderRadius.circular(30),

          border: Border.all(
            color: isSelected
                ? AppColors.primary
                : Colors.grey.shade300,
          ),
        ),

        child: Text(
          title,

          style: TextStyle(
            color: isSelected
                ? AppColors.primary
                : Colors.grey.shade700,

            fontWeight:
                FontWeight.w500,

            fontSize: AppSizes.sp(
              context,
              0.045,
            ),
          ),
        ),
      ),
    );
  }
}