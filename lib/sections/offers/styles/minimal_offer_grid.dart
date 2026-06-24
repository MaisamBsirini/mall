import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../../../design_system/scope/design_system_scope.dart';
import '../offers_section_data.dart';
import '../offers_tokens.dart';

/// Style 5 — 2-column grid with icon circle, discount, subtitle.
class MinimalOfferGridStyle extends StatelessWidget {
  final OffersSectionData? data;

  const MinimalOfferGridStyle({super.key, this.data});

  static const int _columns = 2;

  @override
  Widget build(BuildContext context) {
    final palette = context.ds.palette;
    final items = OffersTokens.resolveItems(data);
    final spacing = OffersTokens.gapSm(context);
    const visibleCount = 4;
    final cellWidth = (AppSizes.w(context, 0.92) - spacing) / _columns;
    final cellHeight = AppSizes.h(context, 0.11);
    final rowCount = (visibleCount / _columns).ceil();
    final gridHeight = (cellHeight * rowCount) + (spacing * (rowCount - 1));

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
              itemCount: visibleCount.clamp(0, items.length),
              itemBuilder: (context, index) {
                final item = items[index];
                final iconSize = AppSizes.w(context, 0.09);

                return Container(
                  padding: EdgeInsets.symmetric(
                    vertical: AppSizes.h(context, 0.010),
                  ),
                  decoration: BoxDecoration(
                    color: palette.surface,
                    borderRadius: OffersTokens.borderMd(context),
                    border: Border.all(color: palette.border.withValues(alpha: 0.4)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OffersTokens.gridIconCircle(
                        context,
                        index: index,
                        size: iconSize,
                      ),
                      SizedBox(height: OffersTokens.gapXs(context)),
                      Text(
                        OffersTokens.discountOff(item.discountPercentage),
                        style: OffersTokens.discountStyle(context).copyWith(
                              fontSize: 12,
                            ),
                      ),
                      Text(
                        item.productName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: OffersTokens.subtitleStyle(context),
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
