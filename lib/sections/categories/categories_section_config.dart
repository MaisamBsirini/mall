import 'categories_section_data.dart';

class CategoriesSectionConfig {
  final String id;
  final String name;
  final bool enabled;
  final int order;
  final String style;
  final CategoriesSectionData? data;

  const CategoriesSectionConfig({
    required this.id,
    required this.name,
    required this.enabled,
    required this.order,
    required this.style,
    this.data,
  });

  factory CategoriesSectionConfig.fromJson(Map<String, dynamic> json) {
    final dataJson = json['data'];

    return CategoriesSectionConfig(
      id: json['id'] as String,
      name: json['name'] as String? ?? 'Categories',
      enabled: json['enabled'] as bool? ?? true,
      order: json['order'] as int? ?? 0,
      style: json['style'] as String,
      data: dataJson != null
          ? CategoriesSectionData.fromJson(dataJson as Map<String, dynamic>)
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
    'id': 'categories',
    'name': 'Categories',
    'enabled': true,
    'order': 2,
    'style': 'icon_hub',
    'data': CategoriesSectionData.exampleJson,
  };
}
