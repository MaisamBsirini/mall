/// Visual content for a single banner slide.
///
/// Layout-only contract: no navigation actions or badges.
/// Button appearance text ([ctaText]) is visual; tap handling lives elsewhere.
class BannerItem {
  final String? id;
  final String imageUrl;
  final String? title;
  final String? subtitle;
  final String? ctaText;
  final int? sortOrder;
  final String? textColor;

  const BannerItem({
    this.id,
    required this.imageUrl,
    this.title,
    this.subtitle,
    this.ctaText,
    this.sortOrder,
    this.textColor,
  });

  factory BannerItem.fromJson(Map<String, dynamic> json) {
    return BannerItem(
      id: json['id'] as String?,
      imageUrl: json['image_url'] as String,
      title: json['title'] as String?,
      subtitle: json['subtitle'] as String?,
      ctaText: json['cta_text'] as String?,
      sortOrder: json['sort_order'] as int?,
      textColor: json['text_color'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'image_url': imageUrl,
      if (title != null) 'title': title,
      if (subtitle != null) 'subtitle': subtitle,
      if (ctaText != null) 'cta_text': ctaText,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (textColor != null) 'text_color': textColor,
    };
  }
}
