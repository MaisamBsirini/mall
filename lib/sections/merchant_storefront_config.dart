import 'package:flutter/material.dart';

import '../design_system/merchant_design_config.dart';
import 'product_detail/config.dart';
import 'product_detail/product_detail_renderer.dart';
import 'storefront_layout_engine.dart';
import 'storefront_section_entry.dart';

class MerchantStorefrontConfig {
  final MerchantDesignConfig design;
  final List<StorefrontSectionEntry> sections;

  const MerchantStorefrontConfig({
    required this.design,
    required this.sections,
  });

  List<StorefrontSectionEntry> get visibleSections =>
      StorefrontLayoutEngine.resolve(sections);

  /// Product detail uses this store's [design] — palette and typography are not
  /// duplicated in the product detail customize payload.
  ProductDetailRenderer productDetailRenderer(
    ProductDetailLayoutConfig layout, {
    ScrollPhysics? physics,
  }) {
    return ProductDetailRenderer.fromStoreCustomize(
      storeDesign: design,
      productLayout: layout,
      physics: physics,
    );
  }

  factory MerchantStorefrontConfig.fromJson(Map<String, dynamic> json) {
    final designSource = json['design'] is Map<String, dynamic>
        ? json['design'] as Map<String, dynamic>
        : json;
    final sectionsJson = json['sections'] as List<dynamic>? ?? [];

    return MerchantStorefrontConfig(
      design: MerchantDesignConfig.fromJson(designSource),
      sections: sectionsJson
          .map(
            (entry) => StorefrontSectionEntry.fromJson(
              entry as Map<String, dynamic>,
            ),
          )
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'palette': design.paletteId,
      'typography': design.typographyId,
      'sections': sections.map((entry) => entry.toJson()).toList(),
    };
  }

  static const MerchantStorefrontConfig preview = MerchantStorefrontConfig(
    design: MerchantDesignConfig.defaults,
    sections: [
      StorefrontSectionEntry(
        id: 'banner',
        name: 'Banner',
        enabled: true,
        order: 1,
        style: 'hero_banner',
      ),
      StorefrontSectionEntry(
        id: 'collections',
        name: 'Collections',
        enabled: true,
        order: 2,
        style: 'horizontal_circles',
      ),
    ],
  );

  static const Map<String, dynamic> exampleJson = {
    'palette': 'luxury_dark',
    'typography': 'elegant_serif',
    'sections': [
      {
        'id': 'banner',
        'name': 'Banner',
        'enabled': true,
        'order': 1,
        'style': 'hero_banner',
      },
      {
        'id': 'collections',
        'name': 'Collections',
        'enabled': true,
        'order': 2,
        'style': 'horizontal_circles',
      },
    ],
  };
}
