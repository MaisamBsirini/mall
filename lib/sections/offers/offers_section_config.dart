import 'offers_section_data.dart';

class OffersSectionConfig {
  final String id;
  final String name;
  final bool enabled;
  final int order;
  final String style;
  final OffersSectionData? data;

  const OffersSectionConfig({
    required this.id,
    required this.name,
    required this.enabled,
    required this.order,
    required this.style,
    this.data,
  });

  factory OffersSectionConfig.fromJson(Map<String, dynamic> json) {
    final dataJson = json['data'];

    return OffersSectionConfig(
      id: json['id'] as String,
      name: json['name'] as String? ?? 'Offers',
      enabled: json['enabled'] as bool? ?? true,
      order: json['order'] as int? ?? 0,
      style: json['style'] as String,
      data: dataJson != null && dataJson is Map && dataJson.isNotEmpty
          ? OffersSectionData.fromJson(dataJson as Map<String, dynamic>)
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
    'id': 'offers',
    'name': 'Offers',
    'enabled': true,
    'order': 1,
    'style': 'compact_horizontal_offer',
    'data': OffersSectionData.exampleJson,
  };
}
