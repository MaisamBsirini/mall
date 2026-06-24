import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../../../design_system/scope/design_system_scope.dart';
import '../offers_section_data.dart';
import '../offers_tokens.dart';

/// Style 4 — image left, stacked text, time-left hint, chevron.
class ImageLeftStripStyle extends StatelessWidget {
  final OffersSectionData? data;

  const ImageLeftStripStyle({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    final palette = context.ds.palette;
    final items = OffersTokens.resolveItems(data);
    const visibleCount = 3;
    final thumbSize = AppSizes.w(context, 0.115);
    final rowHeight = AppSizes.h(context, 0.068);
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
              itemCount: visibleCount.clamp(0, items.length),
              separatorBuilder: (_, __) =>
                  SizedBox(height: OffersTokens.gapSm(context)),
              itemBuilder: (context, index) {
                final item = items[index];

                return SizedBox(
                  height: rowHeight,
                  child: Row(
                    children: [
                      OffersTokens.thumbImage(context, size: thumbSize),
                      SizedBox(width: OffersTokens.gapSm(context)),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              OffersTokens.discountOff(item.discountPercentage),
                              style: OffersTokens.discountStyle(context),
                            ),
                            Text(
                              item.productName,
                              style: OffersTokens.subtitleStyle(context),
                            ),
                            Text(
                              OffersTokens.urgencyFor(index),
                              style: context.ds.typography.caption(context).copyWith(
                                    color: palette.warning.withValues(alpha: 0.8),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      OffersTokens.chevron(context),
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
