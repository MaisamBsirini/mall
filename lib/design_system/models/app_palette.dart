import 'package:flutter/material.dart';

class AppPalette {
  final String id;
  final String name;
  final Color primary;
  final Color secondary;
  final Color background;
  final Color surface;
  final Color textPrimary;
  final Color textSecondary;
  final Color accent;
  final Color border;
  final Color success;
  final Color warning;
  final bool isDark;

  const AppPalette({
    required this.id,
    required this.name,
    required this.primary,
    required this.secondary,
    required this.background,
    required this.surface,
    required this.textPrimary,
    required this.textSecondary,
    required this.accent,
    required this.border,
    required this.success,
    required this.warning,
    this.isDark = false,
  });

  Color get onPrimary =>
      isDark ? Colors.white : _contrastOn(primary);

  Color get onSurface => textPrimary;

  Color get onDarkSurface => isDark ? Colors.white : textPrimary;

  Color get placeholderLight =>
      Color.lerp(surface, textSecondary, isDark ? 0.08 : 0.04)!;

  Color get placeholderMid =>
      Color.lerp(surface, textSecondary, isDark ? 0.14 : 0.10)!;

  Color get placeholderMuted => placeholderMid;

  Color get placeholderDark =>
      Color.lerp(surface, textSecondary, isDark ? 0.22 : 0.16)!;

  Color get shimmerHighlight =>
      Color.lerp(placeholderMid, surface, 0.55)!;

  Color get overlayDark => Colors.black.withOpacity(isDark ? 0.65 : 0.55);

  Color get glassFill => (isDark ? Colors.white : surface).withOpacity(0.12);

  Color get glassBorder => (isDark ? Colors.white : border).withOpacity(0.22);

  Color primarySoft([double opacity = 0.08]) =>
      primary.withOpacity(opacity);

  Color accentSoft([double opacity = 0.25]) =>
      accent.withOpacity(opacity);

  static Color _contrastOn(Color background) {
    return background.computeLuminance() > 0.5
        ? const Color(0xFF1A1A1A)
        : Colors.white;
  }
}
