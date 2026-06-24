import 'package:flutter/material.dart';

import '../../design_system/scope/design_system_scope.dart';

/// Shared placeholder building blocks for product list screens.
abstract final class ProductListUi {
  static EdgeInsets pagePadding(BuildContext context) =>
      context.ds.tokens.sectionPadding(context);

  static double gapXs(BuildContext context) => context.ds.tokens.gapXs(context);
  static double gapSm(BuildContext context) => context.ds.tokens.gapSm(context);
  static double gapMd(BuildContext context) => context.ds.tokens.gapMd(context);

  static BorderRadius radiusSm(BuildContext context) =>
      context.ds.tokens.borderSm;
  static BorderRadius radiusMd(BuildContext context) =>
      context.ds.tokens.borderMd;
  static BorderRadius radiusLg(BuildContext context) =>
      context.ds.tokens.borderLg;

  static List<BoxShadow> softShadow(BuildContext context) {
    return [
      BoxShadow(
        color: context.ds.palette.overlayDark.withValues(alpha: 0.08),
        blurRadius: 12,
        offset: const Offset(0, 4),
      ),
    ];
  }

  static Widget line(
    BuildContext context, {
    double widthFactor = 0.5,
    double heightFactor = 0.007,
  }) {
    return context.ds.placeholders.textLine(
      context,
      widthFactor: widthFactor,
      heightFactor: heightFactor,
    );
  }

  static Widget imagePlaceholder(
    BuildContext context, {
    required double height,
    double? width,
    BorderRadius? borderRadius,
  }) {
    return context.ds.placeholders.imagePlaceholder(
      width: width ?? double.infinity,
      height: height,
      borderRadius: borderRadius ?? radiusMd(context),
    );
  }

  static Widget favoriteIcon(BuildContext context) {
    final palette = context.ds.palette;

    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: palette.surface.withValues(alpha: 0.92),
        shape: BoxShape.circle,
        boxShadow: softShadow(context),
      ),
      child: Icon(
        Icons.favorite_border_rounded,
        size: 16,
        color: palette.textSecondary.withValues(alpha: 0.55),
      ),
    );
  }

  static Widget priceBlock(BuildContext context, {double widthFactor = 0.28}) {
    return line(context, widthFactor: widthFactor, heightFactor: 0.008);
  }

  static Widget titleBlock(BuildContext context, {double widthFactor = 0.72}) {
    return line(context, widthFactor: widthFactor, heightFactor: 0.009);
  }

  static Widget sheetHeader(BuildContext context, {bool showActions = true}) {
    final palette = context.ds.palette;

    return Padding(
      padding: EdgeInsets.fromLTRB(
        pagePadding(context).left,
        gapSm(context),
        pagePadding(context).right,
        gapMd(context),
      ),
      child: Column(
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: palette.border,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          SizedBox(height: gapMd(context)),
          Row(
            children: [
              _iconButton(context, Icons.close_rounded),
              SizedBox(width: gapSm(context)),
              Expanded(child: titleBlock(context, widthFactor: 0.42)),
              if (showActions) ...[
                _iconButton(context, Icons.tune_rounded),
                SizedBox(width: gapXs(context)),
                _iconButton(context, Icons.sort_rounded),
              ],
            ],
          ),
          SizedBox(height: gapSm(context)),
          line(context, widthFactor: 0.24, heightFactor: 0.006),
        ],
      ),
    );
  }

  static Widget _iconButton(BuildContext context, IconData icon) {
    final palette = context.ds.palette;

    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: palette.placeholderLight.withValues(alpha: 0.35),
        borderRadius: radiusSm(context),
        border: Border.all(color: palette.border.withValues(alpha: 0.45)),
      ),
      child: Icon(icon, size: 18, color: palette.textSecondary),
    );
  }

  static Widget bookingArrow(BuildContext context) {
    final palette = context.ds.palette;

    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: palette.primarySoft(0.14),
        borderRadius: radiusSm(context),
        border: Border.all(color: palette.primarySoft(0.28)),
      ),
      child: Icon(
        Icons.arrow_forward_rounded,
        size: 18,
        color: palette.primary,
      ),
    );
  }

  static int gridColumns(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    if (width >= 520) return 3;
    return 2;
  }

  static double sheetHeight(BuildContext context) =>
      MediaQuery.sizeOf(context).height * 0.85;
}
