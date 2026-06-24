import 'package:flutter/material.dart';

import '../../design_system/scope/design_system_scope.dart';
import 'staff_item.dart';

class StaffTokens {
  StaffTokens._();

  static const List<StaffItem> mockItems = [
    StaffItem(
      id: 'staff_1',
      fullName: 'Dr. Amira Hassan',
      role: 'Dermatology Specialist',
      profileImageUrl: 'staff.jpg',
      shortBio: '10+ years experience.',
    ),
    StaffItem(
      id: 'staff_2',
      fullName: 'Dr. James Chen',
      role: 'Aesthetic Medicine',
      profileImageUrl: 'staff_2.jpg',
      shortBio: 'Board-certified with a focus on skin rejuvenation.',
    ),
    StaffItem(
      id: 'staff_3',
      fullName: 'Sarah Al-Rashid',
      role: 'Lead Esthetician',
      profileImageUrl: 'staff_3.jpg',
      shortBio: 'Specializing in advanced facial treatments.',
    ),
    StaffItem(
      id: 'staff_4',
      fullName: 'Michael Torres',
      role: 'Wellness Consultant',
      profileImageUrl: 'staff_4.jpg',
      shortBio: 'Holistic care with a client-first approach.',
    ),
  ];

  static List<StaffItem> resolveItems(List<StaffItem>? items) {
    if (items != null && items.isNotEmpty) return items;
    return mockItems;
  }

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

  static Widget sectionTitle(BuildContext context, {String? title}) {
    return Padding(
      padding: sectionPadding(context),
      child: title != null
          ? Text(
              title,
              style: context.ds.typography.title(context),
            )
          : textLine(context, widthFactor: 0.30, heightFactor: 0.010),
    );
  }

  /// Primary visual — profile photo placeholder.
  static Widget profileImage(
    BuildContext context, {
    required double width,
    required double height,
    BorderRadius? borderRadius,
    bool elevated = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? borderLg(context),
        boxShadow: elevated ? elevatedShadow(context) : cardShadow(context),
      ),
      child: ClipRRect(
        borderRadius: borderRadius ?? borderLg(context),
        child: context.ds.placeholders.imagePlaceholder(
          width: width,
          height: height,
          borderRadius: borderRadius ?? borderLg(context),
        ),
      ),
    );
  }

  static Widget memberNamePlaceholder(BuildContext context) {
    return textLine(context, widthFactor: 0.32, heightFactor: 0.011);
  }

  static Widget memberRolePlaceholder(BuildContext context) {
    return textLine(context, widthFactor: 0.24, heightFactor: 0.008);
  }

  static Widget memberBioPlaceholder(
    BuildContext context, {
    int lines = 2,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(lines, (index) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: index < lines - 1 ? gapXs(context) : 0,
          ),
          child: textLine(
            context,
            widthFactor: 0.42 - (index * 0.06),
            heightFactor: 0.007,
          ),
        );
      }),
    );
  }
}
