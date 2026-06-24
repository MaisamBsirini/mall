import 'package:flutter/material.dart';

import '../section_registry.dart';
import 'renderer.dart';
import 'reviews_section_config.dart';
import 'styles.dart';

abstract final class ReviewsSectionRegistry {
  static const String sectionId = 'reviews';
  static const String sectionName = 'Reviews';

  static final SectionRegistry registry = SectionRegistry(
    id: sectionId,
    name: sectionName,
    styles: ReviewsStyleId.all,
    buildStyle: _buildStyle,
  );

  static Widget _buildStyle(String styleId) => ReviewsRenderer(
        config: ReviewsSectionConfig.fromJson(
          sectionStyleEnvelope(ReviewsSectionConfig.exampleJson, styleId),
        ),
      );
}
