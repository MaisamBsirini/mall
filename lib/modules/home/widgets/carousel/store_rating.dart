import 'package:flutter/material.dart';

import '../../../../core/constants/app_sizes.dart';

class StoreRating extends StatelessWidget {
  final double rating;

  const StoreRating({
    super.key,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star_rounded,
          color: Colors.amber,

          size: AppSizes.sp(context, 0.04),
        ),

        SizedBox(
          width: AppSizes.w(context, 0.01),
        ),

        Text(
          rating.toString(),

          style: TextStyle(
            color: Colors.white,

            fontWeight: FontWeight.w600,

            fontSize:
                AppSizes.sp(context, 0.03),
          ),
        ),
      ],
    );
  }
}