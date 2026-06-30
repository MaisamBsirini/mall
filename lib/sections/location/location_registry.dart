import 'package:flutter/material.dart';

import '../section_registry.dart';
import 'location_component_config.dart';
import 'renderer.dart';
import 'styles.dart';

abstract final class LocationSectionRegistry {
  static const String sectionId = 'location';
  static const String sectionName = 'Location Component';

  static final SectionRegistry registry = SectionRegistry(
    id: sectionId,
    name: sectionName,
    styles: LocationStyleId.all,
    buildStyle: _buildStyle,
  );

  static Widget _buildStyle(String styleId) => LocationRenderer(
        config: LocationComponentConfig(style: styleId),
      );
}
