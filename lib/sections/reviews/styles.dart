class ReviewsStyleId {
  ReviewsStyleId._();

  static const String reviewDashboard = 'review_dashboard';
  static const String floatingRatingHeader = 'floating_rating_header';
  static const String featuredRatingHero = 'featured_rating_hero';
  static const String ratingSidebar = 'rating_sidebar';
  static const String editorialTimelineReviews = 'editorial_timeline_reviews';

  static const List<String> all = [
    reviewDashboard,
    floatingRatingHeader,
    featuredRatingHero,
    ratingSidebar,
    editorialTimelineReviews,
  ];

  static bool isValid(String styleId) => all.contains(styleId);
}
