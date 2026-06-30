import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../../../design_system/scope/design_system_scope.dart';
import '../offers_section_data.dart';
import '../offers_tokens.dart';

/// Style 2 — compact list rows with circle + line placeholders.
class DenseOfferListStyle extends StatelessWidget {
  final OffersSectionData? data;

  const DenseOfferListStyle({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    final palette = context.ds.palette;
    const visibleCount = 3;
    final iconSize = AppSizes.w(context, 0.09);
    final rowHeight = AppSizes.h(context, 0.052);
    final listHeight = rowHeight * visibleCount;

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
                itemCount: visibleCount,
                separatorBuilder: (_, __) => Divider(
                  height: 1,
                  color: palette.border.withValues(alpha: 0.35),
                ),
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: rowHeight,
                    child: Row(
                      children: [
                        OffersTokens.circleBlock(context, size: iconSize),
                        SizedBox(width: OffersTokens.gapSm(context)),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              OffersTokens.discountPlaceholder(context),
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
        ),
      ],
    );
  }
}
