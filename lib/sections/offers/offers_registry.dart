import 'package:flutter/material.dart';

import '../section_registry.dart';
import 'offers_section_config.dart';
import 'renderer.dart';
import 'styles.dart';

abstract final class OffersSectionRegistry {
  static const String sectionId = 'offers';
  static const String sectionName = 'Offers';

  static final SectionRegistry registry = SectionRegistry(
    id: sectionId,
    name: sectionName,
    styles: OffersStyleId.all,
    buildStyle: _buildStyle,
  );

  static Widget _buildStyle(String styleId) => OffersRenderer(
        config: OffersSectionConfig.fromJson(
          sectionStyleEnvelope(OffersSectionConfig.exampleJson, styleId),
        ),
      );
}
