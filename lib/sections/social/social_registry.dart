import 'package:flutter/material.dart';

import '../section_registry.dart';
import 'renderer.dart';
import 'social_section_config.dart';
import 'styles.dart';

abstract final class SocialSectionRegistry {
  static const String sectionId = 'social';
  static const String sectionName = 'Social Media';

  static final SectionRegistry registry = SectionRegistry(
    id: sectionId,
    name: sectionName,
    styles: SocialStyleId.all,
    buildStyle: _buildStyle,
  );

  static Widget _buildStyle(String styleId) => SocialRenderer(
        config: SocialSectionConfig(
          id: sectionId,
          name: sectionName,
          enabled: true,
          order: 0,
          style: styleId,
        ),
      );
}
