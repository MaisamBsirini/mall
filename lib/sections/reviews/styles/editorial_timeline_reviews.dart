import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../../../design_system/scope/design_system_scope.dart';
import '../reviews_section_data.dart';
import '../reviews_tokens.dart';

class EditorialTimelineReviewsStyle extends StatelessWidget {
  final ReviewsSectionData? data;

  const EditorialTimelineReviewsStyle({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    final palette = context.ds.palette;
    final itemCount = ReviewsTokens.itemCount(data);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: ReviewsTokens.sectionPadding(context),
          child: ReviewsTokens.textLine(
            context,
            widthFactor: 0.30,
            heightFactor: 0.010,
          ),
        ),
        SizedBox(height: ReviewsTokens.gapMd(context)),
        Padding(
          padding: ReviewsTokens.sectionPadding(context),
          child: Stack(
            children: [
              Positioned(
                left: AppSizes.w(context, 0.045),
                top: 0,
                bottom: 0,
                child: Container(
                  width: 2,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        palette.primary.withOpacity(0.08),
                        palette.primary.withOpacity(0.35),
                        palette.primary.withOpacity(0.08),
                      ],
                    ),
                  ),
                ),
              ),
              Column(
                children: List.generate(itemCount, (index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      bottom: index < itemCount - 1
                          ? ReviewsTokens.gapLg(context)
                          : 0,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 12,
                          height: 12,
                          margin: EdgeInsets.only(
                            top: AppSizes.h(context, 0.012),
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ReviewsTokens.surface(context),
                            border: Border.all(
                              color: palette.primary.withOpacity(0.50),
                              width: 2,
                            ),
                          ),
                        ),
                        SizedBox(width: ReviewsTokens.gapMd(context)),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(AppSizes.w(context, 0.04)),
                            decoration: BoxDecoration(
                              color: ReviewsTokens.surface(context),
                              borderRadius: ReviewsTokens.borderMd(context),
                              border: Border.all(color: palette.border),
                              boxShadow: ReviewsTokens.cardShadow(context),
                            ),
                            child: ReviewsTokens.reviewItem(
                              context: context,
                              compact: false,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
        SizedBox(height: ReviewsTokens.gapLg(context)),
        Padding(
          padding: ReviewsTokens.sectionPadding(context),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: AppSizes.w(context, 0.05),
              vertical: AppSizes.h(context, 0.022),
            ),
            decoration: BoxDecoration(
              color: palette.primarySoft(0.06),
              borderRadius: ReviewsTokens.borderLg(context),
              border: Border.all(color: palette.primarySoft(0.14)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ReviewsTokens.averageRatingSummary(
                  context,
                  size: AverageRatingSize.standard,
                  centered: true,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
