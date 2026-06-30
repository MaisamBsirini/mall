import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../l10n/home_strings.dart';
import 'home_colors.dart';

/// Locale-aware typography — lighter hierarchy matching the reference.
abstract final class HomeTypography {
  static TextStyle _style(
    BuildContext context, {
    required double size,
    required FontWeight weight,
    Color? color,
    double height = 1.35,
    double? letterSpacing,
  }) {
    final rtl = HomeStrings.isRtl(context);
    final base = rtl ? GoogleFonts.cairo : GoogleFonts.poppins;
    return base(
      fontSize: size,
      fontWeight: weight,
      color: color ?? HomeColors.textPrimary,
      height: height,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle searchHint(BuildContext context) => _style(
        context,
        size: 12,
        weight: FontWeight.w400,
        color: HomeColors.textMuted,
      );

  static TextStyle sectionTitle(BuildContext context) => _style(
        context,
        size: 15,
        weight: FontWeight.w600,
        color: HomeColors.textPrimary,
        height: 1.2,
      );

  static TextStyle sectionAction(BuildContext context) => _style(
        context,
        size: 11,
        weight: FontWeight.w500,
        color: HomeColors.primary,
      );

  static TextStyle bannerTitle(BuildContext context) => _style(
        context,
        size: 14,
        weight: FontWeight.w600,
        color: HomeColors.primary,
        height: 1.25,
      );

  static TextStyle bannerDescription(BuildContext context) => _style(
        context,
        size: 10.5,
        weight: FontWeight.w400,
        color: HomeColors.textSecondary,
        height: 1.45,
      );

  static TextStyle bannerTag(BuildContext context) => _style(
        context,
        size: 9,
        weight: FontWeight.w500,
        color: HomeColors.textMuted,
      );

  static TextStyle bannerCta(BuildContext context) => _style(
        context,
        size: 10.5,
        weight: FontWeight.w600,
        color: Colors.white,
        height: 1,
      );

  static TextStyle categoryLabel(BuildContext context) => _style(
        context,
        size: 10,
        weight: FontWeight.w500,
        color: HomeColors.textPrimary,
        height: 1.2,
      );

  static TextStyle productTitle(BuildContext context) => _style(
        context,
        size: 11.5,
        weight: FontWeight.w600,
        color: HomeColors.textPrimary,
        height: 1.3,
      );

  static TextStyle productPrice(BuildContext context) => _style(
        context,
        size: 11,
        weight: FontWeight.w500,
        color: HomeColors.primary,
        height: 1,
      );

  static TextStyle productRating(BuildContext context) => _style(
        context,
        size: 10,
        weight: FontWeight.w400,
        color: HomeColors.textSecondary,
        height: 1,
      );

  static TextStyle navLabel(BuildContext context, {required bool selected}) =>
      _style(
        context,
        size: selected ? 10 : 9.5,
        weight: selected ? FontWeight.w600 : FontWeight.w500,
        color: selected ? HomeColors.primary : HomeColors.navInactive,
        height: 1,
      );
}
