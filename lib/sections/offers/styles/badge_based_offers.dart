import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../offers_section_data.dart';
import '../offers_tokens.dart';

/// Style 3 — left badge block + line placeholders.
class BadgeBasedOffersStyle extends StatelessWidget {
  final OffersSectionData? data;

  const BadgeBasedOffersStyle({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    const visibleCount = 3;
    final rowHeight = AppSizes.h(context, 0.056);
    final badgeWidth = AppSizes.w(context, 0.13);
    final listHeight =
        (rowHeight * visibleCount) + (OffersTokens.gapSm(context) * (visibleCount - 1));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        OffersTokens.sectionTitle(context),
        SizedBox(height: OffersTokens.gapSm(context)),
        Padding(
          padding: OffersTokens.sectionPadding(context),
          child: SizedBox(
            height: listHeight,
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: visibleCount,
              separatorBuilder: (_, __) =>
                  SizedBox(height: OffersTokens.gapSm(context)),
              itemBuilder: (context, index) {
                return OffersTokens.offerSurface(
                  context,
                  child: SizedBox(
                    height: rowHeight - AppSizes.w(context, 0.028),
                    child: Row(
                      children: [
                        OffersTokens.badgeBlock(
                          context,
                          width: badgeWidth,
                          height: rowHeight - AppSizes.w(context, 0.036),
                        ),
                        SizedBox(width: OffersTokens.gapSm(context)),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              OffersTokens.discountPlaceholder(context),
                              SizedBox(height: OffersTokens.gapXs(context) * 0.5),
                              OffersTokens.subtitlePlaceholder(context),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
