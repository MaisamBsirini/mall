class CertificationsStyleId {
  CertificationsStyleId._();

  static const String certificateWall = 'certificate_wall';
  static const String achievementGallery = 'achievement_gallery';
  static const String premiumCarousel = 'premium_carousel';
  static const String credentialStrip = 'credential_strip';

  static const List<String> all = [
    certificateWall,
    achievementGallery,
    premiumCarousel,
    credentialStrip,
  ];

  static bool isValid(String styleId) => all.contains(styleId);
}
