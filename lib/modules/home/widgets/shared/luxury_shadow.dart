import 'package:flutter/material.dart';
import 'package:mall/core/constants/app_colors.dart';


class LuxuryShadow {
  static List<BoxShadow> activeShadow = [
    BoxShadow(
      color: AppColors.primary.withOpacity(0.45),
      blurRadius: 30,
      offset: Offset(0, 18),
    ),
  ];

  static List<BoxShadow> inactiveShadow = [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 12,
      offset: Offset(0, 8),
    ),
  ];
}