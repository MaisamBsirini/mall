class ReviewsSectionConfig {
  final String id;
  final String name;
  final bool enabled;
  final int order;
  final String style;

  const ReviewsSectionConfig({
    required this.id,
    required this.name,
    required this.enabled,
    required this.order,
    required this.style,
  });

  factory ReviewsSectionConfig.fromJson(Map<String, dynamic> json) {
    return ReviewsSectionConfig(
      id: json['id'] as String,
      name: json['name'] as String? ?? 'Reviews',
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
    'id': 'reviews',
    'name': 'Reviews',
    'enabled': true,
    'order': 5,
    'style': 'review_dashboard',
  };
}
