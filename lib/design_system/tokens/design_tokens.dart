import 'package:flutter/material.dart';

import '../../core/constants/app_sizes.dart';
import '../models/app_palette.dart';
import '../models/theme_mood.dart';

class DesignTokens {
  final AppPalette palette;
  final ThemeMood theme;

  const DesignTokens({
    required this.palette,
    required this.theme,
  });

  double _scale(double value) => value * theme.spacingDensity;

  double horizontalMargin(BuildContext context) =>
      AppSizes.w(context, 0.04) * theme.spacingDensity;

  EdgeInsets sectionPadding(BuildContext context) =>
      EdgeInsets.symmetric(horizontal: horizontalMargin(context));

  double gapXs(BuildContext context) =>
      _scale(AppSizes.h(context, 0.006));

  double gapSm(BuildContext context) =>
      _scale(AppSizes.h(context, 0.010));

  double gapMd(BuildContext context) =>
      _scale(AppSizes.h(context, 0.016));

  double gapLg(BuildContext context) =>
      _scale(AppSizes.h(context, 0.024));

  double sectionGap(BuildContext context) =>
      _scale(AppSizes.h(context, 0.028)) * theme.sectionGapScale;

  double get radiusSm => 10 * theme.radiusScale;

  double get radiusMd => 16 * theme.radiusScale;

  double get radiusLg => 24 * theme.radiusScale;

  BorderRadius get borderSm => BorderRadius.circular(radiusSm);

  BorderRadius get borderMd => BorderRadius.circular(radiusMd);

  BorderRadius get borderLg => BorderRadius.circular(radiusLg);

  List<BoxShadow> cardShadow(BuildContext context) => [
        BoxShadow(
          color: palette.textPrimary.withOpacity(
            0.06 * theme.shadowIntensity,
          ),
          blurRadius: 18 * theme.cardElevation,
          offset: Offset(0, 8 * theme.cardElevation),
        ),
      ];

  List<BoxShadow> elevatedShadow(BuildContext context) => [
        BoxShadow(
          color: palette.primary.withOpacity(
            0.10 * theme.shadowIntensity,
          ),
          blurRadius: 24 * theme.cardElevation,
          offset: Offset(0, 12 * theme.cardElevation),
        ),
        BoxShadow(
          color: palette.textPrimary.withOpacity(
            0.05 * theme.shadowIntensity,
          ),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ];

  BorderSide borderSide({double? opacity}) => BorderSide(
        color: palette.border.withOpacity(opacity ?? 1.0),
        width: theme.borderWidth,
      );

  BoxDecoration cardDecoration(BuildContext context) => BoxDecoration(
        color: palette.surface,
        borderRadius: borderMd,
        border: Border.all(
          color: palette.border,
          width: theme.borderWidth,
        ),
        boxShadow: cardShadow(context),
      );

  LinearGradient shimmerGradient() => LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          palette.placeholderMid,
          palette.shimmerHighlight,
          palette.placeholderMid,
        ],
        stops: const [0.0, 0.5, 1.0],
      );

  LinearGradient imagePlaceholderGradient() => LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          palette.primarySoft(0.08),
          palette.placeholderLight,
          palette.placeholderMid,
        ],
      );

  LinearGradient heroOverlayGradient() => LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.transparent,
          palette.overlayDark,
        ],
      );

  LinearGradient glassBackgroundGradient() => LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          palette.primary,
          Color.lerp(palette.primary, palette.background, 0.55)!,
        ],
      );
}
