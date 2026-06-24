import 'certification_item.dart';

/// Merchant-provided certifications content — image galleries first.
class CertificationsSectionData {
  final String? title;
  final List<CertificationItem> items;

  const CertificationsSectionData({
    this.title,
    required this.items,
  });

  factory CertificationsSectionData.fromJson(Map<String, dynamic> json) {
    final itemsJson = json['items'] as List<dynamic>? ?? [];

    return CertificationsSectionData(
      title: json['title'] as String?,
      items: itemsJson
          .map((item) => CertificationItem.fromJson(item as Map<String, dynamic>))
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
    'title': 'Our Certifications',
    'items': [
      {
        'id': 'cert_1',
        'title': 'Licensed Esthetician',
        'images': [
          'certificate_1.jpg',
          'certificate_2.jpg',
          'certificate_3.jpg',
        ],
      },
      {
        'id': 'cert_2',
        'title': 'Advanced Skincare Award',
        'images': [
          'award_1.jpg',
          'award_2.jpg',
        ],
      },
    ],
  };
}
