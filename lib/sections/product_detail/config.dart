/// A single product detail section entry — layout customization only.
class ProductDetailSectionEntry {
  final String id;
  final String name;
  final bool enabled;
  final int order;
  final String style;

  const ProductDetailSectionEntry({
    required this.id,
    required this.name,
    required this.enabled,
    required this.order,
    required this.style,
  });

  /// Layout preset helper — supplies default [name] from [id].
  factory ProductDetailSectionEntry.layout({
    required String id,
    required String style,
    bool enabled = true,
    int order = 0,
  }) {
    return ProductDetailSectionEntry(
      id: id,
      name: _defaultName(id),
      enabled: enabled,
      order: order,
      style: style,
    );
  }

  factory ProductDetailSectionEntry.fromJson(Map<String, dynamic> json) {
    final id = json['id'] as String? ?? json['sectionId'] as String;
    final style = json['style'] as String? ?? json['styleId'] as String;

    return ProductDetailSectionEntry(
      id: id,
      name: json['name'] as String? ?? _defaultName(id),
      enabled: json['enabled'] as bool? ?? true,
      order: json['order'] as int? ?? 0,
      style: style,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'enabled': enabled,
        'order': order,
        'style': style,
      };

  ProductDetailSectionEntry copyWith({
    String? id,
    String? name,
    String? style,
    bool? enabled,
    int? order,
  }) {
    return ProductDetailSectionEntry(
      id: id ?? this.id,
      name: name ?? this.name,
      enabled: enabled ?? this.enabled,
      order: order ?? this.order,
      style: style ?? this.style,
    );
  }

  static String _defaultName(String id) => switch (id) {
        'media' => 'Media',
        'info' => 'Product Information',
        'variants' => 'Variants',
        'reviews' => 'Reviews',
        _ => id
            .split('_')
            .map(
              (w) => w.isEmpty ? w : '${w[0].toUpperCase()}${w.substring(1)}',
            )
            .join(' '),
      };
}

/// Full product detail layout configuration — customize payload only.
class ProductDetailLayoutConfig {
  final List<ProductDetailSectionEntry> sections;

  const ProductDetailLayoutConfig({required this.sections});

  factory ProductDetailLayoutConfig.fromJson(Map<String, dynamic> json) {
    final raw = json['sections'];
    final entries = raw is List
        ? raw
            .whereType<Map>()
            .map(
              (e) => ProductDetailSectionEntry.fromJson(
                Map<String, dynamic>.from(e),
              ),
            )
            .toList()
        : <ProductDetailSectionEntry>[];

    return ProductDetailLayoutConfig(sections: entries);
  }

  Map<String, dynamic> toJson() => {
        'sections': sections.map((s) => s.toJson()).toList(),
      };

  static final defaults = ProductDetailLayoutConfig(
    sections: [
      ProductDetailSectionEntry.layout(
        id: 'media',
        style: 'hero_full_width',
        order: 1,
      ),
      ProductDetailSectionEntry.layout(
        id: 'info',
        style: 'large_title_stack',
        order: 2,
      ),
      ProductDetailSectionEntry.layout(
        id: 'variants',
        style: 'adaptive_chips',
        order: 3,
      ),
      ProductDetailSectionEntry.layout(
        id: 'reviews',
        style: 'rating_summary',
        order: 4,
      ),
    ],
  );
}
