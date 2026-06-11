import 'package:flutter/material.dart';

import '../section_registry.dart';
import 'booking_section_config.dart';
import 'renderer.dart';
import 'styles.dart';

abstract final class BookingSectionRegistry {
  static const String sectionId = 'booking';
  static const String sectionName = 'Booking';

  static final SectionRegistry registry = SectionRegistry(
    id: sectionId,
    name: sectionName,
    styles: BookingStyleId.all,
    buildStyle: _buildStyle,
  );

  static Widget _buildStyle(String styleId) => BookingRenderer(
        config: BookingSectionConfig(
          id: sectionId,
          name: sectionName,
          enabled: true,
          order: 0,
          style: styleId,
        ),
      );
}
