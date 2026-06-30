import 'package:flutter/material.dart';

import '../services/home_icon_registry.dart';

class HomeProductModel {
  final String id;
  final String nameEn;
  final String nameAr;
  final String price;
  final double rating;
  final String iconKey;
  final bool isFavorite;

  const HomeProductModel({
    required this.id,
    required this.nameEn,
    required this.nameAr,
    required this.price,
    required this.rating,
    required this.iconKey,
    this.isFavorite = false,
  });

  IconData get imageIcon => HomeIconRegistry.icon(iconKey);

  HomeProductModel copyWith({bool? isFavorite}) {
    return HomeProductModel(
      id: id,
      nameEn: nameEn,
      nameAr: nameAr,
      price: price,
      rating: rating,
      iconKey: iconKey,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  factory HomeProductModel.fromJson(Map<String, dynamic> json) {
    return HomeProductModel(
      id: json['id'] as String,
      nameEn: json['name_en'] as String,
      nameAr: json['name_ar'] as String,
      price: json['price'] as String,
      rating: (json['rating'] as num).toDouble(),
      iconKey: json['icon_key'] as String,
      isFavorite: json['is_favorite'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name_en': nameEn,
        'name_ar': nameAr,
        'price': price,
        'rating': rating,
        'icon_key': iconKey,
        'is_favorite': isFavorite,
      };
}
