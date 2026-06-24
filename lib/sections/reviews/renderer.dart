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

    final data = config.data;

    switch (config.style) {
      case ReviewsStyleId.reviewDashboard:
        return ReviewDashboardStyle(data: data);
      case ReviewsStyleId.floatingRatingHeader:
        return FloatingRatingHeaderStyle(data: data);
      case ReviewsStyleId.featuredRatingHero:
        return FeaturedRatingHeroStyle(data: data);
      case ReviewsStyleId.ratingSidebar:
        return RatingSidebarStyle(data: data);
      case ReviewsStyleId.editorialTimelineReviews:
        return EditorialTimelineReviewsStyle(data: data);
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
