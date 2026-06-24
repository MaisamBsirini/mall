import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../../../design_system/scope/design_system_scope.dart';
import '../reviews_section_data.dart';
import '../reviews_tokens.dart';

class FloatingRatingHeaderStyle extends StatelessWidget {
  final ReviewsSectionData? data;

  const FloatingRatingHeaderStyle({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    final palette = context.ds.palette;
    final itemCount = ReviewsTokens.itemCount(data);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: ReviewsTokens.sectionPadding(context),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppSizes.w(context, 0.04),
              vertical: AppSizes.h(context, 0.016),
            ),
            decoration: BoxDecoration(
              color: ReviewsTokens.surface(context),
              borderRadius: ReviewsTokens.borderLg(context),
              border: Border.all(color: palette.border),
              boxShadow: ReviewsTokens.cardShadow(context),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReviewsTokens.textLine(
                        context,
                        widthFactor: 0.28,
                        heightFactor: 0.010,
                      ),
                      SizedBox(height: ReviewsTokens.gapXs(context)),
                      ReviewsTokens.textLine(
                        context,
                        widthFactor: 0.18,
                        heightFactor: 0.006,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 1,
                  height: AppSizes.h(context, 0.05),
                  color: palette.border,
                ),
                SizedBox(width: ReviewsTokens.gapMd(context)),
                ReviewsTokens.averageRatingSummary(
                  context,
                  size: AverageRatingSize.compact,
                  centered: true,
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: ReviewsTokens.gapLg(context)),
        Padding(
          padding: ReviewsTokens.sectionPadding(context),
          child: Container(
            decoration: BoxDecoration(
              color: ReviewsTokens.surface(context),
              borderRadius: ReviewsTokens.borderMd(context),
              border: Border.all(color: palette.border),
            ),
            child: Column(
              children: List.generate(itemCount, (index) {
                return Padding(
                  padding: EdgeInsets.all(AppSizes.w(context, 0.04)),
                  child: ReviewsTokens.reviewItem(
                    context: context,
                    compact: true,
                    showDivider: index < itemCount - 1,
                  ),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}
