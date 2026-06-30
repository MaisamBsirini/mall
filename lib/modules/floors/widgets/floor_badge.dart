import 'package:flutter/material.dart';

import '../../marketplace_home/theme/home_colors.dart';
import '../../marketplace_home/theme/home_typography.dart';
import '../l10n/floors_strings.dart';
import '../models/floor_badge_model.dart';

class FloorBadge extends StatelessWidget {
  final FloorBadgeModel badge;

  const FloorBadge({super.key, required this.badge});

  @override
  Widget build(BuildContext context) {
    final label = FloorsStrings.isRtl(context) ? badge.labelAr : badge.labelEn;
    final width = MediaQuery.sizeOf(context).width;

    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.05,
          vertical: width * 0.022,
        ),
        decoration: BoxDecoration(
          color: HomeColors.primarySoft,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: HomeColors.primary.withValues(alpha: 0.9),
            width: 0.6,
          ),
          boxShadow: HomeColors.whisperShadow(blur: 10, y: 2),
        ),
        child: Text(
          label,
          style: HomeTypography.sectionAction(context).copyWith(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: HomeColors.primary,
          ),
        ),
      ),
    );
  }
}
