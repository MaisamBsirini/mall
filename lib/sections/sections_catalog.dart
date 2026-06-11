import 'section_registry.dart';
import 'banner/banner_registry.dart';
import 'booking/booking_registry.dart';
import 'categories/categories_registry.dart';
import 'certifications/certifications_registry.dart';
import 'collections/collections_registry.dart';
import 'social/social_registry.dart';
import 'staff/staff_registry.dart';

/// Aggregates every registered storefront section.
///
/// To register a new section, add its registry entry to [all].
/// Individual styles are discovered from each section's `*StyleId.all` list.
class SectionsCatalog {
  SectionsCatalog._();

  static final List<SectionRegistry> all = [
    BannerSectionRegistry.registry,
    CollectionsSectionRegistry.registry,
    CategoriesSectionRegistry.registry,
    SocialSectionRegistry.registry,
    CertificationsSectionRegistry.registry,
    BookingSectionRegistry.registry,
    StaffSectionRegistry.registry,
  ];

  static SectionRegistry? findById(String id) {
    for (final section in all) {
      if (section.id == id) return section;
    }
    return null;
  }

  static int get totalStyleCount =>
      all.fold(0, (count, section) => count + section.styleCount);
}
