import 'category_item.dart';

/// Categories content from the dedicated categories content API — not storefront customization.
class CategoriesSectionData {
  final List<CategoryItem> items;

  const CategoriesSectionData({
    required this.items,
  });

  factory CategoriesSectionData.fromJson(Map<String, dynamic> json) {
    final itemsJson = json['items'] as List<dynamic>? ?? [];

    return CategoriesSectionData(
      items: itemsJson
          .map((item) => CategoryItem.fromJson(item as Map<String, dynamic>))
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
        'id': 'cat_12',
        'icon': 'spa_outlined',
        'name': 'Skincare',
      },
      {
        'id': 'cat_18',
        'icon': 'fitness_center_outlined',
      },
      {
        'id': 'cat_24',
        'icon': 'restaurant_outlined',
        'name': 'Dining',
      },
    ],
  };
}
