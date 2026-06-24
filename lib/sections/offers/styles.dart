class OffersStyleId {
  OffersStyleId._();

  static const String compactHorizontalOffer = 'compact_horizontal_offer';
  static const String denseOfferList = 'dense_offer_list';
  static const String badgeBasedOffers = 'badge_based_offers';
  static const String imageLeftStrip = 'image_left_strip';
  static const String minimalOfferGrid = 'minimal_offer_grid';

  static const List<String> all = [
    compactHorizontalOffer,
    denseOfferList,
    badgeBasedOffers,
    imageLeftStrip,
    minimalOfferGrid,
  ];

  static bool isValid(String styleId) => all.contains(styleId);
}
