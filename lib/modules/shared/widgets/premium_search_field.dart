import 'package:flutter/material.dart';

import '../../marketplace_home/theme/home_colors.dart';
import '../../marketplace_home/theme/home_typography.dart';

/// Shared search field — identical across Home, Floors, Zones, Stores, Services.
class PremiumSearchField extends StatelessWidget {
  final String hint;
  final double height;

  const PremiumSearchField({
    super.key,
    required this.hint,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    final rtl = Directionality.of(context) == TextDirection.rtl;

    return Container(
      height: height,
      decoration: BoxDecoration(
        color: HomeColors.searchFill,
        borderRadius: BorderRadius.circular(height / 2),
        boxShadow: HomeColors.whisperShadow(blur: 12, y: 2),
      ),
      child: TextField(
        readOnly: true,
        textAlign: rtl ? TextAlign.right : TextAlign.left,
        style: HomeTypography.searchHint(context).copyWith(
          color: HomeColors.textPrimary,
        ),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: HomeTypography.searchHint(context),
          prefixIcon: rtl
              ? null
              : Icon(
                  Icons.search_rounded,
                  color: HomeColors.textMuted,
                  size: height * 0.4,
                ),
          suffixIcon: rtl
              ? Icon(
                  Icons.search_rounded,
                  color: HomeColors.textMuted,
                  size: height * 0.4,
                )
              : null,
          border: InputBorder.none,
          isDense: true,
          contentPadding: EdgeInsets.symmetric(vertical: height * 0.2),
        ),
      ),
    );
  }
}
