class SocialStyleId {
  SocialStyleId._();

  static const String minimalSocialChips = 'minimal_social_chips';
  static const String floatingIconGrid = 'floating_icon_grid';
  static const String compactProfileStrip = 'compact_profile_strip';
  static const String elegantCardStack = 'elegant_card_stack';
  static const String bottomSocialDock = 'bottom_social_dock';

  static const List<String> all = [
    minimalSocialChips,
    floatingIconGrid,
    compactProfileStrip,
    elegantCardStack,
    bottomSocialDock,
  ];

  static bool isValid(String styleId) => all.contains(styleId);
}
