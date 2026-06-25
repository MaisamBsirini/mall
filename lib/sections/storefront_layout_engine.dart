import 'package:flutter/material.dart';

import '../design_system/scope/design_system_scope.dart';
import 'storefront_section_entry.dart';
import 'storefront_section_catalog.dart';

/// Resolves and renders storefront sections from customize configuration only.
abstract final class StorefrontLayoutEngine {
  /// filter enabled → skip unknown → dedupe → style fallback → sort → pin banner
  static List<StorefrontSectionEntry> resolve(
    List<StorefrontSectionEntry> sections,
  ) {
    final seen = <String>{};
    final resolved = <StorefrontSectionEntry>[];

    for (final entry in sections) {
      if (!entry.enabled) continue;
      if (!StorefrontSectionCatalog.isKnown(entry.id)) continue;
      if (seen.contains(entry.id)) continue;

      final style = StorefrontSectionCatalog.resolveStyleId(entry.id, entry.style);

      seen.add(entry.id);
      resolved.add(entry.copyWith(style: style));
    }

    resolved.sort((a, b) => a.order.compareTo(b.order));
    return _pinBanner(resolved);
  }

  static List<StorefrontSectionEntry> _pinBanner(
    List<StorefrontSectionEntry> sections,
  ) {
    final bannerIndex = sections.indexWhere(
      (s) => s.id == StorefrontSectionCatalog.bannerSectionId,
    );

    if (bannerIndex <= 0) return sections;

    final result = List<StorefrontSectionEntry>.from(sections);
    final banner = result.removeAt(bannerIndex);
    result.insert(0, banner);
    return result;
  }
}

/// Scrollable storefront page driven by section customize entries.
class StorefrontLayoutView extends StatelessWidget {
  final List<StorefrontSectionEntry> sections;
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
          sectionId: entry.id,
          styleId: entry.style,
        );

        if (widget == null) return const SizedBox.shrink();
        return widget;
      },
    );
  }
}
