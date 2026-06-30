import 'package:flutter/material.dart';

import '../../design_system/scope/design_system_scope.dart';
import 'location_component_config.dart';
import 'styles.dart';
import 'styles/corner_location_badge.dart';
import 'styles/floating_location_pill.dart';
import 'styles/header_location_chip.dart';
import 'styles/location_bubble.dart';
import 'styles/location_ribbon.dart';

class LocationRenderer extends StatelessWidget {
  final LocationComponentConfig config;

  const LocationRenderer({
    super.key,
    required this.config,
  });

  LocationRenderer.fromStyleId({
    super.key,
    required String styleId,
  }) : config = LocationComponentConfig(style: styleId);

  @override
  Widget build(BuildContext context) {
    switch (config.style) {
      case LocationStyleId.cornerLocationBadge:
        return const CornerLocationBadge();
      case LocationStyleId.floatingLocationPill:
        return const FloatingLocationPill();
      case LocationStyleId.locationBubble:
        return const LocationBubble();
      case LocationStyleId.locationRibbon:
        return const LocationRibbon();
      case LocationStyleId.headerLocationChip:
        return const HeaderLocationChip();
      default:
        return const _UnknownLocationStyle();
    }
  }
}

class _UnknownLocationStyle extends StatelessWidget {
  const _UnknownLocationStyle();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: context.ds.placeholders.shimmerBox(
        height: 32,
        borderRadius: context.ds.tokens.borderSm,
      ),
    );
  }
}
