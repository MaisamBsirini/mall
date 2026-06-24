import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../../../design_system/scope/design_system_scope.dart';
import '../reviews_section_data.dart';
import '../reviews_tokens.dart';

class FeaturedRatingHeroStyle extends StatelessWidget {
  final ReviewsSectionData? data;

  const FeaturedRatingHeroStyle({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    final palette = context.ds.palette;
    final itemCount = ReviewsTokens.itemCount(data);
    final heroHeight = AppSizes.h(context, 0.22);
    final cardWidth = AppSizes.w(context, 0.78);
    final cardHeight = AppSizes.h(context, 0.18);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: ReviewsTokens.sectionPadding(context),
          child: ClipRRect(
            borderRadius: ReviewsTokens.borderLg(context),
            child: SizedBox(
              height: heroHeight,
              width: double.infinity,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ReviewsTokens.shimmerBox(
                    context,
                    width: double.infinity,
                    height: heroHeight,
                    borderRadius: BorderRadius.zero,
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          palette.primary.withOpacity(0.15),
                          palette.overlayDark.withOpacity(0.75),
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: ReviewsTokens.averageRatingSummary(
                      context,
                      size: AverageRatingSize.hero,
                      centered: true,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: ReviewsTokens.gapLg(context)),
        Padding(
          padding: ReviewsTokens.sectionPadding(context),
          child: ReviewsTokens.textLine(
            context,
            widthFactor: 0.24,
            heightFactor: 0.009,
          ),
        ),
        SizedBox(height: ReviewsTokens.gapMd(context)),
        SizedBox(
          height: cardHeight,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: ReviewsTokens.sectionPadding(context),
            itemCount: itemCount,
            separatorBuilder: (_, __) =>
                SizedBox(width: ReviewsTokens.gapMd(context)),
            itemBuilder: (context, index) {
              return ReviewsTokens.reviewCard(
                context: context,
                width: cardWidth,
                elevated: index == 0,
              );
            },
          ),
        ),
      ],
    );
  }
}
