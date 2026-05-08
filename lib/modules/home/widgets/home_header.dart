import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class HomeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// SEARCH
        Expanded(
          child: Container(
            height: 50,
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: AppColors.primary),
            ),
            child: Row(
              children: [
                Icon(Icons.search, color: AppColors.primary),
                SizedBox(width: 10),
                Text(
                  "Search stores...",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ),

        SizedBox(width: 10),

        /// PROFILE
        CircleAvatar(
          radius: 22,
          backgroundColor: AppColors.primary,
          child: Icon(Icons.person, color: Colors.white),
        ),

        SizedBox(width: 10),

        /// NOTIFICATION
        Icon(Icons.notifications, color: AppColors.primary),
      ],
    );
  }
}