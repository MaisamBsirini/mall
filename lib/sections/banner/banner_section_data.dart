import 'banner_item.dart';

/// Banner content from the dedicated banner content API — not storefront customization.
///
/// Excluded by design:
/// - Navigation / button actions (handled outside the customization system)
/// - Badges (defined by the selected banner style, not merchant content)
class BannerSectionData {
  final List<BannerItem> items;
  final bool autoplay;
  final int? autoplayIntervalMs;

  const BannerSectionData({
    required this.items,
    this.autoplay = false,
    this.autoplayIntervalMs,
  });

  factory BannerSectionData.fromJson(Map<String, dynamic> json) {
    final itemsJson = json['items'] as List<dynamic>? ?? [];

    return BannerSectionData(
      items: itemsJson
          .map((item) => BannerItem.fromJson(item as Map<String, dynamic>))
          .toList(),
      autoplay: json['autoplay'] as bool? ?? false,
      autoplayIntervalMs: json['autoplay_interval_ms'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'items': items.map((item) => item.toJson()).toList(),
      if (autoplay) 'autoplay': autoplay,
      if (autoplayIntervalMs != null)
        'autoplay_interval_ms': autoplayIntervalMs,
    };
  }

  /// Canonical API example — visual content only.
  static const Map<String, dynamic> exampleJson = {
    'autoplay': true,
    'autoplay_interval_ms': 5000,
    'items': [
      {
        'id': 'bnr_01',
        'image_url': 'https://cdn.example.com/banners/summer.jpg',
        'title': 'Summer Collection',
        'subtitle': 'New arrivals up to 30% off',
        'cta_text': 'Shop Now',
        'sort_order': 1,
      },
      {
        'id': 'bnr_02',
        'image_url': 'https://cdn.example.com/banners/wellness.jpg',
        'title': 'Wellness Week',
        'subtitle': 'Book your consultation today',
        'cta_text': 'Learn More',
        'sort_order': 2,
      },
    ],
  };
}
