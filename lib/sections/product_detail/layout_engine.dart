import 'package:flutter/material.dart';

import 'config.dart';
import 'section_catalog.dart';

/// Dynamic layout engine — filter, dedupe, resolve styles, sort, render.
class ProductDetailLayoutEngine extends StatelessWidget {
  final List<ProductDetailSectionEntry> sections;
  final ScrollPhysics? physics;

  const ProductDetailLayoutEngine({
    super.key,
    required this.sections,
    this.physics,
  });

  ProductDetailLayoutEngine.fromConfig({
    super.key,
    required ProductDetailLayoutConfig config,
    this.physics,
  }) : sections = config.sections;

  /// Resolves the layout pipeline: filter → skip unknown → dedupe → style fallback → sort.
  static List<ProductDetailSectionEntry> resolve(
    List<ProductDetailSectionEntry> sections,
  ) {
    final seen = <String>{};
    final resolved = <ProductDetailSectionEntry>[];

    for (final entry in sections) {
      if (!entry.enabled) continue;
      if (!ProductDetailSectionCatalog.isKnown(entry.sectionId)) continue;
      if (seen.contains(entry.sectionId)) continue;

      final styleId = ProductDetailSectionCatalog.resolveStyleId(
        entry.sectionId,
        entry.styleId,
      );

      seen.add(entry.sectionId);
      resolved.add(entry.copyWith(styleId: styleId));
    }

    resolved.sort((a, b) => a.order.compareTo(b.order));
    return resolved;
  }

  /// Legacy alias — prefer [resolve].
  static List<ProductDetailSectionEntry> resolveActive(
    List<ProductDetailSectionEntry> sections,
  ) =>
      resolve(sections);

  @override
  Widget build(BuildContext context) {
    final active = resolve(sections);

    return SingleChildScrollView(
      physics: physics ?? const ClampingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (final entry in active)
            ProductDetailSectionCatalog.render(
              sectionId: entry.sectionId,
              styleId: entry.styleId,
            ),
        ],
      ),
    );
  }
}
