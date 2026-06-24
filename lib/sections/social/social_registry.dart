import 'package:flutter/material.dart';

import '../section_registry.dart';
import 'renderer.dart';
import 'social_section_config.dart';
import 'styles.dart';

abstract final class SocialSectionRegistry {
  static const String sectionId = 'social_media';
  static const String sectionName = 'Social Media';

  static final SectionRegistry registry = SectionRegistry(
    id: sectionId,
    name: sectionName,
    styles: SocialStyleId.all,
    buildStyle: _buildStyle,
  );

  static Widget _buildStyle(String styleId) => SocialRenderer(
        config: SocialSectionConfig.fromJson(
          sectionStyleEnvelope(SocialSectionConfig.exampleJson, styleId),
        ),
      );
}
