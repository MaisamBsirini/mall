import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';

class CategoryTabItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryTabItem({
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
        duration: const Duration(milliseconds: 300),

        margin: EdgeInsets.symmetric(
          horizontal: AppSizes.w(context, 0.015),
          vertical: AppSizes.h(context, 0.012),
        ),

        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.w(context, 0.055),
        ),

        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primary
              : Colors.transparent,

          borderRadius: BorderRadius.circular(18),

          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: AppColors.primary
                        .withOpacity(0.22),

                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ]
              : [],
        ),

        child: Center(
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 250),

            style: TextStyle(
              color: isSelected
                  ? Colors.white
                  : Colors.grey.shade700,

              fontWeight: FontWeight.w600,

              fontSize:
                  AppSizes.sp(context, 0.034),
            ),

            child: Text(title),
          ),
        ),
      ),
    );
  }
}