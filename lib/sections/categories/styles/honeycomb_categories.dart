import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../../../design_system/scope/design_system_scope.dart';
import '../categories_tokens.dart';

/// Horizontal scroll chips — icon + label pills for quick scanning.
class HoneycombCategoriesStyle extends StatelessWidget {
  const HoneycombCategoriesStyle({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.ds.palette;
    final chipHeight = AppSizes.h(context, 0.042);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CategoriesTokens.compactHeader(context),
        SizedBox(height: CategoriesTokens.gapSm(context)),
        SizedBox(
          height: chipHeight,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: CategoriesTokens.sectionPadding(context),
            itemCount: CategoriesTokens.categoryCount,
            separatorBuilder: (_, __) =>
                SizedBox(width: CategoriesTokens.gapSm(context)),
            itemBuilder: (context, index) {
              final slot = CategoriesTokens.categories[index];
              final selected = index == 0;

              return Container(
                height: chipHeight,
                padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.w(context, 0.032),
                ),
                decoration: BoxDecoration(
                  color: selected
                      ? slot.accentHint.withValues(alpha: 0.14)
                      : palette.surface,
                  borderRadius: CategoriesTokens.borderMd(context),
                  border: Border.all(
                    color: selected
                        ? slot.accentHint.withValues(alpha: 0.45)
                        : palette.border.withValues(alpha: 0.7),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      slot.iconData,
                      size: chipHeight * 0.42,
                      color: slot.accentHint.withValues(alpha: 0.75),
                    ),
                    SizedBox(width: CategoriesTokens.gapXs(context)),
                    CategoriesTokens.optionalNameLabel(
                      context,
                      slot: slot,
                      widthFactor: 0.12,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        SizedBox(height: CategoriesTokens.gapSm(context)),
        SizedBox(
          height: chipHeight,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: CategoriesTokens.sectionPadding(context),
            itemCount: CategoriesTokens.categoryCount,
            separatorBuilder: (_, __) =>
                SizedBox(width: CategoriesTokens.gapSm(context)),
            itemBuilder: (context, index) {
              final slot = CategoriesTokens.categories[index];

              return Container(
                height: chipHeight,
                padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.w(context, 0.028),
                ),
                decoration: BoxDecoration(
                  color: palette.placeholderLight.withValues(alpha: 0.35),
                  borderRadius: CategoriesTokens.borderSm(context),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      slot.iconData,
                      size: chipHeight * 0.38,
                      color: slot.accentHint.withValues(alpha: 0.55),
                    ),
                    SizedBox(width: CategoriesTokens.gapXs(context)),
                    CategoriesTokens.textLine(
                      context,
                      widthFactor: 0.10,
                      heightFactor: 0.005,
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
