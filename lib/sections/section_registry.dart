import 'package:flutter/material.dart';

/// Builds a section style widget for the given [styleId].
typedef SectionStyleBuilder = Widget Function(String styleId);

/// Describes a storefront section and its registered styles.
///
/// Each section folder exposes one [SectionRegistry] instance.
/// Style lists are sourced from the section's `*StyleId.all` registry —
/// adding a style there makes it appear in the showcase automatically.
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

  /// Display title used in the design playground, e.g. "Banner Styles".
  String get showcaseTitle => '$name Styles';

  int get styleCount => styles.length;
}

/// Formats a snake_case style id into a readable label.
String formatSectionStyleName(String styleId) {
  return styleId
      .split('_')
      .map(
        (word) =>
            word.isEmpty ? word : '${word[0].toUpperCase()}${word.substring(1)}',
      )
      .join(' ');
}
