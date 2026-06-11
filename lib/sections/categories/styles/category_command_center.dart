import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../../../design_system/scope/design_system_scope.dart';
import '../categories_tokens.dart';

class CategoryCommandCenterStyle extends StatelessWidget {
  const CategoryCommandCenterStyle({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.ds.palette;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: CategoriesTokens.sectionPadding(context),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CategoriesTokens.titleLine(context, widthFactor: 0.28),
                    SizedBox(height: CategoriesTokens.gapXs(context)),
                    CategoriesTokens.textLine(
                      context,
                      widthFactor: 0.18,
                      heightFactor: 0.006,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(AppSizes.w(context, 0.025)),
                decoration: BoxDecoration(
                  color: palette.primarySoft(0.08),
                  borderRadius: CategoriesTokens.borderSm(context),
                  border: Border.all(color: palette.border),
                ),
                child: Icon(
                  Icons.tune_rounded,
                  size: AppSizes.w(context, 0.05),
                  color: palette.primary.withOpacity(0.60),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: CategoriesTokens.gapMd(context)),
        Padding(
          padding: CategoriesTokens.sectionPadding(context),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: _PrimaryPanel(
                      slot: CategoriesTokens.categories[0],
                      height: AppSizes.h(context, 0.14),
                    ),
                  ),
                  SizedBox(width: CategoriesTokens.gapSm(context)),
                  Expanded(
                    flex: 2,
                    child: _PrimaryPanel(
                      slot: CategoriesTokens.categories[1],
                      height: AppSizes.h(context, 0.14),
                      compact: true,
                    ),
                  ),
                ],
              ),
              SizedBox(height: CategoriesTokens.gapSm(context)),
              Row(
                children: [
                  Expanded(
                    child: _SecondaryBlock(
                      slot: CategoriesTokens.categories[2],
                    ),
                  ),
                  SizedBox(width: CategoriesTokens.gapSm(context)),
                  Expanded(
                    child: _SecondaryBlock(
                      slot: CategoriesTokens.categories[3],
                    ),
                  ),
                  SizedBox(width: CategoriesTokens.gapSm(context)),
                  Expanded(
                    child: _SecondaryBlock(
                      slot: CategoriesTokens.categories[4],
                    ),
                  ),
                ],
              ),
              SizedBox(height: CategoriesTokens.gapSm(context)),
              Container(
                padding: EdgeInsets.all(AppSizes.w(context, 0.035)),
                decoration: BoxDecoration(
                  color: palette.placeholderLight,
                  borderRadius: CategoriesTokens.borderMd(context),
                  border: Border.all(color: palette.border),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.search_rounded,
                      size: AppSizes.w(context, 0.05),
                      color: palette.textSecondary.withOpacity(0.40),
                    ),
                    SizedBox(width: CategoriesTokens.gapSm(context)),
                    Expanded(
                      child: CategoriesTokens.textLine(
                        context,
                        widthFactor: 0.30,
                        heightFactor: 0.007,
                      ),
                    ),
                    CategoriesTokens.itemCountBadge(context, widthFactor: 0.08),
                  ],
                ),
              ),
              SizedBox(height: CategoriesTokens.gapSm(context)),
              Row(
                children: List.generate(3, (index) {
                  final slot = CategoriesTokens.categories[index + 5];
                  return Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: index < 2 ? CategoriesTokens.gapSm(context) : 0,
                      ),
                      child: _TertiaryTile(slot: slot),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _PrimaryPanel extends StatelessWidget {
  final CategorySlot slot;
  final double height;
  final bool compact;

  const _PrimaryPanel({
    required this.slot,
    required this.height,
    this.compact = false,
  });

  @override
  Widget build(BuildContext context) {
    final palette = context.ds.palette;

    return Container(
      height: height,
      padding: EdgeInsets.all(AppSizes.w(context, 0.035)),
      decoration: BoxDecoration(
        color: CategoriesTokens.surface(context),
        borderRadius: CategoriesTokens.borderMd(context),
        border: Border.all(color: slot.accentHint.withOpacity(0.25)),
        boxShadow: CategoriesTokens.elevatedShadow(context),
      ),
      child: Row(
        children: [
          CategoriesTokens.iconPlaceholder(
            context,
            size: AppSizes.w(context, compact ? 0.10 : 0.12),
            slot: slot,
            shape: CategoryIconShape.rounded,
            filled: true,
          ),
          SizedBox(width: CategoriesTokens.gapMd(context)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CategoriesTokens.titleLine(
                  context,
                  widthFactor: compact ? 0.18 : 0.22,
                ),
                SizedBox(height: CategoriesTokens.gapXs(context)),
                Row(
                  children: [
                    CategoriesTokens.itemCountBadge(
                      context,
                      widthFactor: 0.08,
                      compact: true,
                    ),
                    if (!compact) ...[
                      SizedBox(width: CategoriesTokens.gapSm(context)),
                      Container(
                        width: 4,
                        height: 4,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: palette.textSecondary.withOpacity(0.30),
                        ),
                      ),
                      SizedBox(width: CategoriesTokens.gapSm(context)),
                      CategoriesTokens.textLine(
                        context,
                        widthFactor: 0.10,
                        heightFactor: 0.005,
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
          if (!compact)
            Icon(
              Icons.arrow_forward_rounded,
              size: AppSizes.w(context, 0.045),
              color: slot.accentHint.withOpacity(0.50),
            ),
        ],
      ),
    );
  }
}

class _SecondaryBlock extends StatelessWidget {
  final CategorySlot slot;

  const _SecondaryBlock({required this.slot});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.w(context, 0.025),
        vertical: AppSizes.h(context, 0.014),
      ),
      decoration: BoxDecoration(
        color: CategoriesTokens.surface(context),
        borderRadius: CategoriesTokens.borderSm(context),
        border: Border.all(color: slot.accentHint.withOpacity(0.15)),
        boxShadow: CategoriesTokens.cardShadow(context),
      ),
      child: Column(
        children: [
          CategoriesTokens.iconPlaceholder(
            context,
            size: AppSizes.w(context, 0.09),
            slot: slot,
            shape: CategoryIconShape.square,
          ),
          SizedBox(height: CategoriesTokens.gapXs(context)),
          CategoriesTokens.titleLine(context, widthFactor: 0.12),
        ],
      ),
    );
  }
}

class _TertiaryTile extends StatelessWidget {
  final CategorySlot slot;

  const _TertiaryTile({required this.slot});

  @override
  Widget build(BuildContext context) {
    final palette = context.ds.palette;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.w(context, 0.025),
        vertical: AppSizes.h(context, 0.010),
      ),
      decoration: BoxDecoration(
        borderRadius: CategoriesTokens.borderSm(context),
        border: Border.all(color: palette.border),
      ),
      child: Row(
        children: [
          CategoriesTokens.iconPlaceholder(
            context,
            size: AppSizes.w(context, 0.07),
            slot: slot,
            shape: CategoryIconShape.diamond,
          ),
          SizedBox(width: CategoriesTokens.gapXs(context)),
          Expanded(
            child: CategoriesTokens.titleLine(context, widthFactor: 0.10),
          ),
        ],
      ),
    );
  }
}
