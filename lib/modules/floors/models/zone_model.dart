import 'package:flutter/material.dart';

import '../../marketplace_home/services/home_icon_registry.dart';
import 'zone_type.dart';

class ZoneModel {
  final String id;
  final String nameEn;
  final String nameAr;
  final ZoneType type;
  final String iconKey;
  final String gradientStartHex;
  final String gradientEndHex;

  const ZoneModel({
    required this.id,
    required this.nameEn,
    required this.nameAr,
    required this.type,
    required this.iconKey,
    required this.gradientStartHex,
    required this.gradientEndHex,
  });

  IconData get placeholderIcon => HomeIconRegistry.icon(iconKey);

  List<Color> get imageGradient => [
        HomeIconRegistry.colorFromHex(gradientStartHex),
        HomeIconRegistry.colorFromHex(gradientEndHex),
      ];

  factory ZoneModel.fromJson(Map<String, dynamic> json) {
    return ZoneModel(
      id: json['id'] as String,
      nameEn: json['name_en'] as String,
      nameAr: json['name_ar'] as String,
      type: ZoneType.fromJson(json['type'] as String),
      iconKey: json['icon_key'] as String,
      gradientStartHex: json['gradient_start'] as String,
      gradientEndHex: json['gradient_end'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name_en': nameEn,
        'name_ar': nameAr,
        'type': type.toJson(),
        'icon_key': iconKey,
        'gradient_start': gradientStartHex,
        'gradient_end': gradientEndHex,
      };
}
