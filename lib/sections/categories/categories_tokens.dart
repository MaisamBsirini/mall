import 'package:flutter/material.dart';

import '../../core/constants/app_sizes.dart';
import '../../design_system/scope/design_system_scope.dart';

/// Placeholder slot aligned with [CategoryItem] — icon required, name optional.
class CategorySlot {
  final String icon;
  final String? name;
  final Color accentHint;
  final IconData iconData;

  const CategorySlot({
    required this.icon,
    this.name,
    required this.accentHint,
    required this.iconData,
  });
}

class CategoriesTokens {
  CategoriesTokens._();

  static const int categoryCount = 8;
  static const int gridColumns = 4;

  static const List<CategorySlot> categories = [
    CategorySlot(
      icon: 'devices_outlined',
      name: 'Electronics',
      accentHint: Color(0xFF5B8DEF),
      iconData: Icons.devices_outlined,
    ),
    CategorySlot(
      icon: 'checkroom_outlined',
      name: 'Fashion',
      accentHint: Color(0xFFE879A9),
      iconData: Icons.checkroom_outlined,
    ),
    CategorySlot(
      icon: 'home_outlined',
      name: 'Home',
      accentHint: Color(0xFF7BC47F),
      iconData: Icons.home_outlined,
    ),
    CategorySlot(
      icon: 'spa_outlined',
      name: 'Beauty',
      accentHint: Color(0xFFD4A574),
      iconData: Icons.spa_outlined,
    ),
    CategorySlot(
      icon: 'fitness_center_outlined',
      name: 'Sports',
      accentHint: Color(0xFF6EC1E4),
      iconData: Icons.fitness_center_outlined,
    ),
    CategorySlot(
      icon: 'menu_book_outlined',
      name: 'Books',
      accentHint: Color(0xFF9B8EC4),
      iconData: Icons.menu_book_outlined,
    ),
    CategorySlot(
      icon: 'restaurant_outlined',
      name: 'Food',
      accentHint: Color(0xFFF5A962),
      iconData: Icons.restaurant_outlined,
    ),
    CategorySlot(
      icon: 'flight_outlined',
      name: 'Travel',
      accentHint: Color(0xFF62C4B5),
      iconData: Icons.flight_outlined,
    ),
  ];

  static EdgeInsets sectionPadding(BuildContext context) =>
      context.ds.tokens.sectionPadding(context);

  static double gapXs(BuildContext context) =>
      context.ds.tokens.gapXs(context);

  static double gapSm(BuildContext context) =>
      context.ds.tokens.gapSm(context);

  static double gapMd(BuildContext context) =>
      context.ds.tokens.gapMd(context);

  static BorderRadius borderSm(BuildContext context) =>
      context.ds.tokens.borderSm;

  static BorderRadius borderMd(BuildContext context) =>
      context.ds.tokens.borderMd;

  static Color surface(BuildContext context) =>
      context.ds.palette.surface;

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
            child: textLine(context, widthFactor: 0.26, heightFactor: 0.008),
          ),
          textLine(context, widthFactor: 0.10, heightFactor: 0.006),
        ],
      ),
    );
  }

  static Widget iconBadge(
    BuildContext context, {
    required CategorySlot slot,
    required double size,
    bool filled = false,
  }) {
    final palette = context.ds.palette;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: filled
            ? slot.accentHint.withValues(alpha: 0.12)
            : palette.surface,
        borderRadius: borderSm(context),
        border: Border.all(
          color: slot.accentHint.withValues(alpha: filled ? 0.35 : 0.22),
        ),
      ),
      child: Icon(
        slot.iconData,
        size: size * 0.46,
        color: slot.accentHint.withValues(alpha: 0.72),
      ),
    );
  }

  static Widget optionalNameLabel(
    BuildContext context, {
    CategorySlot? slot,
    double widthFactor = 0.14,
  }) {
    return textLine(context, widthFactor: widthFactor, heightFactor: 0.005);
  }

  static Widget chevron(BuildContext context) {
    return Icon(
      Icons.chevron_right_rounded,
      size: AppSizes.w(context, 0.045),
      color: context.ds.palette.textSecondary.withValues(alpha: 0.4),
    );
  }
}
