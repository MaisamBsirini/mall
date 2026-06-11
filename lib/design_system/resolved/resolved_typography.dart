import 'package:flutter/material.dart';

import '../../core/constants/app_sizes.dart';
import '../models/app_palette.dart';
import '../models/typography_profile.dart';

class ResolvedTypography {
  final TypographyProfile profile;
  final AppPalette palette;

  const ResolvedTypography({
    required this.profile,
    required this.palette,
  });

  TextStyle _base(
    BuildContext context, {
    required double sizeFactor,
    required double weight,
    required double letterSpacing,
    required double lineHeight,
    required Color color,
  }) {
    return TextStyle(
      fontFamily: profile.fontFamily,
      fontFamilyFallback: profile.fontFamilyFallback != null
          ? [profile.fontFamilyFallback!]
          : null,
      fontSize: AppSizes.sp(context, sizeFactor),
      fontWeight: _fontWeight(weight),
      letterSpacing: letterSpacing,
      height: lineHeight,
      color: color,
    );
  }

  TextStyle heading(BuildContext context) => _base(
        context,
        sizeFactor: 0.052 * profile.headingScale,
        weight: profile.headingWeight,
        letterSpacing: profile.headingLetterSpacing,
        lineHeight: profile.headingLineHeight,
        color: palette.textPrimary,
      );

  TextStyle title(BuildContext context) => _base(
        context,
        sizeFactor: 0.044 * profile.titleScale,
        weight: profile.titleWeight,
        letterSpacing: profile.titleLetterSpacing,
        lineHeight: profile.titleLineHeight,
        color: palette.textPrimary,
      );

  TextStyle subtitle(BuildContext context) => _base(
        context,
        sizeFactor: 0.036 * profile.bodyScale,
        weight: profile.bodyWeight,
        letterSpacing: profile.bodyLetterSpacing,
        lineHeight: profile.bodyLineHeight,
        color: palette.textSecondary,
      );

  TextStyle body(BuildContext context) => _base(
        context,
        sizeFactor: 0.034 * profile.bodyScale,
        weight: profile.bodyWeight,
        letterSpacing: profile.bodyLetterSpacing,
        lineHeight: profile.bodyLineHeight,
        color: palette.textPrimary,
      );

  TextStyle caption(BuildContext context) => _base(
        context,
        sizeFactor: 0.028 * profile.captionScale,
        weight: 500,
        letterSpacing: profile.captionLetterSpacing,
        lineHeight: profile.captionLineHeight,
        color: palette.textSecondary,
      );

  TextStyle button(BuildContext context) => _base(
        context,
        sizeFactor: 0.032 * profile.buttonScale,
        weight: profile.buttonWeight,
        letterSpacing: profile.buttonLetterSpacing,
        lineHeight: 1.2,
        color: palette.primary,
      );

  TextStyle titleOnPrimary(BuildContext context) => title(context).copyWith(
        color: palette.onPrimary,
      );

  TextStyle titleOnDark(BuildContext context) => title(context).copyWith(
        color: palette.isDark ? palette.textPrimary : Colors.white,
      );

  TextStyle subtitleOnDark(BuildContext context) => subtitle(context).copyWith(
        color: palette.isDark
            ? palette.textSecondary
            : Colors.white.withOpacity(0.85),
      );

  TextStyle label(BuildContext context) => caption(context);

  TextStyle cta(BuildContext context) => button(context);

  TextStyle ctaOnDark(BuildContext context) => button(context).copyWith(
        color: palette.isDark ? palette.textPrimary : Colors.white,
      );

  TextStyle badge(BuildContext context) => caption(context).copyWith(
        fontWeight: FontWeight.w600,
        letterSpacing: 0.8,
        color: palette.onPrimary,
      );

  static FontWeight _fontWeight(double value) {
    final rounded = value.round();
    return FontWeight.values.firstWhere(
      (weight) => weight.value == rounded,
      orElse: () => FontWeight.w400,
    );
  }
}
