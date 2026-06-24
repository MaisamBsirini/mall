import 'package:flutter/material.dart';

import '../../core/constants/app_sizes.dart';
import '../../design_system/scope/design_system_scope.dart';
import 'review_item.dart';
import 'reviews_section_data.dart';

enum AverageRatingSize { compact, standard, hero }

class ReviewsTokens {
  ReviewsTokens._();

  static const List<ReviewItem> mockItems = [
    ReviewItem(
      id: 'rev_1',
      reviewerName: 'Sarah M.',
      rating: 5,
      comment: 'Excellent service and fast delivery.',
      isVerified: true,
    ),
    ReviewItem(
      id: 'rev_2',
      reviewerName: 'James L.',
      rating: 4,
      comment: 'Great experience overall. Would recommend.',
      isVerified: true,
    ),
    ReviewItem(
      id: 'rev_3',
      reviewerName: 'Emily R.',
      rating: 5,
      comment: 'Professional team and beautiful results.',
    ),
    ReviewItem(
      id: 'rev_4',
      reviewerName: 'Michael T.',
      rating: 4,
      comment: 'Very satisfied with the quality of service.',
    ),
  ];

  static const ReviewsSectionData mockData = ReviewsSectionData(
    averageRating: 4.8,
    reviewCount: 256,
    distribution: {'5': 180, '4': 52, '3': 16, '2': 5, '1': 3},
    items: mockItems,
  );

  static ReviewsSectionData resolveData(ReviewsSectionData? data) {
    if (data != null && data.items.isNotEmpty) return data;
    return mockData;
  }

  static List<ReviewItem> resolveItems(ReviewsSectionData? data) {
    return resolveData(data).items;
  }

  static int itemCount(ReviewsSectionData? data) => resolveItems(data).length;

  static double horizontalMargin(BuildContext context) =>
      context.ds.tokens.horizontalMargin(context);

  static EdgeInsets sectionPadding(BuildContext context) =>
      context.ds.tokens.sectionPadding(context);

  static double gapXs(BuildContext context) =>
      context.ds.tokens.gapXs(context);

  static double gapSm(BuildContext context) =>
      context.ds.tokens.gapSm(context);

  static double gapMd(BuildContext context) =>
      context.ds.tokens.gapMd(context);

  static double gapLg(BuildContext context) =>
      context.ds.tokens.gapLg(context);

  static BorderRadius borderSm(BuildContext context) =>
      context.ds.tokens.borderSm;

  static BorderRadius borderMd(BuildContext context) =>
      context.ds.tokens.borderMd;

  static BorderRadius borderLg(BuildContext context) =>
      context.ds.tokens.borderLg;

  static Color surface(BuildContext context) =>
      context.ds.palette.surface;

  static List<BoxShadow> cardShadow(BuildContext context) =>
      context.ds.tokens.cardShadow(context);

  static List<BoxShadow> elevatedShadow(BuildContext context) =>
      context.ds.tokens.elevatedShadow(context);

  static Widget shimmerBox(
    BuildContext context, {
    double? width,
    double? height,
    BorderRadius? borderRadius,
    BoxShape shape = BoxShape.rectangle,
  }) {
    return context.ds.placeholders.shimmerBox(
      width: width,
      height: height,
      borderRadius: borderRadius,
      shape: shape,
    );
  }

  static Widget textLine(
    BuildContext context, {
    double widthFactor = 0.28,
    double heightFactor = 0.008,
  }) {
    return context.ds.placeholders.textLine(
      context,
      widthFactor: widthFactor,
      heightFactor: heightFactor,
    );
  }

  static Widget sectionHeader(BuildContext context) {
    return context.ds.placeholders.sectionHeader(context);
  }

