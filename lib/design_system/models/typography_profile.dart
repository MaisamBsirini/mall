class TypographyProfile {
  final String id;
  final String name;
  final String fontFamily;
  final String? fontFamilyFallback;
  final double headingScale;
  final double titleScale;
  final double bodyScale;
  final double captionScale;
  final double buttonScale;
  final double headingWeight;
  final double titleWeight;
  final double bodyWeight;
  final double buttonWeight;
  final double headingLetterSpacing;
  final double titleLetterSpacing;
  final double bodyLetterSpacing;
  final double captionLetterSpacing;
  final double buttonLetterSpacing;
  final double headingLineHeight;
  final double titleLineHeight;
  final double bodyLineHeight;
  final double captionLineHeight;

  const TypographyProfile({
    required this.id,
    required this.name,
    required this.fontFamily,
    this.fontFamilyFallback,
    this.headingScale = 1.0,
    this.titleScale = 1.0,
    this.bodyScale = 1.0,
    this.captionScale = 1.0,
    this.buttonScale = 1.0,
    this.headingWeight = 700,
    this.titleWeight = 600,
    this.bodyWeight = 400,
    this.buttonWeight = 600,
    this.headingLetterSpacing = -0.3,
    this.titleLetterSpacing = 0,
    this.bodyLetterSpacing = 0.1,
    this.captionLetterSpacing = 0.4,
    this.buttonLetterSpacing = 0.6,
    this.headingLineHeight = 1.15,
    this.titleLineHeight = 1.25,
    this.bodyLineHeight = 1.45,
    this.captionLineHeight = 1.35,
  });
}
