import 'package:flutter/material.dart';

import '../services/home_icon_registry.dart';

class HomeBannerModel {
  final String id;
  final String titleEn;
  final String titleAr;
  final String descriptionEn;
  final String descriptionAr;
  final String ctaEn;
  final String ctaAr;
  final String tagEn;
  final String tagAr;
  final String iconKey;
  final String gradientStartHex;
  final String gradientEndHex;

  const HomeBannerModel({
    required this.id,
    required this.titleEn,
    required this.titleAr,
    required this.descriptionEn,
    required this.descriptionAr,
    required this.ctaEn,
    required this.ctaAr,
    required this.tagEn,
    required this.tagAr,
    required this.iconKey,
    required this.gradientStartHex,
    required this.gradientEndHex,
  });

  IconData get imageIcon => HomeIconRegistry.icon(iconKey);

  List<Color> get imageGradient => [
        HomeIconRegistry.colorFromHex(gradientStartHex),
        HomeIconRegistry.colorFromHex(gradientEndHex),
      ];

  factory HomeBannerModel.fromJson(Map<String, dynamic> json) {
    return HomeBannerModel(
      id: json['id'] as String,
      titleEn: json['title_en'] as String,
      titleAr: json['title_ar'] as String,
      descriptionEn: json['description_en'] as String,
      descriptionAr: json['description_ar'] as String,
      ctaEn: json['cta_en'] as String,
      ctaAr: json['cta_ar'] as String,
      tagEn: json['tag_en'] as String,
      tagAr: json['tag_ar'] as String,
      iconKey: json['icon_key'] as String,
      gradientStartHex: json['gradient_start'] as String,
      gradientEndHex: json['gradient_end'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title_en': titleEn,
        'title_ar': titleAr,
        'description_en': descriptionEn,
        'description_ar': descriptionAr,
        'cta_en': ctaEn,
        'cta_ar': ctaAr,
        'tag_en': tagEn,
        'tag_ar': tagAr,
        'icon_key': iconKey,
        'gradient_start': gradientStartHex,
        'gradient_end': gradientEndHex,
      };
}
