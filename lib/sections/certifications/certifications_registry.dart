import 'package:flutter/material.dart';

import '../section_registry.dart';
import 'certifications_section_config.dart';
import 'renderer.dart';
import 'styles.dart';

abstract final class CertificationsSectionRegistry {
  static const String sectionId = 'certifications';
  static const String sectionName = 'Certifications';

  static final SectionRegistry registry = SectionRegistry(
    id: sectionId,
    name: sectionName,
    styles: CertificationsStyleId.all,
    buildStyle: _buildStyle,
  );

  static Widget _buildStyle(String styleId) => CertificationsRenderer(
        config: CertificationsSectionConfig.fromJson(
          sectionStyleEnvelope(CertificationsSectionConfig.exampleJson, styleId),
        ),
      );
}
