class StaffSectionConfig {
  final String id;
  final String name;
  final bool enabled;
  final int order;
  final String style;

  const StaffSectionConfig({
    required this.id,
    required this.name,
    required this.enabled,
    required this.order,
    required this.style,
  });

  factory StaffSectionConfig.fromJson(Map<String, dynamic> json) {
    return StaffSectionConfig(
      id: json['id'] as String,
      name: json['name'] as String? ?? 'Staff',
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
    'id': 'staff',
    'name': 'Staff',
    'enabled': true,
    'order': 6,
    'style': 'team_directory',
  };
}
