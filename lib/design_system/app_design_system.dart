import 'package:flutter/material.dart';

import 'merchant_design_config.dart';
import 'models/app_palette.dart';
import 'models/typography_profile.dart';
import 'registries/palette_registry.dart';
import 'registries/typography_registry.dart';
import 'resolved/resolved_typography.dart';
import 'tokens/design_tokens.dart';
import 'widgets/placeholder_widgets.dart';

class AppDesignSystem {
  final AppPalette palette;
  final TypographyProfile typographyProfile;
  final ResolvedTypography typography;
  final DesignTokens tokens;
  late final PlaceholderWidgets placeholders;

  AppDesignSystem._({
    required this.palette,
    required this.typographyProfile,
    required this.typography,
    required this.tokens,
  }) {
    placeholders = PlaceholderWidgets(this);
  }

  factory AppDesignSystem.resolve({
    required String paletteId,
    required String typographyId,
  }) {
    final palette = PaletteRegistry.get(paletteId);
    final typographyProfile = TypographyRegistry.get(typographyId);

    final typography = ResolvedTypography(
      profile: typographyProfile,
      palette: palette,
    );

    final tokens = DesignTokens(palette: palette);

    return AppDesignSystem._(
      palette: palette,
      typographyProfile: typographyProfile,
      typography: typography,
      tokens: tokens,
    );
  }

  factory AppDesignSystem.fromConfig(MerchantDesignConfig config) {
    return AppDesignSystem.resolve(
      paletteId: config.paletteId,
      typographyId: config.typographyId,
    );
  }

  ThemeData toThemeData() {
    return ThemeData(
      useMaterial3: true,
      brightness: palette.isDark ? Brightness.dark : Brightness.light,
      scaffoldBackgroundColor: palette.background,
      colorScheme: ColorScheme(
        brightness: palette.isDark ? Brightness.dark : Brightness.light,
        primary: palette.primary,
        onPrimary: palette.onPrimary,
        secondary: palette.secondary,
        onSecondary: palette.onPrimary,
        error: palette.warning,
        onError: palette.onPrimary,
        surface: palette.surface,
        onSurface: palette.textPrimary,
      ),
      dividerColor: palette.border,
      cardColor: palette.surface,
      fontFamily: typographyProfile.fontFamily,
    );
  }
}
