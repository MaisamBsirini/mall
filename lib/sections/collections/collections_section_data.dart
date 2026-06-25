import 'collection_item.dart';

/// Collections content from the dedicated collections content API — not storefront customization.
///
/// Excluded by design:
/// - [icon] — image-based styles; visuals come from [CollectionItem.coverImage]
/// - item counts — computed dynamically from associated products/services
class CollectionsSectionData {
  final List<CollectionItem> items;

  const CollectionsSectionData({
    required this.items,
  });

  factory CollectionsSectionData.fromJson(Map<String, dynamic> json) {
    final itemsJson = json['items'] as List<dynamic>? ?? [];

    return CollectionsSectionData(
      items: itemsJson
          .map((item) => CollectionItem.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'items': items.map((item) => item.toJson()).toList(),
    };
  }

  static const Map<String, dynamic> exampleJson = {
    'items': [
      {
        'id': 'col_7',
        'name': 'Best Sellers',
        'cover_image': 'https://cdn.example.com/collections/best-sellers.jpg',
        'description': 'Top-rated products this month',
      },
      {
        'id': 'col_12',
        'name': 'New Arrivals',
        'cover_image': 'https://cdn.example.com/collections/new-arrivals.jpg',
      },
    ],
  };
}
