class StoreModel {
  final int id;
  final String name;
  final String image;
  final double rating;
  final bool isOpen;

  final double mapX;
  final double mapY;

  final String category;

  StoreModel({
    required this.id,
    required this.name,
    required this.image,
    required this.rating,
    required this.isOpen,
    required this.mapX,
    required this.mapY,
    required this.category,
  });
}