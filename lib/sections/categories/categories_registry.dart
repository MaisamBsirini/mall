import 'package:flutter/material.dart';

import '../section_registry.dart';
import 'categories_section_config.dart';
import 'renderer.dart';
import 'styles.dart';

abstract final class CategoriesSectionRegistry {
  static const String sectionId = 'categories';
  static const String sectionName = 'Categories';

  static final SectionRegistry registry = SectionRegistry(
    id: sectionId,
    name: sectionName,
    styles: CategoriesStyleId.all,
    buildStyle: _buildStyle,
  );

  static Widget _buildStyle(String styleId) => CategoriesRenderer(
        config: CategoriesSectionConfig.fromJson(
          sectionStyleEnvelope(CategoriesSectionConfig.exampleJson, styleId),
        ),
      );
}
