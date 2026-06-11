class CollectionsStyleId {
  CollectionsStyleId._();

  static const String horizontalCircles = 'horizontal_circles';
  static const String rectangleCards = 'rectangle_cards';
  static const String splitCards = 'split_cards';
  static const String stackedCards = 'stacked_cards';
  static const String minimalTiles = 'minimal_tiles';

  static const List<String> all = [
    horizontalCircles,
    rectangleCards,
    splitCards,
    stackedCards,
    minimalTiles,
  ];

  static bool isValid(String styleId) => all.contains(styleId);
}
