import 'package:flutter/material.dart';

import '../design_system/scope/design_system_scope.dart';
import 'storefront_layout_config.dart';
import 'storefront_section_catalog.dart';

/// Resolves and renders storefront sections dynamically.
abstract final class StorefrontLayoutEngine {
  /// Resolves the layout pipeline: filter → dedupe → validate → sort → pin banner.
  static List<StorefrontLayoutSectionEntry> resolve(
    List<StorefrontLayoutSectionEntry> sections,
  ) {
    final seen = <String>{};
    final resolved = <StorefrontLayoutSectionEntry>[];

    for (final entry in sections) {
      if (!entry.enabled) continue;
      if (!StorefrontSectionCatalog.isKnown(entry.sectionId)) continue;
      if (seen.contains(entry.sectionId)) continue;

      final styleId = StorefrontSectionCatalog.resolveStyleId(
        entry.sectionId,
        entry.styleId,
      );

      if (!StorefrontSectionCatalog.hasRenderableContent(entry.sectionId, styleId)) {
        continue;
      }

      seen.add(entry.sectionId);
      resolved.add(entry.copyWith(styleId: styleId));
    }

    resolved.sort((a, b) => a.order.compareTo(b.order));
    return _pinBanner(resolved);
  }

  static List<StorefrontLayoutSectionEntry> _pinBanner(
    List<StorefrontLayoutSectionEntry> sections,
  ) {
    final bannerIndex = sections.indexWhere(
      (s) => s.sectionId == StorefrontSectionCatalog.bannerSectionId,
    );

    if (bannerIndex <= 0) return sections;

    final result = List<StorefrontLayoutSectionEntry>.from(sections);
    final banner = result.removeAt(bannerIndex);
    result.insert(0, banner);
    return result;
  }
}

/// Scrollable storefront page driven entirely by section configuration.
class StorefrontLayoutView extends StatelessWidget {
  final List<StorefrontLayoutSectionEntry> sections;
  final ScrollPhysics? physics;
  final EdgeInsets? padding;

  const StorefrontLayoutView({
    super.key,
    required this.sections,
    this.physics,
    this.padding,
  });

  StorefrontLayoutView.fromConfig({
    super.key,
    required StorefrontLayoutConfig config,
    this.physics,
    this.padding,
  }) : sections = config.sections;

  @override
  Widget build(BuildContext context) {
    final resolved = StorefrontLayoutEngine.resolve(sections);
    final tokens = context.ds.tokens;
    final verticalGap = tokens.sectionGap(context);
    final pagePadding =
        padding ?? EdgeInsets.symmetric(vertical: verticalGap);

    if (resolved.isEmpty) {
      return const SizedBox.shrink();
    }

    return ListView.separated(
      physics: physics ?? const ClampingScrollPhysics(),
      padding: pagePadding,
      itemCount: resolved.length,
      separatorBuilder: (_, __) => SizedBox(height: verticalGap),
      itemBuilder: (context, index) {
        final entry = resolved[index];
        final widget = StorefrontSectionCatalog.build(
          sectionId: entry.sectionId,
          styleId: entry.styleId,
        );

        if (widget == null) return const SizedBox.shrink();
        return widget;
      },
    );
  }
}
