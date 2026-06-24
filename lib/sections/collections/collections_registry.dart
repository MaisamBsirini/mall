import 'package:flutter/material.dart';

import '../section_registry.dart';
import 'collections_section_config.dart';
import 'renderer.dart';
import 'styles.dart';

abstract final class CollectionsSectionRegistry {
  static const String sectionId = 'collections';
  static const String sectionName = 'Collections';

  static final SectionRegistry registry = SectionRegistry(
    id: sectionId,
    name: sectionName,
    styles: CollectionsStyleId.all,
    buildStyle: _buildStyle,
  );

  static Widget _buildStyle(String styleId) => CollectionsRenderer(
        config: CollectionsSectionConfig.fromJson(
          sectionStyleEnvelope(CollectionsSectionConfig.exampleJson, styleId),
        ),
      );
}
