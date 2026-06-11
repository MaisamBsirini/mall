import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';

class ProductsTopBar
    extends StatelessWidget {
  const ProductsTopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.w(
          context,
          0.06,
        ),

        vertical: AppSizes.h(
          context,
          0.02,
        ),
      ),

      child: Row(
        children: [
          Icon(
            Icons.arrow_back,

            color: AppColors.primary,

            size: AppSizes.w(
              context,
              0.075,
            ),
          ),

          Expanded(
            child: Center(
              child: Text(
                "Featured Products",

                style: TextStyle(
                  color: AppColors.primary,

                  fontWeight:
                      FontWeight.w500,

                  fontSize: AppSizes.sp(
                    context,
                    0.060,
                  ),
                ),
              ),
            ),
          ),

          Icon(
            Icons.shopping_bag_outlined,

            color: AppColors.primary,

            size: AppSizes.w(
              context,
              0.075,
            ),
          ),
        ],
      ),
    );
  }
}