/// A single configurable section entry in the product detail layout.
class ProductDetailSectionEntry {
  final String sectionId;
  final String styleId;
  final bool enabled;
  final int order;

  const ProductDetailSectionEntry({
    required this.sectionId,
    required this.styleId,
    required this.enabled,
    required this.order,
  });

  factory ProductDetailSectionEntry.fromJson(Map<String, dynamic> json) {
    return ProductDetailSectionEntry(
      sectionId: json['sectionId'] as String,
      styleId: json['styleId'] as String,
      enabled: json['enabled'] as bool? ?? true,
      order: json['order'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        'sectionId': sectionId,
        'styleId': styleId,
        'enabled': enabled,
        'order': order,
      };

  ProductDetailSectionEntry copyWith({
    String? sectionId,
    String? styleId,
    bool? enabled,
    int? order,
  }) {
    return ProductDetailSectionEntry(
      sectionId: sectionId ?? this.sectionId,
      styleId: styleId ?? this.styleId,
      enabled: enabled ?? this.enabled,
      order: order ?? this.order,
    );
  }
}

/// Full layout configuration passed to the product detail layout engine.
class ProductDetailLayoutConfig {
  final List<ProductDetailSectionEntry> sections;

  const ProductDetailLayoutConfig({required this.sections});

  factory ProductDetailLayoutConfig.fromJson(Map<String, dynamic> json) {
    final raw = json['sections'];
    final entries = raw is List
        ? raw
            .whereType<Map>()
            .map((e) => ProductDetailSectionEntry.fromJson(
                  Map<String, dynamic>.from(e),
                ))
            .toList()
        : <ProductDetailSectionEntry>[];

    return ProductDetailLayoutConfig(sections: entries);
  }

  Map<String, dynamic> toJson() => {
        'sections': sections.map((s) => s.toJson()).toList(),
      };

  static const defaults = ProductDetailLayoutConfig(
    sections: [
      ProductDetailSectionEntry(
        sectionId: 'media',
        styleId: 'hero_full_width',
        enabled: true,
        order: 1,
      ),
      ProductDetailSectionEntry(
        sectionId: 'info',
        styleId: 'large_title_stack',
        enabled: true,
        order: 2,
      ),
      ProductDetailSectionEntry(
        sectionId: 'variants',
        styleId: 'adaptive_chips',
        enabled: true,
        order: 3,
      ),
      ProductDetailSectionEntry(
        sectionId: 'reviews',
        styleId: 'rating_summary',
        enabled: true,
        order: 4,
      ),
    ],
  );
}
