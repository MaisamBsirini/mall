import 'package:flutter/material.dart';

import 'info/renderer.dart';
import 'info/styles.dart';
import 'media/renderer.dart';
import 'media/styles.dart';
import 'product_detail_section_ids.dart';
import 'reviews/renderer.dart';
import 'reviews/styles.dart';
import 'style_descriptions.dart';
import 'variants/renderer.dart';
import 'variants/styles.dart';

typedef ProductDetailSectionBuilder = Widget Function(String styleId);

/// Definition of a product detail sub-section for the layout engine catalog.
class ProductDetailSectionDefinition {
  final String id;
  final String name;
  final List<String> styleIds;
  final ProductDetailSectionBuilder build;
  final Map<String, String>? styleDescriptions;

  const ProductDetailSectionDefinition({
    required this.id,
    required this.name,
    required this.styleIds,
    required this.build,
    this.styleDescriptions,
  });

  String get defaultStyleId => styleIds.first;

  String? descriptionFor(String styleId) => styleDescriptions?[styleId];
}

/// Catalog of the four supported product detail sections.
abstract final class ProductDetailSectionCatalog {
  static final Map<String, ProductDetailSectionDefinition> _sections = {
    for (final definition in _definitions) definition.id: definition,
  };

  static final _definitions = [
    ProductDetailSectionDefinition(
      id: ProductDetailSectionId.media,
      name: 'Media',
      styleIds: MediaStyleId.all,
      build: MediaSectionRenderer.build,
      styleDescriptions: ProductDetailStyleDescriptions.media,
    ),
    ProductDetailSectionDefinition(
      id: ProductDetailSectionId.info,
      name: 'Product Information',
      styleIds: InfoStyleId.all,
      build: InfoSectionRenderer.build,
      styleDescriptions: ProductDetailStyleDescriptions.info,
    ),
    ProductDetailSectionDefinition(
      id: ProductDetailSectionId.variants,
      name: 'Variants',
      styleIds: VariantsStyleId.all,
      build: VariantsSectionRenderer.build,
      styleDescriptions: ProductDetailStyleDescriptions.variants,
    ),
    ProductDetailSectionDefinition(
      id: ProductDetailSectionId.reviews,
      name: 'Reviews',
      styleIds: ReviewsStyleId.all,
      build: ReviewsSectionRenderer.build,
      styleDescriptions: ProductDetailStyleDescriptions.reviews,
    ),
  ];

  static List<ProductDetailSectionDefinition> get all => List.unmodifiable(
        ProductDetailSectionId.all
            .map((id) => _sections[id]!)
            .toList(growable: false),
      );

  static ProductDetailSectionDefinition? find(String sectionId) =>
      _sections[sectionId];

  static bool isKnown(String sectionId) => _sections.containsKey(sectionId);

  static List<String> styleIdsFor(String sectionId) =>
      _sections[sectionId]?.styleIds ?? const [];

  static String defaultStyleIdFor(String sectionId) =>
      find(sectionId)?.defaultStyleId ?? sectionId;

  static String resolveStyleId(String sectionId, String styleId) {
    final ids = styleIdsFor(sectionId);
    if (ids.isEmpty) return styleId;
    return ids.contains(styleId) ? styleId : ids.first;
  }

  static Widget render({
    required String sectionId,
    required String styleId,
  }) {
    final definition = _sections[sectionId];
    if (definition == null) return const SizedBox.shrink();

    final resolvedStyleId = resolveStyleId(sectionId, styleId);
    return definition.build(resolvedStyleId);
  }
}