  static Widget ratingStars(
    BuildContext context, {
    double size = 14,
    int count = 5,
  }) {
    final palette = context.ds.palette;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(count, (index) {
        return Padding(
          padding: EdgeInsets.only(right: index < count - 1 ? 2 : 0),
          child: Icon(
            Icons.star_rounded,
            size: size,
            color: palette.accent.withOpacity(0.55),
          ),
        );
      }),
    );
  }

  static Widget ratingScorePlaceholder(
    BuildContext context, {
    AverageRatingSize size = AverageRatingSize.standard,
  }) {
    final widthFactor = switch (size) {
      AverageRatingSize.compact => 0.10,
      AverageRatingSize.standard => 0.14,
      AverageRatingSize.hero => 0.22,
    };
    final heightFactor = switch (size) {
      AverageRatingSize.compact => 0.012,
      AverageRatingSize.standard => 0.016,
      AverageRatingSize.hero => 0.024,
    };

    return textLine(
      context,
      widthFactor: widthFactor,
      heightFactor: heightFactor,
    );
  }

  static Widget reviewCountPlaceholder(
    BuildContext context, {
    double widthFactor = 0.16,
  }) {
    return textLine(context, widthFactor: widthFactor, heightFactor: 0.007);
  }

  static Widget averageRatingSummary(
    BuildContext context, {
    AverageRatingSize size = AverageRatingSize.standard,
    bool showStars = true,
    bool centered = false,
  }) {
    final starSize = switch (size) {
      AverageRatingSize.compact => 12.0,
      AverageRatingSize.standard => 16.0,
      AverageRatingSize.hero => 22.0,
    };

    final content = Column(
      crossAxisAlignment:
          centered ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ratingScorePlaceholder(context, size: size),
        SizedBox(height: gapSm(context)),
        if (showStars) ratingStars(context, size: starSize),
        SizedBox(height: gapSm(context)),
        reviewCountPlaceholder(
          context,
          widthFactor: size == AverageRatingSize.hero ? 0.20 : 0.14,
        ),
      ],
    );

    return centered ? Center(child: content) : content;
  }

  static Widget reportFlag(BuildContext context) {
    final palette = context.ds.palette;

    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: palette.placeholderLight,
        borderRadius: borderSm(context),
        border: Border.all(color: palette.border),
      ),
      child: Icon(
        Icons.flag_outlined,
        size: AppSizes.w(context, 0.042),
        color: palette.textSecondary.withOpacity(0.45),
      ),
    );
  }

  static Widget avatarPlaceholder(
    BuildContext context, {
    double size = 0.10,
  }) {
    final dimension = AppSizes.w(context, size);

    return shimmerBox(
      context,
      width: dimension,
      height: dimension,
      shape: BoxShape.circle,
    );
  }

  static Widget reviewItem({
    required BuildContext context,
    required bool compact,
    bool showDivider = false,
  }) {
    final palette = context.ds.palette;

    final item = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        avatarPlaceholder(context, size: compact ? 0.09 : 0.11),
        SizedBox(width: gapMd(context)),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: textLine(
                      context,
                      widthFactor: compact ? 0.22 : 0.26,
                      heightFactor: 0.009,
                    ),
                  ),
                  reportFlag(context),
                ],
              ),
              SizedBox(height: gapXs(context)),
              ratingStars(context, size: compact ? 12 : 14),
              SizedBox(height: gapSm(context)),
              textLine(
                context,
                widthFactor: compact ? 0.38 : 0.42,
                heightFactor: 0.007,
              ),
              if (!compact) ...[
                SizedBox(height: gapXs(context)),
                textLine(context, widthFactor: 0.32, heightFactor: 0.007),
              ],
            ],
          ),
        ),
      ],
    );

    if (!showDivider) return item;

    return Column(
      children: [
        item,
        SizedBox(height: gapMd(context)),
        Divider(color: palette.border, height: 1),
      ],
    );
  }

  static Widget reviewCard({
    required BuildContext context,
    double? width,
    bool elevated = false,
  }) {
    final palette = context.ds.palette;

    return Container(
      width: width,
      padding: EdgeInsets.all(AppSizes.w(context, 0.04)),
      decoration: BoxDecoration(
        color: surface(context),
        borderRadius: borderMd(context),
        border: Border.all(color: palette.border),
        boxShadow: elevated ? elevatedShadow(context) : cardShadow(context),
      ),
      child: reviewItem(context: context, compact: false),
    );
  }
}
