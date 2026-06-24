import 'package:flutter/material.dart';

import '../section_registry.dart';
import 'banner_section_config.dart';
import 'renderer.dart';
import 'styles.dart';

abstract final class BannerSectionRegistry {
  static const String sectionId = 'banner';
  static const String sectionName = 'Banner';

  static final SectionRegistry registry = SectionRegistry(
    id: sectionId,
    name: sectionName,
    styles: BannerStyleId.all,
    buildStyle: _buildStyle,
  );

  static Widget _buildStyle(String styleId) => BannerRenderer(
        config: BannerSectionConfig.fromJson(
          sectionStyleEnvelope(BannerSectionConfig.exampleJson, styleId),
        ),
      );
}
