import 'package:flutter/material.dart';

import '../../core/constants/app_sizes.dart';
import '../../design_system/scope/design_system_scope.dart';

class LocationTokens {
  LocationTokens._();

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

  static Widget pinIcon(
    BuildContext context, {
    double size = 14,
    Color? color,
  }) {
    return Icon(
      Icons.location_on_rounded,
      size: size,
      color: color ?? context.ds.palette.primary.withOpacity(0.75),
    );
  }

  static Widget locationText(
    BuildContext context, {
    double widthFactor = 0.18,
  }) {
    return textLine(context, widthFactor: widthFactor, heightFactor: 0.007);
  }

  static Widget locationDetailText(
    BuildContext context, {
    double widthFactor = 0.28,
  }) {
    return textLine(context, widthFactor: widthFactor, heightFactor: 0.006);
  }

  /// Minimal banner strip for component demos — not a full banner section.
  static Widget mockBannerStrip(BuildContext context) {
    final palette = context.ds.palette;
    final height = AppSizes.h(context, 0.14);

    return ClipRRect(
      borderRadius: borderMd(context),
      child: SizedBox(
        height: height,
        width: double.infinity,
        child: Stack(
          fit: StackFit.expand,
          children: [
            context.ds.placeholders.placeholderBox(
              height: height,
              borderRadius: borderMd(context),
              gradient: context.ds.tokens.imagePlaceholderGradient(),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    palette.overlayDark.withOpacity(0.45),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Minimal content hint below a floating component.
  static Widget mockContentStrip(BuildContext context) {
    return Row(
      children: List.generate(3, (index) {
        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              right: index < 2 ? gapSm(context) : 0,
            ),
            child: context.ds.placeholders.shimmerBox(
              height: AppSizes.h(context, 0.06),
              borderRadius: borderSm(context),
            ),
          ),
        );
      }),
    );
  }

  static Widget overlayCard(BuildContext context) {
    final palette = context.ds.palette;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.w(context, 0.04),
        vertical: AppSizes.h(context, 0.012),
      ),
      decoration: BoxDecoration(
        color: surface(context),
        borderRadius: borderMd(context),
        border: Border.all(color: palette.border),
        boxShadow: elevatedShadow(context),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          locationText(context, widthFactor: 0.22),
          SizedBox(height: gapXs(context)),
          locationDetailText(context, widthFactor: 0.32),
        ],
      ),
    );
  }
}
