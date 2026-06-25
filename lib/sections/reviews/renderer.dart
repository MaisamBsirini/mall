import 'package:flutter/material.dart';

import '../../design_system/scope/design_system_scope.dart';
import 'reviews_section_config.dart';
import 'styles.dart';
import 'styles/editorial_timeline_reviews.dart';
import 'styles/featured_rating_hero.dart';
import 'styles/floating_rating_header.dart';
import 'styles/rating_sidebar.dart';
import 'styles/review_dashboard.dart';

class ReviewsRenderer extends StatelessWidget {
  final ReviewsSectionConfig config;

  const ReviewsRenderer({
    super.key,
    required this.config,
  });

  ReviewsRenderer.fromStyleId({
    super.key,
    required String styleId,
    bool enabled = true,
  }) : config = ReviewsSectionConfig(
          id: 'reviews',
          name: 'Reviews',
          enabled: enabled,
          order: 0,
          style: styleId,
        );

  @override
  Widget build(BuildContext context) {
    if (!config.enabled) {
      return const SizedBox.shrink();
    }

    switch (config.style) {
      case ReviewsStyleId.reviewDashboard:
        return const ReviewDashboardStyle();
      case ReviewsStyleId.floatingRatingHeader:
        return const FloatingRatingHeaderStyle();
      case ReviewsStyleId.featuredRatingHero:
        return const FeaturedRatingHeroStyle();
      case ReviewsStyleId.ratingSidebar:
        return const RatingSidebarStyle();
      case ReviewsStyleId.editorialTimelineReviews:
        return const EditorialTimelineReviewsStyle();
      default:
        return const _UnknownReviewsStyle();
    }
  }
}

class _UnknownReviewsStyle extends StatelessWidget {
  const _UnknownReviewsStyle();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: context.ds.placeholders.shimmerBox(
        height: 48,
        borderRadius: context.ds.tokens.borderSm,
      ),
    );
  }
}
