import 'package:flutter/material.dart';

import 'registered_sections.dart';
import 'section_registry.dart';
import 'sections_catalog.dart';

/// Catalog of storefront sections for the layout engine.
abstract final class StorefrontSectionCatalog {
  static const bannerSectionId = 'banner';

  static List<SectionRegistry> get all => RegisteredSections.all;

  static SectionRegistry? find(String sectionId) =>
      SectionsCatalog.findById(sectionId);

  static bool isKnown(String sectionId) => find(sectionId) != null;

  static List<String> styleIdsFor(String sectionId) =>
      find(sectionId)?.styles ?? const [];

  static String resolveStyleId(String sectionId, String styleId) {
    final registry = find(sectionId);
    if (registry == null || registry.styles.isEmpty) return styleId;
    return registry.styles.contains(styleId) ? styleId : registry.defaultStyleId;
  }

  static Widget? build({
    required String sectionId,
    required String styleId,
  }) {
    final registry = find(sectionId);
    if (registry == null) return null;

    final resolvedStyleId = resolveStyleId(sectionId, styleId);
    return registry.buildStyle(resolvedStyleId);
  }
}
