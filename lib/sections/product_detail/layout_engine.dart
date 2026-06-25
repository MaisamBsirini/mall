import 'package:flutter/material.dart';

import 'config.dart';
import 'section_catalog.dart';

/// Resolves product detail sections from customize configuration only.
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

  /// filter enabled → skip unknown → dedupe → style fallback → sort
  static List<ProductDetailSectionEntry> resolve(
    List<ProductDetailSectionEntry> sections,
  ) {
    final seen = <String>{};
    final resolved = <ProductDetailSectionEntry>[];

    for (final entry in sections) {
      if (!entry.enabled) continue;
      if (!ProductDetailSectionCatalog.isKnown(entry.id)) continue;
      if (seen.contains(entry.id)) continue;

      final style = ProductDetailSectionCatalog.resolveStyleId(
        entry.id,
        entry.style,
      );

      seen.add(entry.id);
      resolved.add(entry.copyWith(style: style));
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
              sectionId: entry.id,
              styleId: entry.style,
            ),
        ],
      ),
    );
  }
}
