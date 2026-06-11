import '../design_system/registries/palette_ids.dart';
import '../design_system/registries/theme_ids.dart';
import '../design_system/registries/typography_ids.dart';

/// Curated palette + theme mood pairings for the design playground.
class ShowcaseThemePreset {
  final String id;
  final String name;
  final String paletteId;
  final String themeId;

  const ShowcaseThemePreset({
    required this.id,
    required this.name,
    required this.paletteId,
    required this.themeId,
  });

  static const List<ShowcaseThemePreset> all = [
    ShowcaseThemePreset(
      id: 'luxury_dark',
      name: 'Luxury Dark',
      paletteId: PaletteId.luxuryDark,
      themeId: ThemeId.luxuryDark,
    ),
    ShowcaseThemePreset(
      id: 'minimal_light',
      name: 'Minimal Light',
      paletteId: PaletteId.warmMinimal,
      themeId: ThemeId.minimalLight,
    ),
    ShowcaseThemePreset(
      id: 'rose_boutique',
      name: 'Rose Boutique',
      paletteId: PaletteId.roseBoutique,
      themeId: ThemeId.premiumBoutique,
    ),
    ShowcaseThemePreset(
      id: 'modern_indigo',
      name: 'Modern Indigo',
      paletteId: PaletteId.modernIndigo,
      themeId: ThemeId.modernGradient,
    ),
    ShowcaseThemePreset(
      id: 'premium_monochrome',
      name: 'Premium Monochrome',
      paletteId: PaletteId.premiumMonochrome,
      themeId: ThemeId.elegantEditorial,
    ),
  ];

  static ShowcaseThemePreset get(String id) {
    return all.firstWhere(
      (preset) => preset.id == id,
      orElse: () => all.first,
    );
  }
}

/// Curated typography options for side-by-side comparison.
class ShowcaseTypographyPreset {
  final String id;
  final String name;

  const ShowcaseTypographyPreset({
    required this.id,
    required this.name,
  });

  static const List<ShowcaseTypographyPreset> all = [
    ShowcaseTypographyPreset(
      id: TypographyId.elegantSerif,
      name: 'Elegant Serif',
    ),
    ShowcaseTypographyPreset(
      id: TypographyId.modernSans,
      name: 'Modern Sans',
    ),
    ShowcaseTypographyPreset(
      id: TypographyId.premiumDisplay,
      name: 'Premium Display',
    ),
    ShowcaseTypographyPreset(
      id: TypographyId.softRounded,
      name: 'Soft Rounded',
    ),
  ];

  static ShowcaseTypographyPreset get(String id) {
    return all.firstWhere(
      (preset) => preset.id == id,
      orElse: () => all.first,
    );
  }
}
