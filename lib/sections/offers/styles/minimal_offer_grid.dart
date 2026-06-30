import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../offers_section_data.dart';
import '../offers_tokens.dart';

/// Style 5 — 2-column grid with circle + line placeholders.
class MinimalOfferGridStyle extends StatelessWidget {
  final OffersSectionData? data;

  const MinimalOfferGridStyle({super.key, this.data});

  static const int _columns = 2;

  @override
  Widget build(BuildContext context) {
    final spacing = OffersTokens.gapSm(context);
    const visibleCount = 4;
    final cellWidth = (AppSizes.w(context, 0.92) - spacing) / _columns;
    final cellHeight = AppSizes.h(context, 0.10);
    final rowCount = (visibleCount / _columns).ceil();
    final gridHeight = (cellHeight * rowCount) + (spacing * (rowCount - 1));
    final iconSize = AppSizes.w(context, 0.08);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        OffersTokens.sectionTitle(context),
        SizedBox(height: OffersTokens.gapSm(context)),
        Padding(
          padding: OffersTokens.sectionPadding(context),
          child: SizedBox(
            height: gridHeight,
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: _columns,
                mainAxisSpacing: spacing,
                crossAxisSpacing: spacing,
                childAspectRatio: cellWidth / cellHeight,
              ),
              itemCount: visibleCount,
              itemBuilder: (context, index) {
                return OffersTokens.offerSurface(
                  context,
                  padding: EdgeInsets.symmetric(
                    vertical: AppSizes.h(context, 0.008),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OffersTokens.circleBlock(context, size: iconSize),
                      SizedBox(height: OffersTokens.gapXs(context)),
                      OffersTokens.discountPlaceholder(context),
                      SizedBox(height: OffersTokens.gapXs(context) * 0.5),
                      OffersTokens.subtitlePlaceholder(context),
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
