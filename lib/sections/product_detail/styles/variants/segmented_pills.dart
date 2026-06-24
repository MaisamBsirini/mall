import 'package:flutter/material.dart';

import '../../../../design_system/scope/design_system_scope.dart';
import '../../widgets/ui_placeholders.dart';

/// Variants 3 — premium segmented control with floating selected background.
class SegmentedPillsVariants extends StatefulWidget {
  const SegmentedPillsVariants({super.key});

  @override
  State<SegmentedPillsVariants> createState() => _SegmentedPillsVariantsState();
}

class _SegmentedPillsVariantsState extends State<SegmentedPillsVariants> {
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
          final selected = _selected[groupIndex]!;
          final palette = ctx.ds.palette;
          final options = count.clamp(1, 5);

          return LayoutBuilder(
            builder: (context, constraints) {
              final segmentWidth = constraints.maxWidth / options;

              return Container(
                height: 42,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: palette.placeholderLight.withValues(alpha: 0.35),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: palette.border.withValues(alpha: 0.35)),
                ),
                child: Stack(
                  children: [
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 260),
                      curve: Curves.easeOutCubic,
                      left: segmentWidth * selected,
                      width: segmentWidth,
                      top: 0,
                      bottom: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: palette.surface,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: ProductDetailUi.softShadow(
                            ctx,
                            opacity: 0.12,
                            blur: 8,
                            offset: const Offset(0, 2),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: List.generate(options, (i) {
                        return Expanded(
                          child: GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () => setState(() => _selected[groupIndex] = i),
                            child: Center(
                              child: ProductDetailUi.optionSkeleton(
                                ctx,
                                widthFactor: 0.10,
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
