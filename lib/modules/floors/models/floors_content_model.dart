import 'floor_badge_model.dart';
import 'floor_model.dart';

class FloorsContentModel {
  final List<FloorModel> floors;
  final List<FloorBadgeModel> interstitialBadges;

  const FloorsContentModel({
    required this.floors,
    required this.interstitialBadges,
  });

  factory FloorsContentModel.fromJson(Map<String, dynamic> json) {
    return FloorsContentModel(
      floors: (json['floors'] as List<dynamic>)
          .map((e) => FloorModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      interstitialBadges: (json['interstitial_badges'] as List<dynamic>? ?? [])
          .map((e) => FloorBadgeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'floors': floors.map((e) => e.toJson()).toList(),
        'interstitial_badges':
            interstitialBadges.map((e) => e.toJson()).toList(),
      };
}
