import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../../../design_system/scope/design_system_scope.dart';
import '../offers_section_data.dart';
import '../offers_tokens.dart';

/// Style 2 — minimal list with % circle, title/subtitle, chevron.
class DenseOfferListStyle extends StatelessWidget {
  final OffersSectionData? data;

  const DenseOfferListStyle({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    final palette = context.ds.palette;
    final items = OffersTokens.resolveItems(data);
    const visibleCount = 3;
    final iconSize = AppSizes.w(context, 0.10);
    final rowHeight = AppSizes.h(context, 0.058);
    final listHeight = rowHeight * visibleCount.clamp(1, items.length);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        OffersTokens.sectionTitle(context),
        SizedBox(height: OffersTokens.gapSm(context)),
        Padding(
          padding: OffersTokens.sectionPadding(context),
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: palette.border.withValues(alpha: 0.45)),
                bottom: BorderSide(color: palette.border.withValues(alpha: 0.45)),
              ),
            ),
            child: SizedBox(
              height: listHeight,
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: visibleCount.clamp(0, items.length),
                separatorBuilder: (_, __) => Divider(
                  height: 1,
                  color: palette.border.withValues(alpha: 0.35),
                ),
                itemBuilder: (context, index) {
                  final item = items[index];

                  return SizedBox(
                    height: rowHeight,
                    child: Row(
                      children: [
                        OffersTokens.percentCircle(
                          context,
                          index: index,
                          size: iconSize,
                        ),
                        SizedBox(width: OffersTokens.gapSm(context)),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                OffersTokens.discountOff(item.discountPercentage),
                                style: OffersTokens.discountStyle(context),
                              ),
                              Text(
                                '${item.productName} · ${OffersTokens.urgencyFor(index)}',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: OffersTokens.subtitleStyle(context),
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
        ),
      ],
    );
  }
}
