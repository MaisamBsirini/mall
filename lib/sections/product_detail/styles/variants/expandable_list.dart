import 'package:flutter/material.dart';

import '../../../../design_system/scope/design_system_scope.dart';
import '../../widgets/ui_placeholders.dart';

/// Variants 5 — expandable selection panel per attribute group.
class ExpandableListVariants extends StatefulWidget {
  const ExpandableListVariants({super.key});

  @override
  State<ExpandableListVariants> createState() => _ExpandableListVariantsState();
}

class _ExpandableListVariantsState extends State<ExpandableListVariants> {
  int? _expandedGroup;
  final Map<int, int> _selected = {};

  @override
  Widget build(BuildContext context) {
    final groups = ProductDetailUi.density(context).attributeGroups;
    final padding = ProductDetailUi.pagePadding(context);

    if (groups <= 0) {
      return Padding(
        padding: padding,
        child: ProductDetailUi.emptyVariantArea(context),
      );
    }

    return Padding(
      padding: padding,
      child: Column(
        children: [
          for (var g = 0; g < groups; g++) ...[
            if (g > 0) SizedBox(height: ProductDetailUi.gapSm(context)),
            _ExpandablePanel(
              groupIndex: g,
              optionCount: ProductDetailUi.density(context).optionsPerGroup,
              expanded: _expandedGroup == g,
              selectedIndex: _selected[g] ?? 0,
              onToggle: () => setState(() {
                _expandedGroup = _expandedGroup == g ? null : g;
              }),
              onSelect: (i) => setState(() {
                _selected[g] = i;
                _expandedGroup = g;
              }),
            ),
          ],
        ],
      ),
    );
  }
}

class _ExpandablePanel extends StatelessWidget {
  final int groupIndex;
  final int optionCount;
  final bool expanded;
  final int selectedIndex;
  final VoidCallback onToggle;
  final ValueChanged<int> onSelect;

  const _ExpandablePanel({
    required this.groupIndex,
    required this.optionCount,
    required this.expanded,
    required this.selectedIndex,
    required this.onToggle,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final palette = context.ds.palette;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 280),
      curve: Curves.easeOutCubic,
      decoration: BoxDecoration(
        color: palette.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: expanded
              ? palette.primary.withValues(alpha: 0.35)
              : palette.border.withValues(alpha: 0.45),
        ),
        boxShadow: expanded
            ? ProductDetailUi.softShadow(context, opacity: 0.10)
            : [
                BoxShadow(
                  color: palette.overlayDark.withValues(alpha: 0.04),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onToggle,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: ProductDetailUi.gapMd(context),
                  vertical: ProductDetailUi.gapSm(context) * 1.1,
                ),
                child: Row(
                  children: [
                    Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        color: palette.primarySoft(0.10),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.tune_rounded,
                        size: 16,
                        color: palette.primary,
                      ),
                    ),
                    SizedBox(width: ProductDetailUi.gapSm(context)),
                    Expanded(
                      child: ProductDetailUi.line(context, widthFactor: 0.24),
                    ),
                    AnimatedRotation(
                      turns: expanded ? 0.5 : 0,
                      duration: const Duration(milliseconds: 220),
                      child: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: palette.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          AnimatedCrossFade(
            duration: const Duration(milliseconds: 240),
            crossFadeState: expanded && optionCount > 0
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            firstChild: const SizedBox.shrink(),
            secondChild: Column(
              children: [
                ProductDetailUi.divider(context),
                Padding(
                  padding: EdgeInsets.all(ProductDetailUi.gapMd(context)),
                  child: Wrap(
                    spacing: ProductDetailUi.gapSm(context),
                    runSpacing: ProductDetailUi.gapSm(context),
                    children: List.generate(optionCount, (i) {
                      final selected = selectedIndex == i;

                      return GestureDetector(
                        onTap: () => onSelect(i),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: EdgeInsets.symmetric(
                            horizontal: ProductDetailUi.gapMd(context),
                            vertical: ProductDetailUi.gapSm(context) * 0.75,
                          ),
                          decoration: BoxDecoration(
                            color: selected
                                ? palette.primarySoft(0.14)
                                : palette.background,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: selected
                                  ? palette.primary
                                  : palette.border.withValues(alpha: 0.4),
                            ),
                          ),
                          child: ProductDetailUi.optionSkeleton(
                            context,
                            widthFactor: 0.12,
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
