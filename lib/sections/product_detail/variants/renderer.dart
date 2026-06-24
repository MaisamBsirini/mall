import 'package:flutter/material.dart';

import '../styles/variants/adaptive_chips.dart';
import '../styles/variants/card_selector.dart';
import '../styles/variants/expandable_list.dart';
import '../styles/variants/horizontal_scroll.dart';
import '../styles/variants/segmented_pills.dart';
import 'styles.dart';

/// Style registry for the Variants section — maps styleId → widget.
abstract final class VariantsSectionRenderer {
  static const sectionId = 'variants';

  static Widget build(String styleId) {
    return _builders[styleId]?.call() ?? const _UnknownVariantsStyle();
  }

  static final Map<String, Widget Function()> _builders = {
    VariantsStyleId.adaptiveChips: () => const AdaptiveChipsVariants(),
    VariantsStyleId.horizontalScroll: () => const HorizontalScrollVariants(),
    VariantsStyleId.cardSelector: () => const CardSelectorVariants(),
    VariantsStyleId.segmentedPills: () => const SegmentedPillsVariants(),
    VariantsStyleId.expandableList: () => const ExpandableListVariants(),
  };
}

class _UnknownVariantsStyle extends StatelessWidget {
  const _UnknownVariantsStyle();

  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}
