import 'package:flutter/material.dart';

import '../../../../design_system/scope/design_system_scope.dart';
import '../../widgets/ui_placeholders.dart';

/// Variants 1 — soft pills with shadow and animated selected state.
class AdaptiveChipsVariants extends StatefulWidget {
  const AdaptiveChipsVariants({super.key});

  @override
  State<AdaptiveChipsVariants> createState() => _AdaptiveChipsVariantsState();
}

class _AdaptiveChipsVariantsState extends State<AdaptiveChipsVariants> {
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

          return Wrap(
            spacing: ProductDetailUi.gapSm(ctx),
            runSpacing: ProductDetailUi.gapSm(ctx),
            children: List.generate(count, (i) {
              final selected = _selected[groupIndex] == i;
              final palette = ctx.ds.palette;

              return GestureDetector(
                onTap: () => setState(() => _selected[groupIndex] = i),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 220),
                  curve: Curves.easeOutCubic,
                  padding: EdgeInsets.symmetric(
                    horizontal: ProductDetailUi.gapMd(ctx),
                    vertical: ProductDetailUi.gapSm(ctx) * 0.85,
                  ),
                  decoration: BoxDecoration(
                    color: selected
                        ? palette.primarySoft(0.16)
                        : palette.surface,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: selected
                          ? palette.primary.withValues(alpha: 0.55)
                          : palette.border.withValues(alpha: 0.5),
                    ),
                    boxShadow: selected
                        ? ProductDetailUi.softShadow(ctx, opacity: 0.10, blur: 10)
                        : [
                            BoxShadow(
                              color: palette.overlayDark.withValues(alpha: 0.04),
                              blurRadius: 6,
                              offset: const Offset(0, 2),
                            ),
                          ],
                  ),
                  child: ProductDetailUi.optionSkeleton(
                    ctx,
                    widthFactor: selected ? 0.16 : 0.12,
                  ),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
