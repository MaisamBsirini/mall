import 'collections_section_data.dart';

class CollectionsSectionConfig {
  final String id;
  final String name;
  final bool enabled;
  final int order;
  final String style;
  final CollectionsSectionData? data;

  const CollectionsSectionConfig({
    required this.id,
    required this.name,
    required this.enabled,
    required this.order,
    required this.style,
    this.data,
  });

  factory CollectionsSectionConfig.fromJson(Map<String, dynamic> json) {
    final dataJson = json['data'];

    return CollectionsSectionConfig(
      id: json['id'] as String,
      name: json['name'] as String? ?? 'Collections',
      enabled: json['enabled'] as bool? ?? true,
      order: json['order'] as int? ?? 0,
      style: json['style'] as String,
      data: dataJson != null
          ? CollectionsSectionData.fromJson(dataJson as Map<String, dynamic>)
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
    'id': 'collections',
    'name': 'Collections',
    'enabled': true,
    'order': 2,
    'style': 'rectangle_cards',
    'data': CollectionsSectionData.exampleJson,
  };
}
