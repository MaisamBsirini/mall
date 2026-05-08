import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';

class AnnouncementCard extends StatelessWidget {
  const AnnouncementCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 2,
              height: AppSizes.h(context, 0.035),
              color: Colors.grey.shade600,
            ),

            SizedBox(width: AppSizes.w(context, 0.30)),

            Container(
              width: 2,
              height: AppSizes.h(context, 0.035),
              color: Colors.grey.shade600,
            ),
          ],
        ),

        Container(
          margin: EdgeInsets.symmetric(
            horizontal: AppSizes.w(context, 0.04),
          ),

          padding: EdgeInsets.all(
            AppSizes.w(context, 0.04),
          ),

          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.95),

            borderRadius: BorderRadius.circular(20),

            border: const Border(
              left: BorderSide(
                color: AppColors.primary,
                width: 5,
              ),

              bottom: BorderSide(
                color: AppColors.primary,
                width: 5,
              ),
            ),

            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 15,
                offset: Offset(0, 8),
              ),
            ],
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Mall Announcement",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: AppSizes.sp(context, 0.035),
                ),
              ),

              SizedBox(
                height: AppSizes.h(context, 0.008),
              ),

              Text(
                "Weekend Luxe Deals: Up to 30% Off",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                  fontSize: AppSizes.sp(context, 0.042),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}