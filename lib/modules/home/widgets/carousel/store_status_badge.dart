import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';

class StoreStatusBadge extends StatelessWidget {
  final bool isOpen;

  const StoreStatusBadge({
    super.key,
    required this.isOpen,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.w(context, 0.03),
        vertical: AppSizes.h(context, 0.005),
      ),

      decoration: BoxDecoration(
        color: isOpen
            ? AppColors.primary
                .withOpacity(0.88)
            : Colors.grey.withOpacity(0.7),

        borderRadius:
            BorderRadius.circular(18),
      ),

      child: Text(
        isOpen ? "Open" : "Closed",

        style: TextStyle(
          color: Colors.white,

          fontWeight: FontWeight.w600,

          fontSize:
              AppSizes.sp(context, 0.026),
        ),
      ),
    );
  }
}