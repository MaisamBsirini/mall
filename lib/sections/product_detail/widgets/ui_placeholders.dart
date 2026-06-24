import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../../../design_system/scope/design_system_scope.dart';
import 'preview_scope.dart';

export 'preview_scope.dart';

/// Shared placeholder building blocks for product detail UI sections.
abstract final class ProductDetailUi {
  static ProductDetailPreviewDensity density(BuildContext context) {
    return ProductDetailPreviewScope.of(context);
  }

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

  static int imageCount(BuildContext context) => density(context).imageCount;

  static bool hasImages(BuildContext context) => imageCount(context) > 0;

  static bool hasMultipleImages(BuildContext context) => imageCount(context) > 1;

  static List<BoxShadow> softShadow(
    BuildContext context, {
    double opacity = 0.10,
    double blur = 14,
    Offset offset = const Offset(0, 5),
  }) {
    return [
      BoxShadow(
        color: context.ds.palette.overlayDark.withValues(alpha: opacity),
        blurRadius: blur,
        offset: offset,
      ),
    ];
  }

  static Widget groupSpacer(BuildContext context) =>
      SizedBox(height: gapMd(context));

  static Widget optionSkeleton(
    BuildContext context, {
    double widthFactor = 0.14,
  }) {
    return line(context, widthFactor: widthFactor, heightFactor: 0.005);
  }

  // ── Image placeholders ──────────────────────────────────────────────────

