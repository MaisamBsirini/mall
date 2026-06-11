import 'package:flutter/material.dart';

import '../../core/constants/app_sizes.dart';
import '../../design_system/scope/design_system_scope.dart';

/// Placeholder slot for future certification / award data.
class AchievementSlot {
  final String typeKey;
  final Color accentHint;

  const AchievementSlot({
    required this.typeKey,
    required this.accentHint,
  });
}

enum BadgeShape { circle, shield, medallion }

class CertificationsTokens {
  CertificationsTokens._();

  static const int itemCount = 5;

  static const List<AchievementSlot> achievements = [
    AchievementSlot(typeKey: 'certificate', accentHint: Color(0xFFC9A962)),
    AchievementSlot(typeKey: 'license', accentHint: Color(0xFF8B7355)),
    AchievementSlot(typeKey: 'award', accentHint: Color(0xFFD4AF37)),
    AchievementSlot(typeKey: 'accreditation', accentHint: Color(0xFF6B8E9F)),
    AchievementSlot(typeKey: 'diploma', accentHint: Color(0xFF9B7E6B)),
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
    double widthFactor = 0.32,
  }) {
    return textLine(context, widthFactor: widthFactor, heightFactor: 0.010);
  }

  static Widget organizationLine(
    BuildContext context, {
    double widthFactor = 0.24,
  }) {
    return textLine(context, widthFactor: widthFactor, heightFactor: 0.007);
  }

  static Widget dateLine(
    BuildContext context, {
    double widthFactor = 0.14,
  }) {
    return textLine(context, widthFactor: widthFactor, heightFactor: 0.006);
  }

  static Widget credentialLine(
    BuildContext context, {
    double widthFactor = 0.20,
  }) {
    return textLine(context, widthFactor: widthFactor, heightFactor: 0.006);
  }

  static Widget certificateImage(
    BuildContext context, {
    required double width,
    required double height,
    bool featured = false,
    Color? accentHint,
  }) {
    final palette = context.ds.palette;
    final accent = accentHint ?? palette.accent;

    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(featured ? 6 : 4),
      decoration: BoxDecoration(
        color: palette.surface,
        borderRadius: borderMd(context),
        border: Border.all(
          color: accent.withOpacity(featured ? 0.45 : 0.22),
          width: featured ? 2 : 1.2,
        ),
        boxShadow: featured
            ? elevatedShadow(context)
            : cardShadow(context),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: borderSm(context),
          border: Border.all(
            color: accent.withOpacity(0.15),
            width: featured ? 1.5 : 1,
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              palette.primarySoft(0.06),
              palette.placeholderLight,
              palette.placeholderMid,
            ],
          ),
        ),
        child: featured
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  shimmerBox(
                    context,
                    width: width * 0.18,
                    height: width * 0.18,
                    shape: BoxShape.circle,
                  ),
                  SizedBox(height: gapSm(context)),
                  textLine(context, widthFactor: 0.28, heightFactor: 0.007),
                  SizedBox(height: gapXs(context)),
                  textLine(context, widthFactor: 0.18, heightFactor: 0.005),
                ],
              )
            : null,
      ),
    );
  }

  static Widget badgePlaceholder(
    BuildContext context, {
    required double size,
    required BadgeShape shape,
    Color? accentHint,
    bool elevated = true,
  }) {
    final palette = context.ds.palette;
    final accent = accentHint ?? palette.accent;

    switch (shape) {
      case BadgeShape.circle:
        return Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              colors: [
                accent.withOpacity(0.35),
                accent.withOpacity(0.12),
                palette.surface,
              ],
              stops: const [0.0, 0.55, 1.0],
            ),
            border: Border.all(color: accent.withOpacity(0.40), width: 2),
            boxShadow: elevated ? elevatedShadow(context) : cardShadow(context),
          ),
          child: Center(
            child: shimmerBox(
              context,
              width: size * 0.38,
              height: size * 0.38,
              shape: BoxShape.circle,
            ),
          ),
        );
      case BadgeShape.shield:
        return SizedBox(
          width: size,
          height: size * 1.15,
          child: CustomPaint(
            painter: _ShieldPainter(
              fillColor: palette.surface,
              borderColor: accent.withOpacity(0.45),
              innerColor: accent.withOpacity(0.18),
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: size * 0.08),
                child: shimmerBox(
                  context,
                  width: size * 0.32,
                  height: size * 0.32,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        );
      case BadgeShape.medallion:
        return Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: palette.surface,
            border: Border.all(color: accent.withOpacity(0.50), width: 3),
            boxShadow: elevated ? elevatedShadow(context) : null,
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: size * 0.78,
                height: size * 0.78,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      accent.withOpacity(0.30),
                      accent.withOpacity(0.08),
                    ],
                  ),
                ),
              ),
              shimmerBox(
                context,
                width: size * 0.30,
                height: size * 0.30,
                shape: BoxShape.circle,
              ),
            ],
          ),
        );
    }
  }

  static Widget trophyPlaceholder(
    BuildContext context, {
    required double width,
    required double height,
    Color? accentHint,
  }) {
    final palette = context.ds.palette;
    final accent = accentHint ?? palette.accent;

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: borderLg(context),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            accent.withOpacity(0.20),
            palette.surface,
            palette.primarySoft(0.08),
          ],
        ),
        border: Border.all(color: accent.withOpacity(0.30)),
        boxShadow: elevatedShadow(context),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          shimmerBox(
            context,
            width: width * 0.22,
            height: height * 0.28,
            borderRadius: BorderRadius.circular(8),
          ),
          SizedBox(height: gapMd(context)),
          Container(
            width: width * 0.35,
            height: AppSizes.h(context, 0.006),
            decoration: BoxDecoration(
              color: accent.withOpacity(0.25),
              borderRadius: borderSm(context),
            ),
          ),
        ],
      ),
    );
  }

  static Widget metaBlock(
    BuildContext context, {
    bool includeCredential = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleLine(context, widthFactor: 0.30),
        SizedBox(height: gapXs(context)),
        organizationLine(context, widthFactor: 0.22),
        SizedBox(height: gapXs(context)),
        dateLine(context, widthFactor: 0.12),
        if (includeCredential) ...[
          SizedBox(height: gapXs(context)),
          credentialLine(context, widthFactor: 0.18),
        ],
      ],
    );
  }
}

