import 'package:flutter/material.dart';

import '../../design_system/scope/design_system_scope.dart';
import 'certification_item.dart';

class CertificationsTokens {
  CertificationsTokens._();

  /// Placeholder items for UI showcase when live data is unavailable.
  static const List<CertificationItem> mockItems = [
    CertificationItem(
      id: 'cert_1',
      title: 'Licensed Esthetician',
      images: ['certificate_1.jpg', 'certificate_2.jpg', 'certificate_3.jpg'],
    ),
    CertificationItem(
      id: 'cert_2',
      title: 'Advanced Skincare Award',
      images: ['award_1.jpg', 'award_2.jpg'],
    ),
    CertificationItem(
      id: 'cert_3',
      title: 'Professional Accreditation',
      images: ['accreditation_1.jpg'],
    ),
    CertificationItem(
      id: 'cert_4',
      title: 'Excellence Certificate',
      images: ['certificate_4.jpg', 'certificate_5.jpg'],
    ),
  ];

  static List<CertificationItem> resolveItems(List<CertificationItem>? items) {
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

  static Widget sectionTitle(
    BuildContext context, {
    String? title,
    double widthFactor = 0.30,
  }) {
    return Padding(
      padding: sectionPadding(context),
      child: title != null
          ? Text(
              title,
              style: context.ds.typography.title(context),
            )
          : textLine(context, widthFactor: widthFactor, heightFactor: 0.010),
    );
  }

  static Widget itemTitle(
    BuildContext context, {
    required String title,
    double widthFactor = 0.32,
  }) {
    return Text(
      title,
      style: context.ds.typography.caption(context),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  /// Primary visual — certificate / award image placeholder.
  static Widget certificateImage(
    BuildContext context, {
    required double width,
    required double height,
    bool framed = true,
    bool elevated = false,
  }) {
    final palette = context.ds.palette;

    final image = context.ds.placeholders.imagePlaceholder(
      width: width,
      height: height,
      borderRadius: borderMd(context),
    );

    if (!framed) return image;

    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: surface(context),
        borderRadius: borderMd(context),
        border: Border.all(color: palette.primarySoft(0.14)),
        boxShadow: elevated ? elevatedShadow(context) : cardShadow(context),
      ),
      child: ClipRRect(
        borderRadius: borderSm(context),
        child: context.ds.placeholders.shimmerBox(
          width: width - 6,
          height: height - 6,
          borderRadius: borderSm(context),
        ),
      ),
    );
  }
}

/// Flattened image reference for gallery layouts.
class CertificationImageRef {
  final CertificationItem item;
  final int imageIndex;

  const CertificationImageRef({
    required this.item,
    required this.imageIndex,
  });

  String get imageKey => item.images[imageIndex];
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
