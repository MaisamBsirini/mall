import 'social_section_data.dart';

class SocialSectionConfig {
  final String id;
  final String name;
  final bool enabled;
  final int order;
  final String style;
  final SocialSectionData? data;

  const SocialSectionConfig({
    required this.id,
    required this.name,
    required this.enabled,
    required this.order,
    required this.style,
    this.data,
  });

  factory SocialSectionConfig.fromJson(Map<String, dynamic> json) {
    final dataJson = json['data'];

    return SocialSectionConfig(
      id: json['id'] as String,
      name: json['name'] as String? ?? 'Social Media',
      enabled: json['enabled'] as bool? ?? true,
      order: json['order'] as int? ?? 0,
      style: json['style'] as String,
      data: dataJson != null
          ? SocialSectionData.fromJson(dataJson as Map<String, dynamic>)
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
    'id': 'social_media',
    'style': 'minimal_social_chips',
    'data': SocialSectionData.exampleJson,
  };
}
