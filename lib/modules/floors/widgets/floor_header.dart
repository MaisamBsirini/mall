import 'package:flutter/material.dart';

import '../../marketplace_home/theme/home_colors.dart';
import '../../marketplace_home/theme/home_typography.dart';
import '../l10n/floors_strings.dart';

class FloorHeader extends StatelessWidget {
  final String titleEn;
  final String titleAr;

  const FloorHeader({
    super.key,
    required this.titleEn,
    required this.titleAr,
  });

  @override
  Widget build(BuildContext context) {
    final title = FloorsStrings.isRtl(context) ? titleAr : titleEn;

    return Text(
      title,
      style: HomeTypography.sectionTitle(context).copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: HomeColors.textPrimary,
      ),
    );
  }
}
