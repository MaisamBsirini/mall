/// A configurable storefront section entry from the backend layout payload.
class StorefrontLayoutSectionEntry {
  final String sectionId;
  final String styleId;
  final bool enabled;
  final int order;

  const StorefrontLayoutSectionEntry({
    required this.sectionId,
    required this.styleId,
    required this.enabled,
    required this.order,
  });

  factory StorefrontLayoutSectionEntry.fromJson(Map<String, dynamic> json) {
    return StorefrontLayoutSectionEntry(
      sectionId: json['sectionId'] as String? ?? json['id'] as String,
      styleId: json['styleId'] as String? ?? json['style'] as String,
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

  StorefrontLayoutSectionEntry copyWith({
    String? sectionId,
    String? styleId,
    bool? enabled,
    int? order,
  }) {
    return StorefrontLayoutSectionEntry(
      sectionId: sectionId ?? this.sectionId,
      styleId: styleId ?? this.styleId,
      enabled: enabled ?? this.enabled,
      order: order ?? this.order,
    );
  }
}

/// Full storefront page layout configuration.
class StorefrontLayoutConfig {
  final List<StorefrontLayoutSectionEntry> sections;

  const StorefrontLayoutConfig({required this.sections});

  factory StorefrontLayoutConfig.fromJson(Map<String, dynamic> json) {
    final raw = json['sections'];
    final entries = raw is List
        ? raw
            .whereType<Map>()
            .map(
              (e) => StorefrontLayoutSectionEntry.fromJson(
                Map<String, dynamic>.from(e),
              ),
            )
            .toList()
        : <StorefrontLayoutSectionEntry>[];

    return StorefrontLayoutConfig(sections: entries);
  }

  Map<String, dynamic> toJson() => {
        'sections': sections.map((s) => s.toJson()).toList(),
      };
}
