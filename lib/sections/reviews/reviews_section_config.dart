import 'reviews_section_data.dart';

class ReviewsSectionConfig {
  final String id;
  final String name;
  final bool enabled;
  final int order;
  final String style;
  final ReviewsSectionData? data;

  const ReviewsSectionConfig({
    required this.id,
    required this.name,
    required this.enabled,
    required this.order,
    required this.style,
    this.data,
  });

  factory ReviewsSectionConfig.fromJson(Map<String, dynamic> json) {
    final dataJson = json['data'];

    return ReviewsSectionConfig(
      id: json['id'] as String,
      name: json['name'] as String? ?? 'Reviews',
      enabled: json['enabled'] as bool? ?? true,
      order: json['order'] as int? ?? 0,
      style: json['style'] as String,
      data: dataJson != null
          ? ReviewsSectionData.fromJson(dataJson as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'enabled': enabled,
      'order': order,
      'style': style,
      if (data != null) 'data': data!.toJson(),
    };
  }

  static const Map<String, dynamic> exampleJson = {
    'id': 'reviews',
    'style': 'review_dashboard',
    'data': ReviewsSectionData.exampleJson,
  };
}
