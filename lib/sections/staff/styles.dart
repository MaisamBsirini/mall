class StaffStyleId {
  StaffStyleId._();

  static const String alternatingStaff = 'alternating_staff';
  static const String teamDirectory = 'team_directory';
  static const String premiumSpecialistsGrid = 'premium_specialists_grid';

  static const List<String> all = [
    alternatingStaff,
    teamDirectory,
    premiumSpecialistsGrid,
  ];

  static bool isValid(String styleId) => all.contains(styleId);
}
