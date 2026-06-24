import 'package:flutter/material.dart';

import '../../design_system/scope/design_system_scope.dart';

class CollectionsTokens {
  CollectionsTokens._();

  static const int itemCount = 5;

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

  static List<BoxShadow> subtleShadow(BuildContext context) => [
        BoxShadow(
          color: context.ds.palette.overlayDark.withValues(alpha: 0.04),
          blurRadius: 8,
          offset: const Offset(0, 2),
        ),
      ];

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
    double heightFactor = 0.006,
  }) {
    return context.ds.placeholders.textLine(
      context,
      widthFactor: widthFactor,
      heightFactor: heightFactor,
    );
  }

  static Widget compactHeader(BuildContext context) {
    return Padding(
      padding: sectionPadding(context),
      child: Row(
        children: [
          Expanded(
            child: textLine(
              context,
              widthFactor: 0.30,
              heightFactor: 0.008,
            ),
          ),
          textLine(context, widthFactor: 0.12, heightFactor: 0.007),
        ],
      ),
    );
  }

  static Widget imagePlaceholder(
    BuildContext context, {
    required double width,
    required double height,
    BorderRadius? borderRadius,
    BoxShape shape = BoxShape.rectangle,
  }) {
    return context.ds.placeholders.imagePlaceholder(
      width: width,
      height: height,
      borderRadius: borderRadius,
      shape: shape,
    );
  }

  static Widget cardShell(
    BuildContext context, {
    required Widget child,
    BorderRadius? borderRadius,
    bool elevated = false,
  }) {
    final palette = context.ds.palette;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: surface(context),
        borderRadius: borderRadius ?? borderMd(context),
        border: Border.all(color: palette.border.withValues(alpha: 0.6)),
        boxShadow: elevated ? cardShadow(context) : subtleShadow(context),
      ),
      child: ClipRRect(
        borderRadius: borderRadius ?? borderMd(context),
        child: child,
      ),
    );
  }
}
