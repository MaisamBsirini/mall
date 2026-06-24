import 'package:flutter/material.dart';

import '../../../../design_system/scope/design_system_scope.dart';
import '../../widgets/ui_placeholders.dart';

/// Variants 4 — horizontal scroll selector with active indicator bar.
class HorizontalScrollVariants extends StatefulWidget {
  const HorizontalScrollVariants({super.key});

  @override
  State<HorizontalScrollVariants> createState() =>
      _HorizontalScrollVariantsState();
}

class _HorizontalScrollVariantsState extends State<HorizontalScrollVariants> {
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
          final palette = ctx.ds.palette;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 40,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: count,
                  separatorBuilder: (_, __) =>
                      SizedBox(width: ProductDetailUi.gapSm(ctx)),
                  itemBuilder: (_, i) {
                    final selected = _selected[groupIndex] == i;

                    return GestureDetector(
                      onTap: () => setState(() => _selected[groupIndex] = i),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 220),
                        padding: EdgeInsets.symmetric(
                          horizontal: ProductDetailUi.gapMd(ctx),
                        ),
                        decoration: BoxDecoration(
                          color: selected
                              ? palette.primarySoft(0.12)
                              : palette.surface,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: selected
                                ? palette.primary.withValues(alpha: 0.4)
                                : palette.border.withValues(alpha: 0.45),
                          ),
                        ),
                        alignment: Alignment.center,
                        child: ProductDetailUi.optionSkeleton(
                          ctx,
                          widthFactor: 0.11,
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: ProductDetailUi.gapXs(ctx)),
              AnimatedContainer(
                duration: const Duration(milliseconds: 220),
                height: 3,
                width: 48,
                margin: EdgeInsets.only(
                  left: (_selected[groupIndex]! * 56).toDouble().clamp(0, 120),
                ),
                decoration: BoxDecoration(
                  color: palette.primary,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
