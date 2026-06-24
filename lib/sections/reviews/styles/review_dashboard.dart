import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../../../design_system/scope/design_system_scope.dart';
import '../reviews_section_data.dart';
import '../reviews_tokens.dart';

class ReviewDashboardStyle extends StatelessWidget {
  final ReviewsSectionData? data;

  const ReviewDashboardStyle({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    final palette = context.ds.palette;
    final itemCount = ReviewsTokens.itemCount(data);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ReviewsTokens.sectionHeader(context),
        SizedBox(height: ReviewsTokens.gapMd(context)),
        Padding(
          padding: ReviewsTokens.sectionPadding(context),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(AppSizes.w(context, 0.05)),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  palette.primarySoft(0.12),
                  ReviewsTokens.surface(context),
                ],
              ),
              borderRadius: ReviewsTokens.borderLg(context),
              border: Border.all(color: palette.primarySoft(0.18)),
              boxShadow: ReviewsTokens.elevatedShadow(context),
            ),
            child: Row(
              children: [
                Expanded(
                  child: ReviewsTokens.averageRatingSummary(
                    context,
                    size: AverageRatingSize.hero,
                  ),
                ),
                SizedBox(width: ReviewsTokens.gapMd(context)),
                Expanded(
                  child: Column(
                    children: List.generate(3, (index) {
                      return Padding(
                        padding: EdgeInsets.only(
                          bottom: index < 2 ? ReviewsTokens.gapSm(context) : 0,
                        ),
                        child: Row(
                          children: [
                            ReviewsTokens.textLine(
                              context,
                              widthFactor: 0.06,
                              heightFactor: 0.006,
                            ),
                            SizedBox(width: ReviewsTokens.gapSm(context)),
                            Expanded(
                              child: ReviewsTokens.shimmerBox(
                                context,
                                height: AppSizes.h(context, 0.006),
                                borderRadius: ReviewsTokens.borderSm(context),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: ReviewsTokens.gapLg(context)),
        Padding(
          padding: ReviewsTokens.sectionPadding(context),
          child: Column(
            children: List.generate(itemCount, (index) {
              return Padding(
                padding: EdgeInsets.only(
                  bottom: index < itemCount - 1
                      ? ReviewsTokens.gapMd(context)
                      : 0,
                ),
                child: ReviewsTokens.reviewCard(context: context),
              );
            }),
          ),
        ),
      ],
    );
  }
}
