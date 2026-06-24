import 'package:flutter/material.dart';

/// Builds a section style widget for the given [styleId].
typedef SectionStyleBuilder = Widget Function(String styleId);

/// Describes a storefront section and its registered styles.
///
/// Each section folder exposes one [SectionRegistry] instance.
/// Style lists are sourced from the section's `*StyleId.all` registry.
class SectionRegistry {
  final String id;
  final String name;
  final List<String> styles;
  final SectionStyleBuilder buildStyle;

  /// When set, returns false to skip rendering a style with no content.
  final bool Function(String styleId)? hasRenderableContent;

  const SectionRegistry({
    required this.id,
    required this.name,
    required this.styles,
    required this.buildStyle,
    this.hasRenderableContent,
  });

  /// First registered style — used when [styleId] is unknown.
  String get defaultStyleId => styles.isNotEmpty ? styles.first : '';

  int get styleCount => styles.length;
}

/// Merges a section's [exampleJson] envelope with a [styleId].
Map<String, dynamic> sectionStyleEnvelope(
  Map<String, dynamic> exampleJson,
  String styleId,
) {
  return {
    ...exampleJson,
    'style': styleId,
  };
}
