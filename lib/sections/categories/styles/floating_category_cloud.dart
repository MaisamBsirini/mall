import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../../../design_system/scope/design_system_scope.dart';
import '../categories_tokens.dart';

/// Minimal list — strong typography hierarchy, chevron affordance.
class FloatingCategoryCloudStyle extends StatelessWidget {
  const FloatingCategoryCloudStyle({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.ds.palette;
    const visibleCount = 5;
    final rowHeight = AppSizes.h(context, 0.052);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CategoriesTokens.compactHeader(context),
        SizedBox(height: CategoriesTokens.gapSm(context)),
        Padding(
          padding: CategoriesTokens.sectionPadding(context),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: palette.surface,
              borderRadius: CategoriesTokens.borderMd(context),
              border: Border.all(color: palette.border.withValues(alpha: 0.6)),
            ),
            child: Column(
              children: [
                for (var i = 0; i < visibleCount; i++) ...[
                  if (i > 0)
                    Divider(
                      height: 1,
                      indent: AppSizes.w(context, 0.14),
                      color: palette.border.withValues(alpha: 0.45),
                    ),
                  SizedBox(
                    height: rowHeight,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppSizes.w(context, 0.032),
                      ),
                      child: Row(
                        children: [
                          CategoriesTokens.iconBadge(
                            context,
                            slot: CategoriesTokens.categories[i],
                            size: rowHeight * 0.58,
                          ),
                          SizedBox(width: CategoriesTokens.gapSm(context)),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CategoriesTokens.optionalNameLabel(
                                  context,
                                  slot: CategoriesTokens.categories[i],
                                  widthFactor: 0.22,
                                ),
                                SizedBox(height: 2),
                                CategoriesTokens.textLine(
                                  context,
                                  widthFactor: 0.14,
                                  heightFactor: 0.004,
                                ),
                              ],
                            ),
                          ),
                          CategoriesTokens.chevron(context),
                        ],
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}
