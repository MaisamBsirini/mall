import 'package:flutter/material.dart';

import '../../design_system/scope/design_system_scope.dart';
import 'offer_item.dart';
import 'offers_section_data.dart';

class OffersTokens {
  OffersTokens._();

  static const List<OfferItem> mockItems = [
    OfferItem(
      id: 'offer_1',
      productName: 'All Orders',
      image: 'product.jpg',
      discountPercentage: 20,
    ),
    OfferItem(
      id: 'offer_2',
      productName: 'New Users',
      image: 'product_2.jpg',
      discountPercentage: 15,
    ),
    OfferItem(
      id: 'offer_3',
      productName: 'Weekend Sale',
      image: 'product_3.jpg',
      discountPercentage: 30,
    ),
    OfferItem(
      id: 'offer_4',
      productName: 'VIP Members',
      image: 'product_4.jpg',
      discountPercentage: 25,
    ),
  ];

  static const _urgencyLabels = [
    'Today Only',
    '3 Days Left',
    'Today Only',
    'Limited',
  ];

  static const _badgeColors = [
    Color(0xFF7BC47F),
    Color(0xFFF5A962),
    Color(0xFF9B8EC4),
    Color(0xFFE879A9),
  ];

  static const _gridIconColors = [
    Color(0xFF5B8DEF),
    Color(0xFFE879A9),
    Color(0xFF7BC47F),
    Color(0xFFF5A962),
  ];

  static List<OfferItem> resolveItems(OffersSectionData? data) {
    if (data != null && data.items.isNotEmpty) return data.items;
    return mockItems;
  }

  static String discountOff(int percentage) => '$percentage% OFF';

  static String urgencyFor(int index) =>
      _urgencyLabels[index % _urgencyLabels.length];

  static Color badgeColorFor(int index) =>
      _badgeColors[index % _badgeColors.length];

  static Color gridIconColorFor(int index) =>
      _gridIconColors[index % _gridIconColors.length];

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

  static Widget sectionTitle(BuildContext context, {String title = 'Offers'}) {
    return Padding(
      padding: sectionPadding(context),
      child: Text(
        title,
        style: context.ds.typography.title(context).copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
      ),
    );
  }

  static Widget thumbImage(
    BuildContext context, {
    required double size,
    BorderRadius? borderRadius,
  }) {
    return context.ds.placeholders.imagePlaceholder(
      width: size,
      height: size,
      borderRadius: borderRadius ?? borderMd(context),
    );
  }

  static TextStyle discountStyle(BuildContext context) {
    return context.ds.typography.caption(context).copyWith(
          fontWeight: FontWeight.w800,
          fontSize: 13,
        );
  }

  static TextStyle subtitleStyle(BuildContext context) {
    return context.ds.typography.caption(context).copyWith(
          color: context.ds.palette.textSecondary,
          fontSize: 11,
        );
  }

  static Widget percentCircle(
    BuildContext context, {
    required int index,
    required double size,
  }) {
    final color = badgeColorFor(index).withValues(alpha: 0.18);

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: Icon(
        Icons.percent_rounded,
        size: size * 0.42,
        color: badgeColorFor(index),
      ),
    );
  }

  static Widget leftBadge(
    BuildContext context, {
    required int percentage,
    required Color color,
    required double width,
    required double height,
  }) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.22),
        borderRadius: borderSm(context),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$percentage%',
            style: context.ds.typography.caption(context).copyWith(
                  fontWeight: FontWeight.w800,
                  fontSize: 13,
                  color: color.withValues(alpha: 0.95),
                  height: 1,
                ),
          ),
          Text(
            'OFF',
            style: context.ds.typography.caption(context).copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 9,
                  color: color.withValues(alpha: 0.85),
                  letterSpacing: 0.5,
                ),
          ),
        ],
      ),
    );
  }

  static Widget gridIconCircle(
    BuildContext context, {
    required int index,
    required double size,
  }) {
    final color = gridIconColorFor(index);

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color.withValues(alpha: 0.15),
      ),
      child: Icon(
        Icons.local_offer_outlined,
        size: size * 0.46,
        color: color,
      ),
    );
  }

  static Widget chevron(BuildContext context) {
    return Icon(
      Icons.chevron_right_rounded,
      size: 20,
      color: context.ds.palette.textSecondary.withValues(alpha: 0.45),
    );
  }
}
