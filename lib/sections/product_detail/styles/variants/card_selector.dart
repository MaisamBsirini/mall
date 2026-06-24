import 'package:flutter/material.dart';

import '../../../../design_system/scope/design_system_scope.dart';
import '../../widgets/ui_placeholders.dart';

/// Variants 2 — mini elevated cards with selected elevation.
class CardSelectorVariants extends StatefulWidget {
  const CardSelectorVariants({super.key});

  @override
  State<CardSelectorVariants> createState() => _CardSelectorVariantsState();
}

class _CardSelectorVariantsState extends State<CardSelectorVariants> {
  final Map<int, int> _selected = {};

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ProductDetailUi.pagePadding(context),
      child: ProductDetailUi.attributeGroups(
        context,
        buildGroup: (ctx, groupIndex, count) {
          if (count <= 0) return ProductDetailUi.emptyVariantArea(ctx);

          _selected.putIfAbsent(groupIndex, () => 0);

          return SizedBox(
            height: 56,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: count,
              separatorBuilder: (_, __) =>
                  SizedBox(width: ProductDetailUi.gapSm(ctx)),
              itemBuilder: (_, i) {
                final selected = _selected[groupIndex] == i;
                final palette = ctx.ds.palette;

                return GestureDetector(
                  onTap: () => setState(() => _selected[groupIndex] = i),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 240),
                    curve: Curves.easeOutCubic,
                    width: 72,
                    decoration: BoxDecoration(
                      color: palette.surface,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: selected
                            ? palette.primary
                            : palette.border.withValues(alpha: 0.45),
                        width: selected ? 1.5 : 1,
                      ),
                      boxShadow: selected
                          ? ProductDetailUi.softShadow(ctx, opacity: 0.14, blur: 12)
                          : [
                              BoxShadow(
                                color: palette.overlayDark.withValues(alpha: 0.05),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ProductDetailUi.optionSkeleton(ctx, widthFactor: 0.14),
                        if (selected) ...[
                          SizedBox(height: ProductDetailUi.gapXs(ctx) * 0.5),
                          Container(
                            width: 16,
                            height: 3,
                            decoration: BoxDecoration(
                              color: palette.primary,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
