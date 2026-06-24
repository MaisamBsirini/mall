import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../categories_tokens.dart';

/// Compact 4-column icon grid — structured and scannable.
class IconHubStyle extends StatelessWidget {
  const IconHubStyle({super.key});

  @override
  Widget build(BuildContext context) {
    final iconSize = AppSizes.w(context, 0.11);
    final spacing = CategoriesTokens.gapSm(context);
    final rowCount = (CategoriesTokens.categoryCount / CategoriesTokens.gridColumns).ceil();
    final rowHeight = iconSize + AppSizes.h(context, 0.028);
    final gridHeight = (rowHeight * rowCount) + (spacing * (rowCount - 1));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CategoriesTokens.compactHeader(context),
        SizedBox(height: CategoriesTokens.gapSm(context)),
        Padding(
          padding: CategoriesTokens.sectionPadding(context),
          child: SizedBox(
            height: gridHeight,
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: CategoriesTokens.gridColumns,
                mainAxisSpacing: spacing,
                crossAxisSpacing: spacing,
                childAspectRatio: 0.82,
              ),
              itemCount: CategoriesTokens.categoryCount,
              itemBuilder: (context, index) {
                final slot = CategoriesTokens.categories[index];

                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CategoriesTokens.iconBadge(
                      context,
                      slot: slot,
                      size: iconSize,
                      filled: index == 0,
                    ),
                    SizedBox(height: CategoriesTokens.gapXs(context)),
                    CategoriesTokens.optionalNameLabel(
                      context,
                      slot: slot,
                      widthFactor: 0.12,
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
