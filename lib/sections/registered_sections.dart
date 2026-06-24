import 'section_registry.dart';
import 'banner/banner_registry.dart';
import 'booking/booking_registry.dart';
import 'categories/categories_registry.dart';
import 'certifications/certifications_registry.dart';
import 'collections/collections_registry.dart';
import 'location/location_registry.dart';
import 'offers/offers_registry.dart';
import 'reviews/reviews_registry.dart';
import 'social/social_registry.dart';
import 'staff/staff_registry.dart';

/// Single registration point for storefront sections.
///
/// When adding a new section:
/// 1. Create `{section}_registry.dart` with styles from `*StyleId.all`
/// 2. Import it here and append its registry to [all]
abstract final class RegisteredSections {
  static final List<SectionRegistry> all = [
    BannerSectionRegistry.registry,
    CollectionsSectionRegistry.registry,
    CategoriesSectionRegistry.registry,
    SocialSectionRegistry.registry,
    CertificationsSectionRegistry.registry,
    BookingSectionRegistry.registry,
    StaffSectionRegistry.registry,
    ReviewsSectionRegistry.registry,
    OffersSectionRegistry.registry,
    LocationSectionRegistry.registry,
  ];
}
