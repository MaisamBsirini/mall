import 'review_item.dart';

/// Reviews content from the dedicated reviews content API — not storefront customization.
class ReviewsSectionData {
  final String? title;
  final double averageRating;
  final int reviewCount;
  final Map<String, int>? distribution;
  final double? minRating;
  final List<ReviewItem> items;

  const ReviewsSectionData({
    this.title,
    required this.averageRating,
    required this.reviewCount,
    this.distribution,
    this.minRating,
    required this.items,
  });

  factory ReviewsSectionData.fromJson(Map<String, dynamic> json) {
    final itemsJson = json['items'] as List<dynamic>? ?? [];
    final distributionJson = json['distribution'] as Map<String, dynamic>?;

    return ReviewsSectionData(
      title: json['title'] as String?,
      averageRating: (json['average_rating'] as num).toDouble(),
      reviewCount: json['review_count'] as int,
      distribution: distributionJson?.map(
        (key, value) => MapEntry(key, value as int),
      ),
      minRating: (json['min_rating'] as num?)?.toDouble(),
      items: itemsJson
          .map((item) => ReviewItem.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (title != null) 'title': title,
      'average_rating': averageRating,
      'review_count': reviewCount,
      if (distribution != null) 'distribution': distribution,
      if (minRating != null) 'min_rating': minRating,
      'items': items.map((item) => item.toJson()).toList(),
    };
  }

  static const Map<String, dynamic> exampleJson = {
    'average_rating': 4.8,
    'review_count': 256,
    'distribution': {'5': 180, '4': 52, '3': 16, '2': 5, '1': 3},
    'items': [
      {
        'id': 'rev_901',
        'reviewer_name': 'Sarah M.',
        'rating': 5,
        'comment': 'Excellent service and fast delivery.',
        'created_at': '2026-03-01T14:22:00Z',
        'is_verified': true,
        'reportable': true,
      },
      {
        'id': 'rev_902',
        'reviewer_name': 'James L.',
        'rating': 4,
        'comment': 'Great experience overall. Would recommend.',
        'created_at': '2026-02-18T09:15:00Z',
        'is_verified': true,
        'reportable': true,
      },
    ],
  };
}
