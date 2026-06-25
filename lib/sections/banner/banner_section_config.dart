class BannerSectionConfig {
  final String id;
  final String name;
  final bool enabled;
  final int order;
  final String style;

  const BannerSectionConfig({
    required this.id,
    required this.name,
    required this.enabled,
    required this.order,
    required this.style,
  });

  factory BannerSectionConfig.fromJson(Map<String, dynamic> json) {
    return BannerSectionConfig(
      id: json['id'] as String,
      name: json['name'] as String? ?? 'Banner',
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

  /// Layout-only storefront section envelope (no content).
  static const Map<String, dynamic> exampleJson = {
    'id': 'banner',
    'name': 'Banner',
    'enabled': true,
    'order': 1,
    'style': 'slider_banner',
  };
}
