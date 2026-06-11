import 'package:flutter/material.dart';

import '../section_registry.dart';
import 'renderer.dart';
import 'staff_section_config.dart';
import 'styles.dart';

abstract final class StaffSectionRegistry {
  static const String sectionId = 'staff';
  static const String sectionName = 'Staff';

  static final SectionRegistry registry = SectionRegistry(
    id: sectionId,
    name: sectionName,
    styles: StaffStyleId.all,
    buildStyle: _buildStyle,
  );

  static Widget _buildStyle(String styleId) => StaffRenderer(
        config: StaffSectionConfig(
          id: sectionId,
          name: sectionName,
          enabled: true,
          order: 0,
          style: styleId,
        ),
      );
}
