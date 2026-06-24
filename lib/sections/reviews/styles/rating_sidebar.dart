import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../../../design_system/scope/design_system_scope.dart';
import '../reviews_section_data.dart';
import '../reviews_tokens.dart';

class RatingSidebarStyle extends StatelessWidget {
  final ReviewsSectionData? data;

  const RatingSidebarStyle({super.key, this.data});

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
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  width: AppSizes.w(context, 0.30),
                  padding: EdgeInsets.all(AppSizes.w(context, 0.035)),
                  decoration: BoxDecoration(
                    color: palette.primarySoft(0.08),
                    borderRadius: ReviewsTokens.borderMd(context),
                    border: Border.all(color: palette.primarySoft(0.16)),
                    boxShadow: ReviewsTokens.cardShadow(context),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ReviewsTokens.averageRatingSummary(
                        context,
                        size: AverageRatingSize.standard,
                        centered: true,
                      ),
                      SizedBox(height: ReviewsTokens.gapMd(context)),
                      ...List.generate(3, (index) {
                        return Padding(
                          padding: EdgeInsets.only(
                            bottom: index < 2
                                ? ReviewsTokens.gapXs(context)
                                : 0,
                          ),
                          child: Row(
                            children: [
                              ReviewsTokens.ratingStars(
                                context,
                                size: 10,
                                count: 5 - index,
                              ),
                              const Spacer(),
                              ReviewsTokens.textLine(
                                context,
                                widthFactor: 0.06,
                                heightFactor: 0.005,
                              ),
                            ],
                          ),
                        );
                      }),
                    ],
                  ),
                ),
                SizedBox(width: ReviewsTokens.gapMd(context)),
                Expanded(
                  child: Column(
                    children: List.generate(itemCount, (index) {
                      return Padding(
                        padding: EdgeInsets.only(
                          bottom: index < itemCount - 1
                              ? ReviewsTokens.gapSm(context)
                              : 0,
                        ),
                        child: Container(
                          padding: EdgeInsets.all(AppSizes.w(context, 0.035)),
                          decoration: BoxDecoration(
                            color: ReviewsTokens.surface(context),
                            borderRadius: ReviewsTokens.borderSm(context),
                            border: Border.all(color: palette.border),
                          ),
                          child: ReviewsTokens.reviewItem(
                            context: context,
                            compact: true,
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
