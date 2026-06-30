import 'package:flutter/material.dart';

/// Premium marketplace palette — light warm surfaces, deep burgundy accent.
abstract final class HomeColors {
  /// Darker burgundy for life and contrast on light UI.
  static const primary = Color(0xFF6B1832);
  static const primarySoft = Color(0xFFF6E9EE);

  static const background = Color(0xFFFCF8F7);
  static const backgroundWarm = Color(0xFFFFFDFC);

  static const surfaceIvory = Color(0xFFFFFFFF);
  static const surfaceBeige = Color(0xFFF8F1EA);
  static const bannerSurface = Color(0xFFFFFBF8);
  static const bannerBorder = Color(0xFFE9DFD6);
  static const bannerDecor = Color(0xFFF4EBE3);
  static const surfaceCard = Color(0xFFFAF6F2);
  static const categoryTint = Color(0xFFFAF5F1);
  /// Burgundy category chip — high transparency, still readable.
  static const categorySurface = Color(0x266B1832);
  static const categoryBorder = Color(0x406B1832);
  static const surfaceWhite = Color(0xFFFFFFFF);

  static const accentGold = Color(0xFFD4B88A);
  static const textPrimary = Color(0xFF3A2E2E);
  static const textSecondary = Color(0xFF9A8282);
  static const textMuted = Color(0xFFC8B4AC);

  static const searchFill = Color(0xFFF8F3F0);
  static const iconButtonGlass = Color(0xF2FFFFFF);
  static const navBackground = Color(0xFAFFFCFA);
  static const navInactive = Color(0xFFC8B0B0);
  static const categoryIcon = Color(0xFF6B1832);

  static const badgeRed = Color(0xFFE53935);
  static const starOrange = Color(0xFFF5A623);

  static const decorativeBurgundy = Color(0x106B1832);
  static const decorativeBeige = Color(0x12D4B88A);

  static List<BoxShadow> softElevation({
    double blur = 14,
    double y = 3,
    double spread = 0,
    Color? color,
  }) =>
      [
        BoxShadow(
          color: color ?? const Color(0x086B1832),
          blurRadius: blur,
          spreadRadius: spread,
          offset: Offset(0, y),
        ),
      ];

  static List<BoxShadow> whisperShadow({double blur = 10, double y = 2}) =>
      softElevation(blur: blur, y: y, color: const Color(0x056B1832));

  static List<BoxShadow> glassElevation({double blur = 18, double y = 5}) => [
        BoxShadow(
          color: const Color(0x0A6B1832),
          blurRadius: blur,
          offset: Offset(0, y),
        ),
        BoxShadow(
          color: const Color(0x08D4B88A),
          blurRadius: blur * 0.55,
          offset: const Offset(0, 1),
        ),
      ];
}
