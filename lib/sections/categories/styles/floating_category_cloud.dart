import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../../../design_system/scope/design_system_scope.dart';
import '../categories_tokens.dart';

class FloatingCategoryCloudStyle extends StatelessWidget {
  const FloatingCategoryCloudStyle({super.key});

  static const List<_CloudChip> _chips = [
    _CloudChip(index: 0, sizeFactor: 0.34, offsetX: 0.02, offsetY: 0.0),
    _CloudChip(index: 1, sizeFactor: 0.26, offsetX: 0.52, offsetY: 0.02),
    _CloudChip(index: 2, sizeFactor: 0.22, offsetX: 0.38, offsetY: 0.14),
    _CloudChip(index: 3, sizeFactor: 0.30, offsetX: 0.06, offsetY: 0.16),
    _CloudChip(index: 4, sizeFactor: 0.20, offsetX: 0.68, offsetY: 0.18),
    _CloudChip(index: 5, sizeFactor: 0.24, offsetX: 0.22, offsetY: 0.30),
    _CloudChip(index: 6, sizeFactor: 0.28, offsetX: 0.56, offsetY: 0.32),
    _CloudChip(index: 7, sizeFactor: 0.18, offsetX: 0.02, offsetY: 0.34),
  ];

  @override
  Widget build(BuildContext context) {
    final palette = context.ds.palette;
    final cloudHeight = AppSizes.h(context, 0.38);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CategoriesTokens.sectionHeader(context),
        SizedBox(height: CategoriesTokens.gapMd(context)),
        Padding(
          padding: CategoriesTokens.sectionPadding(context),
          child: Container(
            height: cloudHeight,
            decoration: BoxDecoration(
              borderRadius: CategoriesTokens.borderLg(context),
              gradient: RadialGradient(
                center: Alignment.center,
                radius: 0.85,
                colors: [
                  palette.primarySoft(0.08),
                  CategoriesTokens.surface(context),
                ],
              ),
              border: Border.all(color: palette.border),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: AppSizes.w(context, 0.35),
                  top: AppSizes.h(context, 0.08),
                  child: Container(
                    width: AppSizes.w(context, 0.30),
                    height: AppSizes.w(context, 0.30),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: palette.primarySoft(0.04),
                    ),
                  ),
                ),
                ..._chips.map((chip) {
                  final slot = CategoriesTokens.categories[chip.index];
                  return Positioned(
                    left: AppSizes.w(context, chip.offsetX),
                    top: AppSizes.h(context, chip.offsetY),
                    child: _FloatingChip(
                      slot: slot,
                      sizeFactor: chip.sizeFactor,
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _CloudChip {
  final int index;
  final double sizeFactor;
  final double offsetX;
  final double offsetY;

  const _CloudChip({
    required this.index,
    required this.sizeFactor,
    required this.offsetX,
    required this.offsetY,
  });
}

class _FloatingChip extends StatelessWidget {
  final CategorySlot slot;
  final double sizeFactor;

  const _FloatingChip({
    required this.slot,
    required this.sizeFactor,
  });

  @override
  Widget build(BuildContext context) {
    final palette = context.ds.palette;
    final isLarge = sizeFactor >= 0.28;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.w(context, isLarge ? 0.04 : 0.028),
        vertical: AppSizes.h(context, isLarge ? 0.012 : 0.009),
      ),
      decoration: BoxDecoration(
        color: CategoriesTokens.surface(context),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(
          color: slot.accentHint.withOpacity(isLarge ? 0.35 : 0.20),
        ),
        boxShadow: [
          BoxShadow(
            color: slot.accentHint.withOpacity(isLarge ? 0.15 : 0.08),
            blurRadius: isLarge ? 18 : 10,
            offset: Offset(0, isLarge ? 6 : 4),
          ),
          ...CategoriesTokens.cardShadow(context),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CategoriesTokens.iconPlaceholder(
            context,
            size: AppSizes.w(context, isLarge ? 0.09 : 0.07),
            slot: slot,
            shape: CategoryIconShape.circle,
            filled: isLarge,
          ),
          SizedBox(width: CategoriesTokens.gapSm(context)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              CategoriesTokens.titleLine(
                context,
                widthFactor: isLarge ? 0.16 : 0.12,
              ),
              if (isLarge) ...[
                SizedBox(height: CategoriesTokens.gapXs(context)),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSizes.w(context, 0.015),
                    vertical: AppSizes.h(context, 0.003),
                  ),
                  decoration: BoxDecoration(
                    color: palette.primarySoft(0.06),
                    borderRadius: CategoriesTokens.borderSm(context),
                  ),
                  child: CategoriesTokens.textLine(
                    context,
                    widthFactor: 0.08,
                    heightFactor: 0.005,
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
