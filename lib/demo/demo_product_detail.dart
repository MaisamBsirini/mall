import 'dart:math';

import 'package:flutter/material.dart';

import '../sections/product_detail/config.dart';
import '../sections/product_detail/info/styles.dart';
import '../sections/product_detail/media/styles.dart';
import '../sections/product_detail/product_detail_screen.dart';
import '../sections/product_detail/product_detail_section_ids.dart';
import '../sections/product_detail/reviews/styles.dart';
import '../sections/product_detail/variants/styles.dart';
import '../sections/product_detail/widgets/preview_scope.dart';
import 'demo_products.dart';

/// Builds product detail previews using the existing layout engine.
abstract final class DemoProductDetail {
  static ProductDetailPreviewDensity densityFor(DemoVariantProfile profile) {
    return switch (profile) {
      DemoVariantProfile.none => ProductDetailPreviewDensity.empty,
      DemoVariantProfile.single => ProductDetailPreviewDensity.single,
      DemoVariantProfile.shortLabels => ProductDetailPreviewDensity.single,
      DemoVariantProfile.standard => ProductDetailPreviewDensity.standard,
      DemoVariantProfile.many => ProductDetailPreviewDensity.dense,
      DemoVariantProfile.longLabels => ProductDetailPreviewDensity.dense,
    };
  }

  /// Picks a deterministic random style per section from the product id seed.
  static List<ProductDetailSectionEntry> buildSections(DemoProduct product) {
    final random = Random(product.id.hashCode);

    final orders = [1, 2, 3, 4]..shuffle(random);

    return [
      ProductDetailSectionEntry(
        sectionId: ProductDetailSectionId.media,
        styleId: _pick(random, MediaStyleId.all),
        enabled: true,
        order: orders[0],
      ),
      ProductDetailSectionEntry(
        sectionId: ProductDetailSectionId.info,
        styleId: _pick(random, InfoStyleId.all),
        enabled: true,
        order: orders[1],
      ),
      ProductDetailSectionEntry(
        sectionId: ProductDetailSectionId.variants,
        styleId: _pick(random, VariantsStyleId.all),
        enabled: true,
        order: orders[2],
      ),
      ProductDetailSectionEntry(
        sectionId: ProductDetailSectionId.reviews,
        styleId: _pick(random, ReviewsStyleId.all),
        enabled: true,
        order: orders[3],
      ),
    ];
  }

  static String _pick(Random random, List<String> styles) =>
      styles[random.nextInt(styles.length)];

  static Widget buildScreen(DemoProduct product) {
    return ProductDetailPreviewScope(
      density: densityFor(product.variantProfile),
      child: ProductDetailScreen(
        sections: buildSections(product),
      ),
    );
  }

  static String variantProfileLabel(DemoVariantProfile profile) {
    return switch (profile) {
      DemoVariantProfile.none => '0 variants',
      DemoVariantProfile.single => '1 variant group',
      DemoVariantProfile.standard => '3 variant groups',
      DemoVariantProfile.many => '6 variant groups',
      DemoVariantProfile.longLabels => 'Long attribute labels',
      DemoVariantProfile.shortLabels => 'Short attribute labels',
    };
  }
}
