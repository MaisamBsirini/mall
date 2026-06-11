class ThemeMood {
  final String id;
  final String name;
  final double spacingDensity;
  final double radiusScale;
  final double shadowIntensity;
  final double borderWidth;
  final bool useGlassSurfaces;
  final double cardElevation;
  final double sectionGapScale;

  const ThemeMood({
    required this.id,
    required this.name,
    this.spacingDensity = 1.0,
    this.radiusScale = 1.0,
    this.shadowIntensity = 1.0,
    this.borderWidth = 1.0,
    this.useGlassSurfaces = false,
    this.cardElevation = 1.0,
    this.sectionGapScale = 1.0,
  });
}
