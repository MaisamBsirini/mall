import 'package:flutter/material.dart';

import '../../core/constants/app_sizes.dart';
import '../../design_system/scope/design_system_scope.dart';

class OffersTokens {
  OffersTokens._();

  static const int showcaseCount = 4;

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

  static Widget sectionTitle(BuildContext context) {
    return Padding(
      padding: sectionPadding(context),
      child: textLine(context, widthFactor: 0.22, heightFactor: 0.009),
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

  static Widget thumbBlock(
    BuildContext context, {
    required double size,
    BorderRadius? borderRadius,
  }) {
    return context.ds.placeholders.shimmerBox(
      width: size,
      height: size,
      borderRadius: borderRadius ?? borderMd(context),
    );
  }

  static const double surfaceBorderWidth = 0.5;

  static Widget offerSurface(
    BuildContext context, {
    required Widget child,
    EdgeInsets? padding,
  }) {
    final palette = context.ds.palette;

    return Container(
      padding: padding ?? EdgeInsets.all(gapSm(context)),
      decoration: BoxDecoration(
        color: palette.surface,
        borderRadius: borderMd(context),
        border: Border.all(
          color: palette.border.withValues(alpha: 0.4),
          width: surfaceBorderWidth,
        ),
      ),
      child: child,
    );
  }

  static Widget discountPlaceholder(BuildContext context) {
    return textLine(context, widthFactor: 0.14, heightFactor: 0.008);
  }

  static Widget subtitlePlaceholder(BuildContext context) {
    return textLine(context, widthFactor: 0.20, heightFactor: 0.006);
  }

  static Widget badgeBlock(
    BuildContext context, {
    required double width,
    required double height,
  }) {
    final palette = context.ds.palette;

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: palette.placeholderLight.withValues(alpha: 0.35),
        borderRadius: borderSm(context),
      ),
      child: Center(
        child: textLine(context, widthFactor: 0.08, heightFactor: 0.007),
      ),
    );
  }

  static Widget circleBlock(BuildContext context, {required double size}) {
    return context.ds.placeholders.shimmerBox(
      width: size,
      height: size,
      shape: BoxShape.circle,
    );
  }

  static double compactCardHeight(
    BuildContext context, {
    required double imageSize,
  }) {
    final surfacePad = gapSm(context);
    final linePrimary = AppSizes.h(context, 0.008);
    final lineSecondary = AppSizes.h(context, 0.006);
    final innerGaps = gapXs(context) + gapXs(context) * 0.5;
    final border = surfaceBorderWidth * 2;

    return border +
        surfacePad * 2 +
        imageSize +
        innerGaps +
        linePrimary +
        lineSecondary;
  }

  static Widget chevronPlaceholder(BuildContext context) {
    return textLine(context, widthFactor: 0.03, heightFactor: 0.012);
  }
}
