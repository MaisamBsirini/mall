import 'package:flutter/material.dart';

import '../styles/reviews/compact_reviews_list.dart';
import '../styles/reviews/featured_review_card.dart';
import '../styles/reviews/minimal_rating_strip.dart';
import '../styles/reviews/rating_summary.dart';
import '../styles/reviews/review_timeline.dart';
import 'styles.dart';

/// Style registry for the Reviews section — maps styleId → widget.
abstract final class ReviewsSectionRenderer {
  static const sectionId = 'reviews';

  static Widget build(String styleId) {
    return _builders[styleId]?.call() ?? const _UnknownReviewsStyle();
  }

  static final Map<String, Widget Function()> _builders = {
    ReviewsStyleId.ratingSummary: () => const RatingSummaryReviews(),
    ReviewsStyleId.compactReviewsList: () => const CompactReviewsList(),
    ReviewsStyleId.featuredReviewCard: () => const FeaturedReviewCard(),
    ReviewsStyleId.reviewTimeline: () => const ReviewTimeline(),
    ReviewsStyleId.minimalRatingStrip: () => const MinimalRatingStrip(),
  };
}

class _UnknownReviewsStyle extends StatelessWidget {
  const _UnknownReviewsStyle();

  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}
