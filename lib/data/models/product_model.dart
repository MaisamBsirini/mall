class ProductModel {
  final int id;

  final String name;

  final String imagePng;

  final double price;

  final double rating;

  final bool isFavorite;

  final List<String> sizes;

  final String selectedSize;

  final String category;

  ProductModel({
    required this.id,
    required this.name,
    required this.imagePng,
    required this.price,
    required this.rating,
    required this.isFavorite,
    required this.sizes,
    required this.selectedSize,
    required this.category,
  });
}