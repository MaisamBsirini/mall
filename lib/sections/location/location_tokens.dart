import 'package:flutter/material.dart';

import '../../core/constants/app_sizes.dart';
import '../../design_system/scope/design_system_scope.dart';

class LocationTokens {
  LocationTokens._();

  static double bannerHeight(BuildContext context) => AppSizes.h(context, 0.12);

  static EdgeInsets sectionPadding(BuildContext context) =>
      context.ds.tokens.sectionPadding(context);

  static double gapXs(BuildContext context) =>
      context.ds.tokens.gapXs(context);

  static double gapSm(BuildContext context) =>
      context.ds.tokens.gapSm(context);

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

  static Widget pinDot(BuildContext context, {double size = 10}) {
    return context.ds.placeholders.shimmerBox(
      width: size,
      height: size,
      shape: BoxShape.circle,
    );
  }

  /// Minimal banner for overlay component previews.
  static Widget mockBanner(BuildContext context) {
    final palette = context.ds.palette;
    final height = bannerHeight(context);

    return ClipRRect(
      borderRadius: borderMd(context),
      child: SizedBox(
        height: height,
        width: double.infinity,
        child: Stack(
          fit: StackFit.expand,
          children: [
            context.ds.placeholders.placeholderBox(
              height: height,
              borderRadius: borderMd(context),
              gradient: context.ds.tokens.imagePlaceholderGradient(),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    palette.overlayDark.withValues(alpha: 0.35),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Banner + small overlay widget — store owner picks style + anchor.
  static Widget bannerWithOverlay(
    BuildContext context, {
    required Widget overlay,
    Alignment alignment = Alignment.topRight,
    EdgeInsets overlayPadding = const EdgeInsets.all(8),
  }) {
    return Padding(
      padding: sectionPadding(context),
      child: SizedBox(
        height: bannerHeight(context),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned.fill(child: mockBanner(context)),
            Positioned.fill(
              child: Padding(
                padding: overlayPadding,
                child: Align(alignment: alignment, child: overlay),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget glassChip(
    BuildContext context, {
    required Widget child,
    EdgeInsets? padding,
  }) {
    final palette = context.ds.palette;

    return Container(
      padding: padding ??
          EdgeInsets.symmetric(
            horizontal: AppSizes.w(context, 0.028),
            vertical: AppSizes.h(context, 0.007),
          ),
      decoration: BoxDecoration(
        color: palette.glassFill,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: palette.glassBorder),
        boxShadow: cardShadow(context),
      ),
      child: child,
    );
  }

  static Widget fabCircle(
    BuildContext context, {
    required double size,
    required Widget child,
  }) {
    final palette = context.ds.palette;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: surface(context),
        border: Border.all(color: palette.border.withValues(alpha: 0.5)),
        boxShadow: elevatedShadow(context),
      ),
      child: Center(child: child),
    );
  }
}
