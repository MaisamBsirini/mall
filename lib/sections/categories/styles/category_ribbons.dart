import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../../../design_system/scope/design_system_scope.dart';
import '../categories_tokens.dart';

/// Segmented card rows — grouped blocks with clear section dividers.
class CategoryRibbonsStyle extends StatelessWidget {
  const CategoryRibbonsStyle({super.key});

  static const _segments = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7],
  ];

  @override
  Widget build(BuildContext context) {
    final palette = context.ds.palette;
    final cellHeight = AppSizes.h(context, 0.065);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CategoriesTokens.compactHeader(context),
        SizedBox(height: CategoriesTokens.gapSm(context)),
        Padding(
          padding: CategoriesTokens.sectionPadding(context),
          child: Column(
            children: [
              for (var s = 0; s < _segments.length; s++) ...[
                if (s > 0) ...[
                  SizedBox(height: CategoriesTokens.gapSm(context)),
                  Divider(
                    height: 1,
                    color: palette.border.withValues(alpha: 0.5),
                  ),
                  SizedBox(height: CategoriesTokens.gapSm(context)),
                ],
                Row(
                  children: [
                    for (var i = 0; i < _segments[s].length; i++) ...[
                      if (i > 0)
                        SizedBox(width: CategoriesTokens.gapSm(context)),
                      Expanded(
                        child: _SegmentCell(
                          slot: CategoriesTokens.categories[_segments[s][i]],
                          height: cellHeight,
                        ),
                      ),
                    ],
                    if (_segments[s].length < 3)
                      for (var p = 0; p < 3 - _segments[s].length; p++)
                        Expanded(child: SizedBox()),
                  ],
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class _SegmentCell extends StatelessWidget {
  final CategorySlot slot;
  final double height;

  const _SegmentCell({required this.slot, required this.height});

  @override
  Widget build(BuildContext context) {
    final palette = context.ds.palette;

    return Container(
      height: height,
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.w(context, 0.022),
      ),
      decoration: BoxDecoration(
        color: palette.surface,
        borderRadius: CategoriesTokens.borderSm(context),
        border: Border.all(color: palette.border.withValues(alpha: 0.65)),
      ),
      child: Row(
        children: [
          CategoriesTokens.iconBadge(
            context,
            slot: slot,
            size: height * 0.62,
          ),
          SizedBox(width: CategoriesTokens.gapXs(context)),
          Expanded(
            child: CategoriesTokens.optionalNameLabel(
              context,
              slot: slot,
              widthFactor: 0.14,
            ),
          ),
        ],
      ),
    );
  }
}
