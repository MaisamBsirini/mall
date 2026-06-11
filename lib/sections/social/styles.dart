class SocialStyleId {
  SocialStyleId._();

  static const String socialHub = 'social_hub';
  static const String socialWall = 'social_wall';
  static const String socialCarousel = 'social_carousel';
  static const String glassSocialPanel = 'glass_social_panel';
  static const String creatorShowcase = 'creator_showcase';

  static const List<String> all = [
    socialHub,
    socialWall,
    socialCarousel,
    glassSocialPanel,
    creatorShowcase,
  ];

  static bool isValid(String styleId) => all.contains(styleId);
}
