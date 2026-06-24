/// A promotional product offer — image and discount first.
class OfferItem {
  final String id;
  final String productName;
  final String image;
  final int discountPercentage;

  const OfferItem({
    required this.id,
    required this.productName,
    required this.image,
    required this.discountPercentage,
  });

  factory OfferItem.fromJson(Map<String, dynamic> json) {
    return OfferItem(
      id: json['id'] as String,
      productName: json['product_name'] as String,
      image: json['image'] as String,
      discountPercentage: json['discount_percentage'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product_name': productName,
      'image': image,
      'discount_percentage': discountPercentage,
    };
  }
}
