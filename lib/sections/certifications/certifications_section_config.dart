import 'certifications_section_data.dart';

class CertificationsSectionConfig {
  final String id;
  final String name;
  final bool enabled;
  final int order;
  final String style;
  final CertificationsSectionData? data;

  const CertificationsSectionConfig({
    required this.id,
    required this.name,
    required this.enabled,
    required this.order,
    required this.style,
    this.data,
  });

  factory CertificationsSectionConfig.fromJson(Map<String, dynamic> json) {
    final dataJson = json['data'];

    return CertificationsSectionConfig(
      id: json['id'] as String,
      name: json['name'] as String? ?? 'Certifications',
      enabled: json['enabled'] as bool? ?? true,
      order: json['order'] as int? ?? 0,
      style: json['style'] as String,
      data: dataJson != null
          ? CertificationsSectionData.fromJson(dataJson as Map<String, dynamic>)
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
    'id': 'certifications',
    'style': 'certificate_wall',
    'data': CertificationsSectionData.exampleJson,
  };
}
