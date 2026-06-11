class BannerStyleId {
  BannerStyleId._();

  static const String hero = 'hero_banner';
  static const String slider = 'slider_banner';
  static const String minimal = 'minimal_banner';
  static const String modern = 'modern_banner';
  static const String glass = 'glass_banner';

  static const List<String> all = [
    hero,
    slider,
    minimal,
    modern,
    glass,
  ];

  static bool isValid(String styleId) => all.contains(styleId);
}
