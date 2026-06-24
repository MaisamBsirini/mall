/// A certification, award, or credential showcase entry.
///
/// Visual trust-building only — [images] are the primary content;
/// [title] is secondary supporting text.
class CertificationItem {
  final String id;
  final String title;
  final List<String> images;

  const CertificationItem({
    required this.id,
    required this.title,
    required this.images,
  });

  factory CertificationItem.fromJson(Map<String, dynamic> json) {
    final imagesJson = json['images'] as List<dynamic>? ?? [];

    return CertificationItem(
      id: json['id'] as String,
      title: json['title'] as String,
      images: imagesJson.map((e) => e as String).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'images': images,
    };
  }
}