  static Widget imageBlock(
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

  static Widget emptyImageBlock(
    BuildContext context, {
    required double height,
    BorderRadius? borderRadius,
  }) {
    final palette = context.ds.palette;

    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: palette.placeholderLight.withValues(alpha: 0.35),
        borderRadius: borderRadius ?? radiusMd(context),
        border: Border.all(color: palette.border.withValues(alpha: 0.4)),
      ),
      alignment: Alignment.center,
      child: Icon(
        Icons.image_outlined,
        size: 28,
        color: palette.textSecondary.withValues(alpha: 0.28),
      ),
    );
  }

  static Widget adaptiveImageBlock(
    BuildContext context, {
    required double height,
    BorderRadius? borderRadius,
  }) {
    if (density(context).imageCount == 0) {
      return emptyImageBlock(context, height: height, borderRadius: borderRadius);
    }
    return imageBlock(context, height: height, borderRadius: borderRadius);
  }

  static Widget carouselDots(BuildContext context, {int count = 3}) {
    final palette = context.ds.palette;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (i) {
        return Container(
          width: i == 0 ? 16 : 6,
          height: 6,
          margin: const EdgeInsets.symmetric(horizontal: 3),
          decoration: BoxDecoration(
            color: i == 0 ? palette.primary : palette.primarySoft(0.22),
            borderRadius: BorderRadius.circular(3),
          ),
        );
      }),
    );
  }

  static Widget thumbnailRow(BuildContext context, {double size = 48}) {
    final count = density(context).imageCount;
    if (count == 0) return SizedBox(height: size);

    return SizedBox(
      height: size,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: count.clamp(1, 5),
        separatorBuilder: (_, __) => SizedBox(width: gapSm(context)),
        itemBuilder: (_, i) {
          final selected = i == 0;
          final palette = context.ds.palette;

          return Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              borderRadius: radiusSm(context),
              border: Border.all(
                color: selected ? palette.primary : palette.border,
                width: selected ? 2 : 1,
              ),
            ),
            child: ClipRRect(
              borderRadius: radiusSm(context),
              child: imageBlock(
                context,
                width: size,
                height: size,
                borderRadius: BorderRadius.zero,
              ),
            ),
          );
        },
      ),
    );
  }

  // ── Text placeholders ───────────────────────────────────────────────────

  static Widget line(
    BuildContext context, {
    double widthFactor = 0.5,
    double heightFactor = 0.008,
  }) {
    return context.ds.placeholders.textLine(
      context,
      widthFactor: widthFactor,
      heightFactor: heightFactor,
    );
  }

  static Widget titleBlock(
    BuildContext context, {
    int? lines,
    double primaryWidth = 0.82,
    double secondaryWidth = 0.58,
  }) {
    final count = lines ?? density(context).titleLines;
    if (count <= 0) return emptyTextSlot(context, height: AppSizes.h(context, 0.014));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        line(context, widthFactor: primaryWidth, heightFactor: 0.010),
        if (count > 1) ...[
          SizedBox(height: gapXs(context)),
          line(context, widthFactor: secondaryWidth, heightFactor: 0.008),
        ],
      ],
    );
  }

  static Widget categoryChip(BuildContext context) {
    if (!density(context).showCategory) {
      return emptyTextSlot(context, height: 24, widthFactor: 0.22);
    }

    final palette = context.ds.palette;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: gapSm(context),
        vertical: gapXs(context) * 0.6,
      ),
      decoration: BoxDecoration(
        color: palette.primarySoft(0.10),
        borderRadius: radiusLg(context),
        border: Border.all(color: palette.primarySoft(0.22)),
      ),
      child: line(context, widthFactor: 0.18, heightFactor: 0.006),
    );
  }

  static Widget descriptionBlock(
    BuildContext context, {
    int? lines,
    bool compact = false,
  }) {
    final count = lines ?? density(context).descriptionLines;
    if (count <= 0) {
      return emptyTextSlot(context, height: AppSizes.h(context, 0.036));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var i = 0; i < count; i++)
          Padding(
            padding: EdgeInsets.only(bottom: compact ? 4 : gapXs(context)),
            child: line(
              context,
              widthFactor: i == count - 1 ? 0.68 : 0.92,
              heightFactor: compact ? 0.006 : 0.007,
            ),
          ),
      ],
    );
  }

  static Widget emptyTextSlot(
    BuildContext context, {
    required double height,
    double widthFactor = 1.0,
  }) {
    final palette = context.ds.palette;

    return Container(
      height: height,
      width: widthFactor >= 1 ? double.infinity : AppSizes.w(context, widthFactor),
      decoration: BoxDecoration(
        color: palette.placeholderLight.withValues(alpha: 0.2),
        borderRadius: radiusSm(context),
        border: Border.all(color: palette.border.withValues(alpha: 0.3)),
      ),
    );
  }

  // ── Generic variant selectors (no labels, no values) ────────────────────

  static Widget genericChip(BuildContext context, {bool selected = false}) {
    final palette = context.ds.palette;

    return Container(
      width: 48,
      height: 32,
      decoration: BoxDecoration(
        color: selected ? palette.primarySoft(0.14) : palette.surface,
        borderRadius: radiusLg(context),
        border: Border.all(
          color: selected ? palette.primary : palette.border,
        ),
      ),
    );
  }

  static Widget genericPill(BuildContext context, {bool selected = false}) {
    final palette = context.ds.palette;

    return Container(
      width: 56,
      height: 28,
      decoration: BoxDecoration(
        color: selected ? palette.textPrimary : palette.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: selected ? palette.textPrimary : palette.border,
        ),
      ),
    );
  }

  static Widget genericCard(BuildContext context, {bool selected = false}) {
    final palette = context.ds.palette;

    return Container(
      width: 64,
      height: 44,
      decoration: BoxDecoration(
        color: selected ? palette.primarySoft(0.12) : palette.surface,
        borderRadius: radiusSm(context),
        border: Border.all(
          color: selected ? palette.primary : palette.border,
          width: selected ? 1.5 : 1,
        ),
      ),
      child: Center(
        child: line(context, widthFactor: 0.12, heightFactor: 0.005),
      ),
    );
  }

  static Widget attributeGroups(
    BuildContext context, {
    required Widget Function(BuildContext context, int groupIndex, int optionCount)
        buildGroup,
  }) {
    final groups = density(context).attributeGroups;
    if (groups <= 0) return emptyVariantArea(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (var g = 0; g < groups; g++) ...[
          if (g > 0) SizedBox(height: gapMd(context)),
          buildGroup(context, g, density(context).optionsPerGroup),
        ],
      ],
    );
  }

  static Widget emptyVariantArea(BuildContext context) {
    final palette = context.ds.palette;

    return Container(
      height: 52,
      decoration: BoxDecoration(
        color: palette.placeholderLight.withValues(alpha: 0.15),
        borderRadius: radiusSm(context),
        border: Border.all(color: palette.border.withValues(alpha: 0.35)),
      ),
    );
  }

  static Widget chipRow(BuildContext context, {required int count}) {
    if (count <= 0) return emptyVariantArea(context);

    return Wrap(
      spacing: gapSm(context),
      runSpacing: gapSm(context),
      children: List.generate(
        count,
        (i) => genericChip(context, selected: i == 0),
      ),
    );
  }

  static Widget horizontalSelectorRow(
    BuildContext context, {
    required int count,
  }) {
    if (count <= 0) return emptyVariantArea(context);

    return SizedBox(
      height: 36,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: count,
        separatorBuilder: (_, __) => SizedBox(width: gapSm(context)),
        itemBuilder: (_, i) => genericChip(context, selected: i == 0),
      ),
    );
  }

  static Widget segmentedRow(BuildContext context, {required int count}) {
    if (count <= 0) return emptyVariantArea(context);

    final palette = context.ds.palette;

    return Container(
      height: 36,
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: palette.placeholderLight.withValues(alpha: 0.25),
        borderRadius: radiusLg(context),
        border: Border.all(color: palette.border.withValues(alpha: 0.4)),
      ),
      child: Row(
        children: List.generate(count.clamp(1, 5), (i) {
          final selected = i == 0;
          return Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 2),
              decoration: BoxDecoration(
                color: selected ? palette.surface : Colors.transparent,
                borderRadius: radiusSm(context),
                boxShadow: selected
                    ? [
                        BoxShadow(
                          color: palette.overlayDark.withValues(alpha: 0.06),
                          blurRadius: 4,
                          offset: const Offset(0, 1),
                        ),
                      ]
                    : null,
              ),
              child: Center(
                child: line(
                  context,
                  widthFactor: 0.08,
                  heightFactor: 0.005,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  static Widget divider(BuildContext context) {
    return Divider(
      height: 1,
      color: context.ds.palette.border.withValues(alpha: 0.4),
    );
  }

  static Widget sectionSurface(
    BuildContext context, {
    required Widget child,
    EdgeInsets? padding,
  }) {
    final palette = context.ds.palette;

    return Container(
      width: double.infinity,
      padding: padding ?? EdgeInsets.all(gapMd(context)),
      decoration: BoxDecoration(
        color: palette.surface,
        borderRadius: radiusMd(context),
        border: Border.all(color: palette.border.withValues(alpha: 0.45)),
      ),
      child: child,
    );
  }
}
