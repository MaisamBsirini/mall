import 'package:flutter/material.dart';

/// Maps API icon keys to Flutter icons — replace with asset URLs when API ships.
abstract final class HomeIconRegistry {
  static IconData icon(String key) =>
      _icons[key] ?? Icons.image_outlined;

  static Color colorFromHex(String hex) {
    final value = hex.replaceFirst('#', '');
    return Color(int.parse('FF$value', radix: 16));
  }

  static const _icons = <String, IconData>{
    'local_florist': Icons.local_florist_rounded,
    'wb_sunny': Icons.wb_sunny_outlined,
    'spa': Icons.spa_outlined,
    'restaurant_menu': Icons.restaurant_menu_rounded,
    'checkroom': Icons.checkroom_outlined,
    'smartphone': Icons.smartphone_outlined,
    'face_retouching': Icons.face_retouching_natural_outlined,
    'chair': Icons.chair_outlined,
    'handyman': Icons.handyman_outlined,
    'shopping_bag': Icons.shopping_bag_outlined,
    'headphones': Icons.headphones_outlined,
    'water_drop': Icons.water_drop_outlined,
    'light': Icons.light_outlined,
  };
}
