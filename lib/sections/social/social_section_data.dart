import 'social_item.dart';

/// Merchant-provided social links — platform icons and profile URLs only.
class SocialSectionData {
  final String? title;
  final List<SocialItem> items;

  const SocialSectionData({
    this.title,
    required this.items,
  });

  factory SocialSectionData.fromJson(Map<String, dynamic> json) {
    final itemsJson = json['items'] as List<dynamic>? ?? [];

    return SocialSectionData(
      title: json['title'] as String?,
      items: itemsJson
          .map((item) => SocialItem.fromJson(item as Map<String, dynamic>))
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
    'title': 'Follow Us',
    'items': [
      {
        'platform': 'instagram',
        'profile_url': 'https://instagram.com/store',
      },
      {
        'platform': 'tiktok',
        'profile_url': 'https://tiktok.com/@store',
      },
      {
        'platform': 'facebook',
        'profile_url': 'https://facebook.com/store',
      },
      {
        'platform': 'youtube',
        'profile_url': 'https://youtube.com/@store',
      },
      {
        'platform': 'x',
        'profile_url': 'https://x.com/store',
      },
    ],
  };
}
