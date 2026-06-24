import 'package:flutter/material.dart';

import '../../core/constants/app_sizes.dart';
import '../models/app_palette.dart';

class DesignTokens {
  final AppPalette palette;

  const DesignTokens({
    required this.palette,
  });

  double horizontalMargin(BuildContext context) => AppSizes.w(context, 0.04);

  EdgeInsets sectionPadding(BuildContext context) =>
      EdgeInsets.symmetric(horizontal: horizontalMargin(context));

  double gapXs(BuildContext context) => AppSizes.h(context, 0.006);

  double gapSm(BuildContext context) => AppSizes.h(context, 0.010);

  double gapMd(BuildContext context) => AppSizes.h(context, 0.016);

  double gapLg(BuildContext context) => AppSizes.h(context, 0.024);

  double sectionGap(BuildContext context) => AppSizes.h(context, 0.028);

  double get radiusSm => 10;

  double get radiusMd => 16;

  double get radiusLg => 24;

  BorderRadius get borderSm => BorderRadius.circular(radiusSm);

  BorderRadius get borderMd => BorderRadius.circular(radiusMd);

  BorderRadius get borderLg => BorderRadius.circular(radiusLg);

  List<BoxShadow> cardShadow(BuildContext context) => [
        BoxShadow(
          color: palette.textPrimary.withOpacity(0.06),
          blurRadius: 18,
          offset: const Offset(0, 8),
        ),
      ];

  List<BoxShadow> elevatedShadow(BuildContext context) => [
        BoxShadow(
          color: palette.primary.withOpacity(0.10),
          blurRadius: 24,
          offset: const Offset(0, 12),
        ),
        BoxShadow(
          color: palette.textPrimary.withOpacity(0.05),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ];

  BorderSide borderSide({double? opacity}) => BorderSide(
        color: palette.border.withOpacity(opacity ?? 1.0),
        width: 1.0,
      );

  BoxDecoration cardDecoration(BuildContext context) => BoxDecoration(
        color: palette.surface,
        borderRadius: borderMd,
        border: Border.all(color: palette.border),
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
