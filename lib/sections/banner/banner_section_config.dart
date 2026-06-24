import 'banner_section_data.dart';

class BannerSectionConfig {
  final String id;
  final String name;
  final bool enabled;
  final int order;
  final String style;
  final BannerSectionData? data;

  const BannerSectionConfig({
    required this.id,
    required this.name,
    required this.enabled,
    required this.order,
    required this.style,
    this.data,
  });

  factory BannerSectionConfig.fromJson(Map<String, dynamic> json) {
    final dataJson = json['data'];

    return BannerSectionConfig(
      id: json['id'] as String,
      name: json['name'] as String? ?? 'Banner',
      enabled: json['enabled'] as bool? ?? true,
      order: json['order'] as int? ?? 0,
      style: json['style'] as String,
      data: dataJson != null
          ? BannerSectionData.fromJson(dataJson as Map<String, dynamic>)
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

  /// Full storefront section envelope example.
  static const Map<String, dynamic> exampleJson = {
    'id': 'banner',
    'name': 'Banner',
    'enabled': true,
    'order': 1,
    'style': 'slider_banner',
    'data': BannerSectionData.exampleJson,
  };
}
