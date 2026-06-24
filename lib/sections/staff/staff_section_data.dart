import 'staff_item.dart';

/// Merchant-provided staff content — team introductions only.
class StaffSectionData {
  final String? title;
  final List<StaffItem> items;

  const StaffSectionData({
    this.title,
    required this.items,
  });

  factory StaffSectionData.fromJson(Map<String, dynamic> json) {
    final itemsJson = json['items'] as List<dynamic>? ?? [];

    return StaffSectionData(
      title: json['title'] as String?,
      items: itemsJson
          .map((item) => StaffItem.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (title != null) 'title': title,
      'items': items.map((item) => item.toJson()).toList(),
    };
  }

  static const Map<String, dynamic> exampleJson = {
    'title': 'Our Team',
    'items': [
      {
        'id': 'staff_1',
        'full_name': 'Dr. Amira Hassan',
        'role': 'Dermatology Specialist',
        'profile_image_url': 'staff.jpg',
        'short_bio': '10+ years experience.',
      },
      {
        'id': 'staff_2',
        'full_name': 'Dr. James Chen',
        'role': 'Aesthetic Medicine',
        'profile_image_url': 'staff_2.jpg',
        'short_bio': 'Board-certified with a focus on skin rejuvenation.',
      },
    ],
  };
}
