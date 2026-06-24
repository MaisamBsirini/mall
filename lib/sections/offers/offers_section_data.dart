import 'offer_item.dart';

/// Merchant-provided offers content.
class OffersSectionData {
  final List<OfferItem> items;

  const OffersSectionData({
    required this.items,
  });

  factory OffersSectionData.fromJson(Map<String, dynamic> json) {
    final itemsJson = json['items'] as List<dynamic>? ?? [];

    return OffersSectionData(
      items: itemsJson
          .map((item) => OfferItem.fromJson(item as Map<String, dynamic>))
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
        'id': 'offer_1',
        'product_name': 'All Orders',
        'image': 'product.jpg',
        'discount_percentage': 20,
      },
      {
        'id': 'offer_2',
        'product_name': 'New Users',
        'image': 'product_2.jpg',
        'discount_percentage': 15,
      },
      {
        'id': 'offer_3',
        'product_name': 'Weekend Sale',
        'image': 'product_3.jpg',
        'discount_percentage': 30,
      },
      {
        'id': 'offer_4',
        'product_name': 'VIP Members',
        'image': 'product_4.jpg',
        'discount_percentage': 25,
      },
    ],
  };
}
