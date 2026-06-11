import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../../../design_system/scope/design_system_scope.dart';
import '../categories_tokens.dart';

class CategoryRibbonsStyle extends StatelessWidget {
  const CategoryRibbonsStyle({super.key});

  static const List<double> _offsets = [0.0, 0.06, 0.12, 0.04, 0.10];

  @override
  Widget build(BuildContext context) {
    final palette = context.ds.palette;
    const ribbonCount = 5;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: CategoriesTokens.sectionPadding(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CategoriesTokens.titleLine(context, widthFactor: 0.30),
              SizedBox(height: CategoriesTokens.gapXs(context)),
              CategoriesTokens.textLine(
                context,
                widthFactor: 0.20,
                heightFactor: 0.006,
              ),
            ],
          ),
        ),
        SizedBox(height: CategoriesTokens.gapMd(context)),
        Padding(
          padding: CategoriesTokens.sectionPadding(context),
          child: Column(
            children: List.generate(ribbonCount, (index) {
              final slot = CategoriesTokens.categories[index];
              final isTop = index == 0;

              return Padding(
                padding: EdgeInsets.only(
                  left: AppSizes.w(context, _offsets[index]),
                  bottom: index < ribbonCount - 1
                      ? CategoriesTokens.gapSm(context)
                      : 0,
                ),
                child: _CategoryRibbon(
                  slot: slot,
                  index: index,
                  featured: isTop,
                ),
              );
            }),
          ),
        ),
        SizedBox(height: CategoriesTokens.gapSm(context)),
        Padding(
          padding: CategoriesTokens.sectionPadding(context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.w(context, 0.04),
                  vertical: AppSizes.h(context, 0.008),
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: palette.border),
                  borderRadius: CategoriesTokens.borderSm(context),
                ),
                child: CategoriesTokens.textLine(
                  context,
                  widthFactor: 0.14,
                  heightFactor: 0.006,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _CategoryRibbon extends StatelessWidget {
  final CategorySlot slot;
  final int index;
  final bool featured;

  const _CategoryRibbon({
    required this.slot,
    required this.index,
    this.featured = false,
  });

  @override
  Widget build(BuildContext context) {
    final palette = context.ds.palette;
    final height = featured
        ? AppSizes.h(context, 0.075)
        : AppSizes.h(context, 0.062);

    return Stack(
      clipBehavior: Clip.none,
      children: [
        if (!featured)
          Positioned(
            left: 4,
            top: 4,
            right: -4,
            child: Container(
              height: height,
              decoration: BoxDecoration(
                color: palette.placeholderLight,
                borderRadius: CategoriesTokens.borderMd(context),
              ),
            ),
          ),
        Container(
          height: height,
          decoration: BoxDecoration(
            color: CategoriesTokens.surface(context),
            borderRadius: CategoriesTokens.borderMd(context),
            border: Border.all(
              color: featured
                  ? slot.accentHint.withOpacity(0.35)
                  : palette.border,
              width: featured ? 1.5 : 1,
            ),
            boxShadow: featured
                ? CategoriesTokens.elevatedShadow(context)
                : CategoriesTokens.cardShadow(context),
          ),
          child: Row(
            children: [
              Container(
                width: 4,
                decoration: BoxDecoration(
                  color: slot.accentHint.withOpacity(featured ? 0.70 : 0.40),
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(context.ds.tokens.radiusMd),
                  ),
                ),
              ),
              SizedBox(width: CategoriesTokens.gapMd(context)),
              CategoriesTokens.iconPlaceholder(
                context,
                size: AppSizes.w(context, featured ? 0.10 : 0.085),
                slot: slot,
                shape: CategoryIconShape.rounded,
                filled: featured,
              ),
              SizedBox(width: CategoriesTokens.gapMd(context)),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CategoriesTokens.titleLine(
                      context,
                      widthFactor: featured ? 0.26 : 0.20,
                    ),
                    SizedBox(height: CategoriesTokens.gapXs(context)),
                    CategoriesTokens.textLine(
                      context,
                      widthFactor: featured ? 0.16 : 0.12,
                      heightFactor: 0.005,
                    ),
                  ],
                ),
              ),
              CategoriesTokens.itemCountBadge(
                context,
                widthFactor: 0.10,
                compact: !featured,
              ),
              SizedBox(width: CategoriesTokens.gapMd(context)),
              Icon(
                Icons.chevron_right_rounded,
                size: AppSizes.w(context, 0.05),
                color: palette.textSecondary.withOpacity(0.45),
              ),
              SizedBox(width: CategoriesTokens.gapSm(context)),
            ],
          ),
        ),
      ],
    );
  }
}
