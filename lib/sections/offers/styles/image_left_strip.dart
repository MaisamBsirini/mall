import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../offers_section_data.dart';
import '../offers_tokens.dart';

/// Style 4 — image left + stacked line placeholders.
class ImageLeftStripStyle extends StatelessWidget {
  final OffersSectionData? data;

  const ImageLeftStripStyle({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    const visibleCount = 3;
    final thumbSize = AppSizes.w(context, 0.10);
    final rowHeight = AppSizes.h(context, 0.06);
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
                return SizedBox(
                  height: rowHeight,
                  child: Row(
                    children: [
                      OffersTokens.thumbBlock(context, size: thumbSize),
                      SizedBox(width: OffersTokens.gapSm(context)),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            OffersTokens.discountPlaceholder(context),
                            SizedBox(height: OffersTokens.gapXs(context) * 0.5),
                            OffersTokens.subtitlePlaceholder(context),
                            SizedBox(height: OffersTokens.gapXs(context) * 0.5),
                            OffersTokens.subtitlePlaceholder(context),
                          ],
                        ),
                      ),
                      OffersTokens.chevronPlaceholder(context),
                    ],
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
