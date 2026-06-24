/// A visual product or service collection.
///
/// Merchants manage [name], [coverImage], and optionally [description].
/// [itemCount] is computed server-side from linked products/services.
/// Icons and layout chrome are defined by the selected collection style.
class CollectionItem {
  final String? id;
  final String name;
  final String coverImage;
  final String? description;

  const CollectionItem({
    this.id,
    required this.name,
    required this.coverImage,
    this.description,
  });

  factory CollectionItem.fromJson(Map<String, dynamic> json) {
    return CollectionItem(
      id: json['id'] as String?,
      name: json['name'] as String,
      coverImage: json['cover_image'] as String,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'cover_image': coverImage,
      if (description != null) 'description': description,
    };
  }
}
