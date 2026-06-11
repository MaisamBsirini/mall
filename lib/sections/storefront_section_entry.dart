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

  factory StorefrontSectionEntry.fromJson(Map<String, dynamic> json) {
    return StorefrontSectionEntry(
      id: json['id'] as String,
      name: json['name'] as String,
      enabled: json['enabled'] as bool? ?? true,
      order: json['order'] as int? ?? 0,
      style: json['style'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'enabled': enabled,
      'order': order,
      'style': style,
    };
  }
}
