import 'staff_section_data.dart';

class StaffSectionConfig {
  final String id;
  final String name;
  final bool enabled;
  final int order;
  final String style;
  final StaffSectionData? data;

  const StaffSectionConfig({
    required this.id,
    required this.name,
    required this.enabled,
    required this.order,
    required this.style,
    this.data,
  });

  factory StaffSectionConfig.fromJson(Map<String, dynamic> json) {
    final dataJson = json['data'];

    return StaffSectionConfig(
      id: json['id'] as String,
      name: json['name'] as String? ?? 'Staff',
      enabled: json['enabled'] as bool? ?? true,
      order: json['order'] as int? ?? 0,
      style: json['style'] as String,
      data: dataJson != null
          ? StaffSectionData.fromJson(dataJson as Map<String, dynamic>)
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
    'id': 'staff',
    'style': 'team_directory',
    'data': StaffSectionData.exampleJson,
  };
}
