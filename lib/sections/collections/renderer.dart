import 'package:flutter/material.dart';

import '../../design_system/scope/design_system_scope.dart';
import 'collections_section_config.dart';
import 'styles.dart';
import 'styles/horizontal_circles.dart';
import 'styles/minimal_tiles.dart';
import 'styles/rectangle_cards.dart';
import 'styles/split_cards.dart';
import 'styles/stacked_cards.dart';

class CollectionsRenderer extends StatelessWidget {
  final CollectionsSectionConfig config;

  const CollectionsRenderer({
    super.key,
    required this.config,
  });

  CollectionsRenderer.fromStyleId({
    super.key,
    required String styleId,
    bool enabled = true,
  }) : config = CollectionsSectionConfig(
          id: 'collections',
          name: 'Collections',
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
      case CollectionsStyleId.horizontalCircles:
        return const HorizontalCirclesCollections();
      case CollectionsStyleId.rectangleCards:
        return const RectangleCardsCollections();
      case CollectionsStyleId.splitCards:
        return const SplitCardsCollections();
      case CollectionsStyleId.stackedCards:
        return const StackedCardsCollections();
      case CollectionsStyleId.minimalTiles:
        return const MinimalTilesCollections();
      default:
        return const _UnknownCollectionsStyle();
    }
  }
}

class _UnknownCollectionsStyle extends StatelessWidget {
  const _UnknownCollectionsStyle();

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
