class StaffStyleId {
  StaffStyleId._();

  static const String alternatingProfileList = 'alternating_profile_list';
  static const String expertCardsGrid = 'expert_cards_grid';
  static const String featuredSpecialists = 'featured_specialists';

  static const List<String> all = [
    alternatingProfileList,
    expertCardsGrid,
    featuredSpecialists,
  ];

  static bool isValid(String styleId) => all.contains(styleId);
}
