import 'package:flutter/material.dart';

import '../../core/constants/app_sizes.dart';
import '../../design_system/scope/design_system_scope.dart';
import 'certification_item.dart';

class CertificationsTokens {
  CertificationsTokens._();

  /// Placeholder count for UI showcase — not live data.
  static const int showcaseItemCount = 6;
  static const int showcaseImagesPerItem = 2;

  static List<CertificationItem> resolveItems(List<CertificationItem>? items) {
    if (items != null && items.isNotEmpty) return items;
    return List.generate(
      showcaseItemCount,
      (index) => CertificationItem(
        id: 'cert_${index + 1}',
        title: '',
        images: List.generate(
          showcaseImagesPerItem,
          (i) => 'placeholder_${index}_$i',
        ),
      ),
    );
  }

  static int imageCount(List<CertificationItem> items) {
    return items.fold(0, (count, item) => count + item.images.length);
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

  static BorderRadius borderSm(BuildContext context) =>
      context.ds.tokens.borderSm;

  static BorderRadius borderMd(BuildContext context) =>
      context.ds.tokens.borderMd;

  static Color surface(BuildContext context) =>
      context.ds.palette.surface;

  static List<BoxShadow> cardShadow(BuildContext context) =>
      context.ds.tokens.cardShadow(context);

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

  static Widget sectionTitle(BuildContext context) {
    return Padding(
      padding: sectionPadding(context),
      child: textLine(context, widthFactor: 0.26, heightFactor: 0.009),
    );
  }

  /// Fixed band height — section never grows beyond this on mobile.
  static double bandHeight(BuildContext context) => AppSizes.h(context, 0.11);

  static double carouselHeight(BuildContext context) => AppSizes.h(context, 0.13);

  static double timelineHeight(BuildContext context) => AppSizes.h(context, 0.10);

  static Widget boundedBand(
    BuildContext context, {
    required Widget child,
    double? height,
  }) {
    return SizedBox(
      height: height ?? bandHeight(context),
      width: double.infinity,
      child: child,
    );
  }

  static Widget overflowBadge(BuildContext context, int extra) {
    if (extra <= 0) return const SizedBox.shrink();
    final palette = context.ds.palette;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: gapSm(context),
        vertical: gapXs(context),
      ),
      decoration: BoxDecoration(
        color: palette.primarySoft(0.12),
        borderRadius: borderSm(context),
        border: Border.all(color: palette.primarySoft(0.28)),
      ),
      child: Text(
        '+$extra',
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: palette.primary,
        ),
      ),
    );
  }

  /// Mini portrait certificate tile.
  static Widget miniTile(
    BuildContext context, {
    required double width,
    required double height,
    bool selected = false,
  }) {
    final palette = context.ds.palette;

    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: surface(context),
        borderRadius: borderSm(context),
        border: Border.all(
          color: selected ? palette.primary : palette.border,
          width: selected ? 1.5 : 1,
        ),
        boxShadow: selected ? cardShadow(context) : null,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: context.ds.placeholders.shimmerBox(
          width: width - 4,
          height: height - 4,
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    );
  }

  /// Circular seal badge — distinct from rectangular tiles.
  static Widget sealBadge(
    BuildContext context, {
    required double size,
    bool ring = false,
  }) {
    final palette = context.ds.palette;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: palette.primarySoft(0.10),
        border: Border.all(
          color: ring ? palette.primary : palette.border,
          width: ring ? 1.5 : 1,
        ),
      ),
      child: Icon(
        Icons.verified_outlined,
        size: size * 0.42,
        color: palette.primary.withValues(alpha: 0.55),
      ),
    );
  }
}

class CertificationImageRef {
  final CertificationItem item;
  final int imageIndex;

  const CertificationImageRef({
    required this.item,
    required this.imageIndex,
  });
}

extension CertificationItemsGallery on List<CertificationItem> {
  List<CertificationImageRef> get allImages {
    return [
      for (final item in this)
        for (var i = 0; i < item.images.length; i++)
          CertificationImageRef(item: item, imageIndex: i),
    ];
  }
}
