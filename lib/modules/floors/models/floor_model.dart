import 'floor_badge_model.dart';
import 'zone_model.dart';

class FloorModel {
  final String id;
  final String titleEn;
  final String titleAr;
  final List<ZoneModel> zones;
  final FloorBadgeModel? badge;

  const FloorModel({
    required this.id,
    required this.titleEn,
    required this.titleAr,
    required this.zones,
    this.badge,
  });

  factory FloorModel.fromJson(Map<String, dynamic> json) {
    return FloorModel(
      id: json['id'] as String,
      titleEn: json['title_en'] as String,
      titleAr: json['title_ar'] as String,
      zones: (json['zones'] as List<dynamic>)
          .map((e) => ZoneModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      badge: json['badge'] == null
          ? null
          : FloorBadgeModel.fromJson(json['badge'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title_en': titleEn,
        'title_ar': titleAr,
        'zones': zones.map((e) => e.toJson()).toList(),
        if (badge != null) 'badge': badge!.toJson(),
      };
}
