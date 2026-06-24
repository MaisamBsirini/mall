import 'registered_sections.dart';
import 'section_registry.dart';

/// Aggregates every registered storefront section.
///
/// Section list lives in [RegisteredSections.all].
/// Individual styles are discovered from each section's `*StyleId.all` list.
class SectionsCatalog {
  SectionsCatalog._();

  static List<SectionRegistry> get all => RegisteredSections.all;

  static SectionRegistry? findById(String id) {
    for (final section in all) {
      if (section.id == id) return section;
    }
    return null;
  }

  static int get totalStyleCount =>
      all.fold(0, (count, section) => count + section.styleCount);
}