class _ShieldPainter extends CustomPainter {
  final Color fillColor;
  final Color borderColor;
  final Color innerColor;

  _ShieldPainter({
    required this.fillColor,
    required this.borderColor,
    required this.innerColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()
      ..moveTo(size.width * 0.5, 0)
      ..lineTo(size.width, size.height * 0.22)
      ..lineTo(size.width * 0.85, size.height * 0.72)
      ..quadraticBezierTo(
        size.width * 0.5,
        size.height,
        size.width * 0.15,
        size.height * 0.72,
      )
      ..lineTo(0, size.height * 0.22)
      ..close();

    canvas.drawPath(
      path,
      Paint()
        ..color = fillColor
        ..style = PaintingStyle.fill,
    );
    canvas.drawPath(
      path,
      Paint()
        ..color = borderColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2,
    );

    final innerPath = Path()
      ..moveTo(size.width * 0.5, size.height * 0.12)
      ..lineTo(size.width * 0.78, size.height * 0.28)
      ..lineTo(size.width * 0.68, size.height * 0.62)
      ..quadraticBezierTo(
        size.width * 0.5,
        size.height * 0.78,
        size.width * 0.32,
        size.height * 0.62,
      )
      ..lineTo(size.width * 0.22, size.height * 0.28)
      ..close();

    canvas.drawPath(
      innerPath,
      Paint()
        ..color = innerColor
        ..style = PaintingStyle.fill,
    );
  }

  @override
  bool shouldRepaint(covariant _ShieldPainter oldDelegate) => false;
}
