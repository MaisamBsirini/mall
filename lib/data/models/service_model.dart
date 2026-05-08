class ServiceModel {
  final int id;
  final String name;
  final String image;
  final double rating;
  final bool isFavorite;

  ServiceModel({
    required this.id,
    required this.name,
    required this.image,
    required this.rating,
    required this.isFavorite,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      rating: (json['rating'] ?? 0).toDouble(),
      isFavorite: json['is_favorite'] ?? false,
    );
  }
}