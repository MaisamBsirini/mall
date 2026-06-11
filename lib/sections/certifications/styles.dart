class CertificationsStyleId {
  CertificationsStyleId._();

  static const String hallOfAchievements = 'hall_of_achievements';
  static const String certificationTimeline = 'certification_timeline';
  static const String badgeCollection = 'badge_collection';
  static const String trophyShowcase = 'trophy_showcase';
  static const String certificateWall = 'certificate_wall';

  static const List<String> all = [
    hallOfAchievements,
    certificationTimeline,
    badgeCollection,
    trophyShowcase,
    certificateWall,
  ];

  static bool isValid(String styleId) => all.contains(styleId);
}
