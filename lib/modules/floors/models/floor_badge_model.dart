class FloorBadgeModel {
  final String id;
  final String labelEn;
  final String labelAr;

  const FloorBadgeModel({
    required this.id,
    required this.labelEn,
    required this.labelAr,
  });

  factory FloorBadgeModel.fromJson(Map<String, dynamic> json) {
    return FloorBadgeModel(
      id: json['id'] as String,
      labelEn: json['label_en'] as String,
      labelAr: json['label_ar'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'label_en': labelEn,
        'label_ar': labelAr,
      };
}
