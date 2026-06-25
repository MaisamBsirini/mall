/// Storefront section — UI customization only (no content payload).
class StorefrontSectionEntry {
  final String id;
  final String name;
  final bool enabled;
  final int order;
  final String style;

  const StorefrontSectionEntry({
    required this.id,
    required this.name,
    required this.enabled,
    required this.order,
    required this.style,
  });

  /// Preset helper — supplies default [name] from [id].
  factory StorefrontSectionEntry.layout({
    required String id,
    required String style,
    bool enabled = true,
    int order = 0,
  }) {
    return StorefrontSectionEntry(
      id: id,
      name: _defaultName(id),
      enabled: enabled,
      order: order,
      style: style,
    );
  }

  factory StorefrontSectionEntry.fromJson(Map<String, dynamic> json) {
    final id = json['id'] as String? ?? json['sectionId'] as String;
    final style = json['style'] as String? ?? json['styleId'] as String;

    return StorefrontSectionEntry(
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

  StorefrontSectionEntry copyWith({
    String? id,
    String? name,
    String? style,
    bool? enabled,
    int? order,
  }) {
    return StorefrontSectionEntry(
      id: id ?? this.id,
      name: name ?? this.name,
      enabled: enabled ?? this.enabled,
      order: order ?? this.order,
      style: style ?? this.style,
    );
  }

  static String _defaultName(String id) => switch (id) {
        'social_media' => 'Social Media',
        _ => id
            .split('_')
            .map(
              (w) => w.isEmpty ? w : '${w[0].toUpperCase()}${w.substring(1)}',
            )
            .join(' '),
      };
}

/// Full storefront customize payload (palette, typography, sections).
class StorefrontLayoutConfig {
  final List<StorefrontSectionEntry> sections;

  const StorefrontLayoutConfig({required this.sections});

  factory StorefrontLayoutConfig.fromJson(Map<String, dynamic> json) {
    final raw = json['sections'];
    final entries = raw is List
        ? raw
            .whereType<Map>()
            .map(
              (e) => StorefrontSectionEntry.fromJson(
                Map<String, dynamic>.from(e),
              ),
            )
            .toList()
        : <StorefrontSectionEntry>[];

    return StorefrontLayoutConfig(sections: entries);
  }

  Map<String, dynamic> toJson() => {
        'sections': sections.map((s) => s.toJson()).toList(),
      };
}
