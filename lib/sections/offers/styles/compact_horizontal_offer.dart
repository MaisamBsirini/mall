import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../../../design_system/scope/design_system_scope.dart';
import '../offers_section_data.dart';
import '../offers_tokens.dart';

/// Style 1 — image on top, discount + subtitle below, horizontal scroll.
class CompactHorizontalOfferStyle extends StatelessWidget {
  final OffersSectionData? data;

  const CompactHorizontalOfferStyle({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    final palette = context.ds.palette;
    final items = OffersTokens.resolveItems(data);
    final cardWidth = AppSizes.w(context, 0.30);
    final imageSize = cardWidth - AppSizes.w(context, 0.024);
    final cardHeight = imageSize + AppSizes.h(context, 0.048);

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
            itemCount: items.length,
            separatorBuilder: (_, __) =>
                SizedBox(width: OffersTokens.gapSm(context)),
            itemBuilder: (context, index) {
              final item = items[index];

              return Container(
                width: cardWidth,
                padding: EdgeInsets.all(AppSizes.w(context, 0.012)),
                decoration: BoxDecoration(
                  color: palette.surface,
                  borderRadius: OffersTokens.borderMd(context),
                  border: Border.all(color: palette.border.withValues(alpha: 0.45)),
                ),
                child: Column(
                  children: [
                    OffersTokens.thumbImage(context, size: imageSize),
                    SizedBox(height: OffersTokens.gapXs(context)),
                    Text(
                      OffersTokens.discountOff(item.discountPercentage),
                      style: OffersTokens.discountStyle(context),
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
      ],
    );
  }
}
