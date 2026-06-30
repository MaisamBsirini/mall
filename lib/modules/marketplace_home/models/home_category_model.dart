import 'package:flutter/material.dart';

import '../services/home_icon_registry.dart';

class HomeCategoryModel {
  final String id;
  final String nameEn;
  final String nameAr;
  final String iconKey;

  const HomeCategoryModel({
    required this.id,
    required this.nameEn,
    required this.nameAr,
    required this.iconKey,
  });

  IconData get icon => HomeIconRegistry.icon(iconKey);

  factory HomeCategoryModel.fromJson(Map<String, dynamic> json) {
    return HomeCategoryModel(
      id: json['id'] as String,
      nameEn: json['name_en'] as String,
      nameAr: json['name_ar'] as String,
      iconKey: json['icon_key'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name_en': nameEn,
        'name_ar': nameAr,
        'icon_key': iconKey,
      };
}
