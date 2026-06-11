import '../models/theme_mood.dart';
import 'theme_ids.dart';

class ThemeRegistry {
  ThemeRegistry._();

  static const ThemeMood luxuryDark = ThemeMood(
    id: ThemeId.luxuryDark,
    name: 'Luxury Dark',
    spacingDensity: 1.05,
    radiusScale: 1.1,
    shadowIntensity: 1.3,
    borderWidth: 1.0,
    cardElevation: 1.2,
    sectionGapScale: 1.1,
  );

  static const ThemeMood minimalLight = ThemeMood(
    id: ThemeId.minimalLight,
    name: 'Minimal Light',
    spacingDensity: 0.92,
    radiusScale: 0.9,
    shadowIntensity: 0.5,
    borderWidth: 0.8,
    cardElevation: 0.6,
    sectionGapScale: 0.9,
  );

  static const ThemeMood modernGradient = ThemeMood(
    id: ThemeId.modernGradient,
    name: 'Modern Gradient',
    spacingDensity: 1.0,
    radiusScale: 1.15,
    shadowIntensity: 1.1,
    borderWidth: 0.6,
    cardElevation: 1.0,
    sectionGapScale: 1.0,
  );

  static const ThemeMood softNeutral = ThemeMood(
    id: ThemeId.softNeutral,
    name: 'Soft Neutral',
    spacingDensity: 1.02,
    radiusScale: 1.0,
    shadowIntensity: 0.7,
    borderWidth: 1.0,
    cardElevation: 0.8,
    sectionGapScale: 1.05,
  );

  static const ThemeMood glassmorphism = ThemeMood(
    id: ThemeId.glassmorphism,
    name: 'Glassmorphism',
    spacingDensity: 1.08,
    radiusScale: 1.25,
    shadowIntensity: 0.9,
    borderWidth: 0.5,
    useGlassSurfaces: true,
    cardElevation: 0.7,
    sectionGapScale: 1.1,
  );

  static const ThemeMood elegantEditorial = ThemeMood(
    id: ThemeId.elegantEditorial,
    name: 'Elegant Editorial',
    spacingDensity: 1.12,
    radiusScale: 0.85,
    shadowIntensity: 0.6,
    borderWidth: 1.2,
    cardElevation: 0.5,
    sectionGapScale: 1.15,
  );

  static const ThemeMood vibrantCommerce = ThemeMood(
    id: ThemeId.vibrantCommerce,
    name: 'Vibrant Commerce',
    spacingDensity: 0.95,
    radiusScale: 1.05,
    shadowIntensity: 1.2,
    borderWidth: 0.8,
    cardElevation: 1.1,
    sectionGapScale: 0.95,
  );

  static const ThemeMood cleanSaas = ThemeMood(
    id: ThemeId.cleanSaas,
    name: 'Clean SaaS',
    spacingDensity: 0.88,
    radiusScale: 0.95,
    shadowIntensity: 0.45,
    borderWidth: 1.0,
    cardElevation: 0.5,
    sectionGapScale: 0.85,
  );

  static const ThemeMood wellnessStyle = ThemeMood(
    id: ThemeId.wellnessStyle,
    name: 'Wellness Style',
    spacingDensity: 1.1,
    radiusScale: 1.2,
    shadowIntensity: 0.55,
    borderWidth: 0.7,
    cardElevation: 0.7,
    sectionGapScale: 1.12,
  );

  static const ThemeMood premiumBoutique = ThemeMood(
    id: ThemeId.premiumBoutique,
    name: 'Premium Boutique',
    spacingDensity: 1.06,
    radiusScale: 1.08,
    shadowIntensity: 1.0,
    borderWidth: 1.1,
    cardElevation: 1.0,
    sectionGapScale: 1.08,
  );

  static const Map<String, ThemeMood> _themes = {
    ThemeId.luxuryDark: luxuryDark,
    ThemeId.minimalLight: minimalLight,
    ThemeId.modernGradient: modernGradient,
    ThemeId.softNeutral: softNeutral,
    ThemeId.glassmorphism: glassmorphism,
    ThemeId.elegantEditorial: elegantEditorial,
    ThemeId.vibrantCommerce: vibrantCommerce,
    ThemeId.cleanSaas: cleanSaas,
    ThemeId.wellnessStyle: wellnessStyle,
    ThemeId.premiumBoutique: premiumBoutique,
  };

  static ThemeMood get(String id) => _themes[id] ?? luxuryDark;

  static List<ThemeMood> get all => _themes.values.toList();
}
