import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../../../design_system/scope/design_system_scope.dart';
import '../offers_section_data.dart';
import '../offers_tokens.dart';

/// Style 3 — colored left badge + title + urgency status.
class BadgeBasedOffersStyle extends StatelessWidget {
  final OffersSectionData? data;

  const BadgeBasedOffersStyle({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    final palette = context.ds.palette;
    final items = OffersTokens.resolveItems(data);
    const visibleCount = 3;
    final rowHeight = AppSizes.h(context, 0.062);
    final badgeWidth = AppSizes.w(context, 0.14);
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
                final badgeColor = OffersTokens.badgeColorFor(index);

                return Container(
                  height: rowHeight,
                  padding: EdgeInsets.all(AppSizes.w(context, 0.018)),
                  decoration: BoxDecoration(
                    color: palette.surface,
                    borderRadius: OffersTokens.borderMd(context),
                    border: Border.all(color: palette.border.withValues(alpha: 0.4)),
                  ),
                  child: Row(
                    children: [
                      OffersTokens.leftBadge(
                        context,
                        percentage: item.discountPercentage,
                        color: badgeColor,
                        width: badgeWidth,
                        height: rowHeight - AppSizes.w(context, 0.036),
                      ),
                      SizedBox(width: OffersTokens.gapSm(context)),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              item.productName,
                              style: OffersTokens.discountStyle(context).copyWith(
                                    fontSize: 12,
                                  ),
                            ),
                            Text(
                              OffersTokens.urgencyFor(index),
                              style: context.ds.typography.caption(context).copyWith(
                                    color: palette.warning.withValues(alpha: 0.85),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ],
                        ),
                      ),
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
