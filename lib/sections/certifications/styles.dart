class CertificationsStyleId {
  CertificationsStyleId._();

  static const String certificateWall = 'certificate_wall';
  static const String achievementGallery = 'achievement_gallery';
  static const String awardsShowcase = 'awards_showcase';
  static const String masonryAchievements = 'masonry_achievements';
  static const String premiumCarousel = 'premium_carousel';

  static const List<String> all = [
    certificateWall,
    achievementGallery,
    awardsShowcase,
    masonryAchievements,
    premiumCarousel,
  ];

  static bool isValid(String styleId) => all.contains(styleId);
}
