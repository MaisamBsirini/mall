import 'package:flutter/material.dart';

/// Builds a section style widget for the given [styleId].
typedef SectionStyleBuilder = Widget Function(String styleId);

/// Describes a storefront section and its registered styles.
class SectionRegistry {
  final String id;
  final String name;
  final List<String> styles;
  final SectionStyleBuilder buildStyle;

  const SectionRegistry({
    required this.id,
    required this.name,
    required this.styles,
    required this.buildStyle,
  });

  /// First registered style — used when [styleId] is unknown.
  String get defaultStyleId => styles.isNotEmpty ? styles.first : '';

  int get styleCount => styles.length;
}

/// Merges a section's layout [exampleJson] with a [styleId].
Map<String, dynamic> sectionStyleEnvelope(
  Map<String, dynamic> exampleJson,
  String styleId,
) {
  return {
    ...exampleJson,
    'style': styleId,
  };
}
