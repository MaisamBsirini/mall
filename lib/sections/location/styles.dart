class LocationStyleId {
  LocationStyleId._();

  static const String cornerLocationBadge = 'corner_location_badge';
  static const String floatingLocationPill = 'floating_location_pill';
  static const String locationBubble = 'location_bubble';
  static const String locationRibbon = 'location_ribbon';
  static const String headerLocationChip = 'header_location_chip';

  static const List<String> all = [
    cornerLocationBadge,
    floatingLocationPill,
    locationBubble,
    locationRibbon,
    headerLocationChip,
  ];

  static bool isValid(String styleId) => all.contains(styleId);
}
