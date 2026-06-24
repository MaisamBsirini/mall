import 'package:flutter/material.dart';

import '../styles/info/compact_header.dart';
import '../styles/info/editorial_card.dart';
import '../styles/info/large_title_stack.dart';
import '../styles/info/minimal_centered.dart';
import '../styles/info/overlay_info.dart';
import 'styles.dart';

/// Style registry for the Product Information section — maps styleId → widget.
abstract final class InfoSectionRenderer {
  static const sectionId = 'info';

  static Widget build(String styleId) {
    return _builders[styleId]?.call() ?? const _UnknownInfoStyle();
  }

  static final Map<String, Widget Function()> _builders = {
    InfoStyleId.largeTitleStack: () => const LargeTitleStackInfo(),
    InfoStyleId.compactHeader: () => const CompactHeaderInfo(),
    InfoStyleId.overlayInfo: () => const OverlayInfoStyle(),
    InfoStyleId.editorialCard: () => const EditorialCardInfo(),
    InfoStyleId.minimalCentered: () => const MinimalCenteredInfo(),
  };
}

class _UnknownInfoStyle extends StatelessWidget {
  const _UnknownInfoStyle();

  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}
