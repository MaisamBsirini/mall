import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../offers_section_data.dart';
import '../offers_tokens.dart';

/// Style 1 — horizontal cards with image + line placeholders.
class CompactHorizontalOfferStyle extends StatelessWidget {
  final OffersSectionData? data;

  const CompactHorizontalOfferStyle({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    final cardWidth = AppSizes.w(context, 0.30);
    final surfacePad = OffersTokens.gapSm(context);
    final imageSize = cardWidth - surfacePad * 2;
    final cardHeight =
        OffersTokens.compactCardHeight(context, imageSize: imageSize);
    final linePrimary = AppSizes.h(context, 0.008);
    final lineSecondary = AppSizes.h(context, 0.006);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        OffersTokens.sectionTitle(context),
        SizedBox(height: OffersTokens.gapSm(context)),
        SizedBox(
          height: cardHeight,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: OffersTokens.sectionPadding(context),
            itemCount: OffersTokens.showcaseCount,
            separatorBuilder: (_, __) =>
                SizedBox(width: OffersTokens.gapSm(context)),
            itemBuilder: (context, index) {
              return SizedBox(
                width: cardWidth,
                height: cardHeight,
                child: OffersTokens.offerSurface(
                  context,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      OffersTokens.thumbBlock(context, size: imageSize),
                      SizedBox(height: OffersTokens.gapXs(context)),
                      SizedBox(
                        height: linePrimary,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: OffersTokens.discountPlaceholder(context),
                        ),
                      ),
                      SizedBox(height: OffersTokens.gapXs(context) * 0.5),
                      SizedBox(
                        height: lineSecondary,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: OffersTokens.subtitlePlaceholder(context),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
