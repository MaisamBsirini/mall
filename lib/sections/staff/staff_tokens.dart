import 'package:flutter/material.dart';

import '../../core/constants/app_sizes.dart';
import '../../design_system/scope/design_system_scope.dart';

/// Placeholder slot for future staff member data.
class StaffMemberSlot {
  final String memberKey;
  final Color accentHint;

  const StaffMemberSlot({
    required this.memberKey,
    required this.accentHint,
  });
}

enum StaffImageShape { circle, roundedSquare, roundedRectangle }

class StaffTokens {
  StaffTokens._();

  static const int memberCount = 4;

  static const List<StaffMemberSlot> members = [
    StaffMemberSlot(memberKey: 'member_a', accentHint: Color(0xFF5B8DEF)),
    StaffMemberSlot(memberKey: 'member_b', accentHint: Color(0xFFE879A9)),
    StaffMemberSlot(memberKey: 'member_c', accentHint: Color(0xFF7BC47F)),
    StaffMemberSlot(memberKey: 'member_d', accentHint: Color(0xFFD4A574)),
  ];

  static const List<StaffImageShape> alternatingShapes = [
    StaffImageShape.circle,
    StaffImageShape.roundedSquare,
    StaffImageShape.roundedRectangle,
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

  static Widget nameLine(
    BuildContext context, {
    double widthFactor = 0.32,
  }) {
    return textLine(context, widthFactor: widthFactor, heightFactor: 0.011);
  }

  static Widget roleLine(
    BuildContext context, {
    double widthFactor = 0.24,
  }) {
    return textLine(context, widthFactor: widthFactor, heightFactor: 0.008);
  }

  static Widget bioLine(
    BuildContext context, {
    double widthFactor = 0.40,
  }) {
    return textLine(context, widthFactor: widthFactor, heightFactor: 0.007);
  }

  static Widget bioBlock(
    BuildContext context, {
    int lines = 2,
    double widthFactor = 0.42,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(lines, (index) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: index < lines - 1 ? gapXs(context) : 0,
          ),
          child: bioLine(
            context,
            widthFactor: widthFactor - (index * 0.06),
          ),
        );
      }),
    );
  }

  static Widget profileImage(
    BuildContext context, {
    required double width,
    required double height,
    required StaffImageShape shape,
    Color? accentHint,
    bool elevated = false,
  }) {
    final palette = context.ds.palette;
    final accent = accentHint ?? palette.primary;

    switch (shape) {
      case StaffImageShape.circle:
        return Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: accent.withOpacity(0.25), width: 2),
            boxShadow: elevated ? elevatedShadow(context) : cardShadow(context),
          ),
          child: context.ds.placeholders.imagePlaceholder(
            width: width,
            height: height,
            shape: BoxShape.circle,
          ),
        );
      case StaffImageShape.roundedSquare:
        return Container(
          decoration: BoxDecoration(
            borderRadius: borderMd(context),
            border: Border.all(color: accent.withOpacity(0.22)),
            boxShadow: elevated ? elevatedShadow(context) : cardShadow(context),
          ),
          child: context.ds.placeholders.imagePlaceholder(
            width: width,
            height: height,
            borderRadius: borderMd(context),
          ),
        );
      case StaffImageShape.roundedRectangle:
        return Container(
          decoration: BoxDecoration(
            borderRadius: borderLg(context),
            border: Border.all(color: accent.withOpacity(0.20)),
            boxShadow: elevated ? elevatedShadow(context) : cardShadow(context),
          ),
          child: context.ds.placeholders.imagePlaceholder(
            width: width,
            height: height,
            borderRadius: borderLg(context),
          ),
        );
    }
  }

  static (double width, double height) imageSizeForShape(
    BuildContext context,
    StaffImageShape shape, {
    double base = 0.28,
  }) {
    final w = AppSizes.w(context, base);
    return switch (shape) {
      StaffImageShape.circle => (w, w),
      StaffImageShape.roundedSquare => (w, w),
      StaffImageShape.roundedRectangle => (w * 1.15, w * 0.82),
    };
  }
}
