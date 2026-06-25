class OffersSectionConfig {
  final String id;
  final String name;
  final bool enabled;
  final int order;
  final String style;

  const OffersSectionConfig({
    required this.id,
    required this.name,
    required this.enabled,
    required this.order,
    required this.style,
  });

  factory OffersSectionConfig.fromJson(Map<String, dynamic> json) {
    return OffersSectionConfig(
      id: json['id'] as String,
      name: json['name'] as String? ?? 'Offers',
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

  static const Map<String, dynamic> exampleJson = {
    'id': 'offers',
    'name': 'Offers',
    'enabled': true,
    'order': 4,
    'style': 'compact_horizontal_offer',
  };
}
