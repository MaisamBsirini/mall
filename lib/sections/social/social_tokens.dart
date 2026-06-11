import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../core/constants/app_sizes.dart';
import '../../design_system/scope/design_system_scope.dart';

/// Placeholder slot for future social platform data.
class SocialPlatformSlot {
  final String platformKey;
  final Color accentHint;

  const SocialPlatformSlot({
    required this.platformKey,
    required this.accentHint,
  });
}

class SocialTokens {
  SocialTokens._();

  static const int platformCount = 5;

  static const List<SocialPlatformSlot> platforms = [
    SocialPlatformSlot(platformKey: 'instagram', accentHint: Color(0xFFE1306C)),
    SocialPlatformSlot(platformKey: 'tiktok', accentHint: Color(0xFF00F2EA)),
    SocialPlatformSlot(platformKey: 'facebook', accentHint: Color(0xFF1877F2)),
    SocialPlatformSlot(platformKey: 'youtube', accentHint: Color(0xFFFF0000)),
    SocialPlatformSlot(platformKey: 'pinterest', accentHint: Color(0xFFE60023)),
  ];

  static double horizontalMargin(BuildContext context) =>
      context.ds.tokens.horizontalMargin(context);

  static EdgeInsets sectionPadding(BuildContext context) =>
      context.ds.tokens.sectionPadding(context);

  static double gapXs(BuildContext context) =>
      context.ds.tokens.gapXs(context);

  static double gapSm(BuildContext context) =>
      context.ds.tokens.gapSm(context);

  static double gapMd(BuildContext context) =>
      context.ds.tokens.gapMd(context);

  static double gapLg(BuildContext context) =>
      context.ds.tokens.gapLg(context);

  static BorderRadius borderSm(BuildContext context) =>
      context.ds.tokens.borderSm;

  static BorderRadius borderMd(BuildContext context) =>
      context.ds.tokens.borderMd;

  static BorderRadius borderLg(BuildContext context) =>
      context.ds.tokens.borderLg;

  static Color surface(BuildContext context) =>
      context.ds.palette.surface;

  static List<BoxShadow> cardShadow(BuildContext context) =>
      context.ds.tokens.cardShadow(context);

  static List<BoxShadow> elevatedShadow(BuildContext context) =>
      context.ds.tokens.elevatedShadow(context);

  static LinearGradient glassBackgroundGradient(BuildContext context) =>
      context.ds.tokens.glassBackgroundGradient();

  static Widget shimmerBox(
    BuildContext context, {
    double? width,
    double? height,
    BorderRadius? borderRadius,
    BoxShape shape = BoxShape.rectangle,
  }) {
    return context.ds.placeholders.shimmerBox(
      width: width,
      height: height,
      borderRadius: borderRadius,
      shape: shape,
    );
  }

  static Widget textLine(
    BuildContext context, {
    double widthFactor = 0.28,
    double heightFactor = 0.008,
  }) {
    return context.ds.placeholders.textLine(
      context,
      widthFactor: widthFactor,
      heightFactor: heightFactor,
    );
  }

  static Widget sectionHeader(BuildContext context) {
    return context.ds.placeholders.sectionHeader(context);
  }

  static Widget profileImage(
    BuildContext context, {
    required double size,
    double borderWidth = 3,
  }) {
    final palette = context.ds.palette;

    return Container(
      padding: EdgeInsets.all(borderWidth),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            palette.primary,
            palette.accent,
          ],
        ),
        boxShadow: elevatedShadow(context),
      ),
      child: context.ds.placeholders.imagePlaceholder(
        width: size,
        height: size,
        shape: BoxShape.circle,
      ),
    );
  }

  static Widget platformIcon(
    BuildContext context, {
    required double size,
    required Color accentHint,
    bool elevated = true,
  }) {
    final palette = context.ds.palette;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: palette.surface,
        border: Border.all(
          color: accentHint.withOpacity(0.35),
          width: 1.5,
        ),
        boxShadow: elevated ? cardShadow(context) : null,
      ),
      child: Center(
        child: Container(
          width: size * 0.42,
          height: size * 0.42,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                accentHint.withOpacity(0.55),
                accentHint.withOpacity(0.18),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Widget usernameLine(
    BuildContext context, {
    double widthFactor = 0.24,
  }) {
    return textLine(context, widthFactor: widthFactor, heightFactor: 0.009);
  }

  static Widget followerStat(
    BuildContext context, {
    double widthFactor = 0.14,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textLine(context, widthFactor: widthFactor, heightFactor: 0.010),
        SizedBox(height: gapXs(context)),
        textLine(context, widthFactor: widthFactor * 0.7, heightFactor: 0.006),
      ],
    );
  }

  static Widget ctaPill(BuildContext context, {bool onDark = false}) {
    return context.ds.placeholders.ctaPill(context, onDark: onDark);
  }

  static Offset polarOffset(
    double radius,
    double angleRadians,
  ) {
    return Offset(
      radius * math.cos(angleRadians),
      radius * math.sin(angleRadians),
    );
  }
}
