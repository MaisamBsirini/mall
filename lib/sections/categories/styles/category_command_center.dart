import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../../../design_system/scope/design_system_scope.dart';
import '../categories_tokens.dart';

/// Hybrid floating icon cards — light tiles with icon + label.
class CategoryCommandCenterStyle extends StatelessWidget {
  const CategoryCommandCenterStyle({super.key});

  static const int _columns = 2;

  @override
  Widget build(BuildContext context) {
    final palette = context.ds.palette;
    final spacing = CategoriesTokens.gapSm(context);
    const visibleCount = 6;
    final rowCount = (visibleCount / _columns).ceil();
    final cardHeight = AppSizes.h(context, 0.078);
    final gridHeight = (cardHeight * rowCount) + (spacing * (rowCount - 1));

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
                crossAxisCount: _columns,
                mainAxisSpacing: spacing,
                crossAxisSpacing: spacing,
                childAspectRatio: 2.35,
              ),
              itemCount: visibleCount,
              itemBuilder: (context, index) {
                final slot = CategoriesTokens.categories[index];

                return Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSizes.w(context, 0.028),
                    vertical: AppSizes.h(context, 0.010),
                  ),
                  decoration: BoxDecoration(
                    color: slot.accentHint.withValues(alpha: 0.07),
                    borderRadius: CategoriesTokens.borderMd(context),
                    border: Border.all(
                      color: slot.accentHint.withValues(alpha: 0.18),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: palette.overlayDark.withValues(alpha: 0.03),
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      CategoriesTokens.iconBadge(
                        context,
                        slot: slot,
                        size: cardHeight * 0.52,
                        filled: true,
                      ),
                      SizedBox(width: CategoriesTokens.gapSm(context)),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CategoriesTokens.optionalNameLabel(
                              context,
                              slot: slot,
                              widthFactor: 0.18,
                            ),
                            SizedBox(height: CategoriesTokens.gapXs(context)),
                            CategoriesTokens.textLine(
                              context,
                              widthFactor: 0.12,
                              heightFactor: 0.004,
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
