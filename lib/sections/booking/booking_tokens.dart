import 'package:flutter/material.dart';

import '../../core/constants/app_sizes.dart';
import '../../design_system/scope/design_system_scope.dart';

class MockSpecialist {
  final String key;
  final Color accentHint;

  const MockSpecialist({
    required this.key,
    required this.accentHint,
  });
}

class BookingTokens {
  BookingTokens._();

  static const List<String> mockWeekdays = [
    'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun',
  ];

  static const List<String> mockTimes = [
    '09:00', '09:30', '10:00', '10:30', '11:00',
    '14:00', '14:30', '15:00', '15:30', '16:00', '16:30', '17:00',
  ];

  static const List<MockSpecialist> specialists = [
    MockSpecialist(key: 'specialist_a', accentHint: Color(0xFF5B8DEF)),
    MockSpecialist(key: 'specialist_b', accentHint: Color(0xFFE879A9)),
    MockSpecialist(key: 'specialist_c', accentHint: Color(0xFF7BC47F)),
  ];

  static const int mockSelectedDay = 14;
  static const int mockSelectedTimeIndex = 2;
  static const int mockSelectedDateIndex = 2;

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

  static Widget bookCta(
    BuildContext context, {
    bool fullWidth = true,
    double widthFactor = 0.55,
  }) {
    final palette = context.ds.palette;

    return Container(
      width: fullWidth ? double.infinity : AppSizes.w(context, widthFactor),
      padding: EdgeInsets.symmetric(vertical: AppSizes.h(context, 0.016)),
      decoration: BoxDecoration(
        color: palette.primary,
        borderRadius: borderMd(context),
        boxShadow: elevatedShadow(context),
      ),
      alignment: Alignment.center,
      child: textLine(
        context,
        widthFactor: 0.28,
        heightFactor: 0.008,
      ),
    );
  }

  static Widget timeSlotPill(
    BuildContext context, {
    required bool selected,
    double widthFactor = 0.16,
  }) {
    final palette = context.ds.palette;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.w(context, 0.035),
        vertical: AppSizes.h(context, 0.012),
      ),
      decoration: BoxDecoration(
        color: selected ? palette.primary : palette.surface,
        borderRadius: borderSm(context),
        border: Border.all(
          color: selected ? palette.primary : palette.border,
        ),
        boxShadow: selected ? cardShadow(context) : null,
      ),
      child: textLine(
        context,
        widthFactor: widthFactor,
        heightFactor: 0.007,
      ),
    );
  }

  static Widget dateChip(
    BuildContext context, {
    required bool selected,
    bool compact = false,
  }) {
    final palette = context.ds.palette;
    final width = AppSizes.w(context, compact ? 0.14 : 0.17);

    return Container(
      width: width,
      padding: EdgeInsets.symmetric(vertical: AppSizes.h(context, 0.012)),
      decoration: BoxDecoration(
        color: selected ? palette.primarySoft(0.14) : palette.surface,
        borderRadius: borderMd(context),
        border: Border.all(
          color: selected ? palette.primary : palette.border,
          width: selected ? 1.5 : 1,
        ),
      ),
      child: Column(
        children: [
          textLine(context, widthFactor: 0.08, heightFactor: 0.006),
          SizedBox(height: gapXs(context)),
          textLine(context, widthFactor: 0.06, heightFactor: 0.009),
        ],
      ),
    );
  }

  static Widget specialistAvatar(
    BuildContext context, {
    required MockSpecialist specialist,
    required double size,
    bool selected = false,
  }) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: selected
              ? specialist.accentHint
              : specialist.accentHint.withOpacity(0.25),
          width: selected ? 2.5 : 1,
        ),
        boxShadow: selected ? elevatedShadow(context) : null,
      ),
      child: shimmerBox(context, width: size, height: size, shape: BoxShape.circle),
    );
  }

  static Widget flowStepLabel(
    BuildContext context, {
    required int step,
    required bool active,
  }) {
    final palette = context.ds.palette;

    return Row(
      children: [
        Container(
          width: 22,
          height: 22,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: active ? palette.primary : palette.placeholderLight,
            border: Border.all(
              color: active ? palette.primary : palette.border,
            ),
          ),
          alignment: Alignment.center,
          child: Text(
            '$step',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: active ? palette.onPrimary : palette.textSecondary,
            ),
          ),
        ),
        SizedBox(width: gapSm(context)),
        textLine(context, widthFactor: 0.18, heightFactor: 0.007),
      ],
    );
  }
}
