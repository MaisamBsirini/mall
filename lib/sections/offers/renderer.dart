import 'package:flutter/material.dart';

import '../../design_system/scope/design_system_scope.dart';
import 'offers_section_config.dart';
import 'styles.dart';
import 'styles/badge_based_offers.dart';
import 'styles/compact_horizontal_offer.dart';
import 'styles/dense_offer_list.dart';
import 'styles/image_left_strip.dart';
import 'styles/minimal_offer_grid.dart';

class OffersRenderer extends StatelessWidget {
  final OffersSectionConfig config;

  const OffersRenderer({
    super.key,
    required this.config,
  });

  OffersRenderer.fromStyleId({
    super.key,
    required String styleId,
    bool enabled = true,
  }) : config = OffersSectionConfig(
          id: 'offers',
          name: 'Offers',
          enabled: enabled,
          order: 0,
          style: styleId,
        );

  @override
  Widget build(BuildContext context) {
    if (!config.enabled) {
      return const SizedBox.shrink();
    }

    switch (config.style) {
      case OffersStyleId.compactHorizontalOffer:
        return const CompactHorizontalOfferStyle();
      case OffersStyleId.denseOfferList:
        return const DenseOfferListStyle();
      case OffersStyleId.badgeBasedOffers:
        return const BadgeBasedOffersStyle();
      case OffersStyleId.imageLeftStrip:
        return const ImageLeftStripStyle();
      case OffersStyleId.minimalOfferGrid:
        return const MinimalOfferGridStyle();
      default:
        return const _UnknownOffersStyle();
    }
  }
}

class _UnknownOffersStyle extends StatelessWidget {
  const _UnknownOffersStyle();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: context.ds.placeholders.shimmerBox(
        height: 48,
        borderRadius: context.ds.tokens.borderSm,
      ),
    );
  }
}
