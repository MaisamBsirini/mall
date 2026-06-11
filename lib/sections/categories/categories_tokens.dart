import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../core/constants/app_sizes.dart';
import '../../design_system/scope/design_system_scope.dart';

/// Placeholder slot for future category data.
class CategorySlot {
  final String categoryKey;
  final Color accentHint;
  final IconData iconHint;

  const CategorySlot({
    required this.categoryKey,
    required this.accentHint,
    required this.iconHint,
  });
}

enum CategoryIconShape { circle, rounded, square, diamond }

class CategoriesTokens {
  CategoriesTokens._();

  static const int categoryCount = 8;

  static const List<CategorySlot> categories = [
    CategorySlot(
      categoryKey: 'electronics',
      accentHint: Color(0xFF5B8DEF),
      iconHint: Icons.devices_outlined,
    ),
    CategorySlot(
      categoryKey: 'fashion',
      accentHint: Color(0xFFE879A9),
      iconHint: Icons.checkroom_outlined,
    ),
    CategorySlot(
      categoryKey: 'home',
      accentHint: Color(0xFF7BC47F),
      iconHint: Icons.home_outlined,
    ),
    CategorySlot(
      categoryKey: 'beauty',
      accentHint: Color(0xFFD4A574),
      iconHint: Icons.spa_outlined,
    ),
    CategorySlot(
      categoryKey: 'sports',
      accentHint: Color(0xFF6EC1E4),
      iconHint: Icons.fitness_center_outlined,
    ),
    CategorySlot(
      categoryKey: 'books',
      accentHint: Color(0xFF9B8EC4),
      iconHint: Icons.menu_book_outlined,
    ),
    CategorySlot(
      categoryKey: 'food',
      accentHint: Color(0xFFF5A962),
      iconHint: Icons.restaurant_outlined,
    ),
    CategorySlot(
      categoryKey: 'travel',
      accentHint: Color(0xFF62C4B5),
      iconHint: Icons.flight_outlined,
    ),
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

  static Widget titleLine(
    BuildContext context, {
    double widthFactor = 0.22,
  }) {
    return textLine(context, widthFactor: widthFactor, heightFactor: 0.008);
  }

  static Widget itemCountBadge(
    BuildContext context, {
    double widthFactor = 0.10,
    bool compact = false,
  }) {
    final palette = context.ds.palette;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.w(context, compact ? 0.018 : 0.025),
        vertical: AppSizes.h(context, compact ? 0.004 : 0.006),
      ),
      decoration: BoxDecoration(
        color: palette.primarySoft(0.08),
        borderRadius: borderSm(context),
      ),
      child: textLine(
        context,
        widthFactor: widthFactor,
        heightFactor: compact ? 0.005 : 0.006,
      ),
    );
  }

  static Widget iconPlaceholder(
    BuildContext context, {
    required double size,
    required CategorySlot slot,
    CategoryIconShape shape = CategoryIconShape.circle,
    bool filled = false,
  }) {
    final palette = context.ds.palette;

    BoxDecoration decoration;
    switch (shape) {
      case CategoryIconShape.circle:
        decoration = BoxDecoration(
          shape: BoxShape.circle,
          color: filled ? slot.accentHint.withOpacity(0.15) : palette.surface,
          border: Border.all(color: slot.accentHint.withOpacity(0.30)),
        );
      case CategoryIconShape.rounded:
        decoration = BoxDecoration(
          color: filled ? slot.accentHint.withOpacity(0.15) : palette.surface,
          borderRadius: borderSm(context),
          border: Border.all(color: slot.accentHint.withOpacity(0.30)),
        );
      case CategoryIconShape.square:
        decoration = BoxDecoration(
          color: filled ? slot.accentHint.withOpacity(0.12) : palette.surface,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: slot.accentHint.withOpacity(0.25)),
        );
      case CategoryIconShape.diamond:
        decoration = const BoxDecoration(color: Colors.transparent);
    }

    if (shape == CategoryIconShape.diamond) {
      return SizedBox(
        width: size,
        height: size,
        child: Transform.rotate(
          angle: math.pi / 4,
          child: Container(
            decoration: BoxDecoration(
              color: filled ? slot.accentHint.withOpacity(0.15) : palette.surface,
              borderRadius: borderSm(context),
              border: Border.all(color: slot.accentHint.withOpacity(0.30)),
            ),
            child: Transform.rotate(
              angle: -math.pi / 4,
              child: Icon(
                slot.iconHint,
                size: size * 0.38,
                color: slot.accentHint.withOpacity(0.55),
              ),
            ),
          ),
        ),
      );
    }

    return Container(
      width: size,
      height: size,
      decoration: decoration,
      child: Icon(
        slot.iconHint,
        size: size * 0.42,
        color: slot.accentHint.withOpacity(filled ? 0.70 : 0.50),
      ),
    );
  }

  static Widget navLabel(
    BuildContext context, {
    double widthFactor = 0.14,
    bool withCount = true,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        titleLine(context, widthFactor: widthFactor),
        if (withCount) ...[
          SizedBox(height: gapXs(context)),
          itemCountBadge(context, widthFactor: widthFactor * 0.7, compact: true),
        ],
      ],
    );
  }

  static Offset polarOffset(double radius, double angleRadians) {
    return Offset(
      radius * math.cos(angleRadians),
      radius * math.sin(angleRadians),
    );
  }
}
