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
import 'storefront_section_entry.dart';

/// Default storefront layout presets — customize configuration only.
abstract final class StorefrontLayoutPresets {
  static const fullStore = 'preset_full_store';
  static const minimal = 'preset_minimal';
  static const commerce = 'preset_commerce';

  static const all = [fullStore, minimal, commerce];

  static List<StorefrontSectionEntry> sectionsFor(String presetId) {
    return switch (presetId) {
      minimal => [
          StorefrontSectionEntry.layout(
            id: BannerSectionRegistry.sectionId,
            style: 'hero_banner',
            order: 1,
          ),
          StorefrontSectionEntry.layout(
            id: CollectionsSectionRegistry.sectionId,
            style: 'horizontal_circles',
            order: 2,
          ),
          StorefrontSectionEntry.layout(
            id: SocialSectionRegistry.sectionId,
            style: 'minimal_social_chips',
            order: 3,
          ),
        ],
      commerce => [
          ..._fullSections.where(
            (s) => [
              BannerSectionRegistry.sectionId,
              CategoriesSectionRegistry.sectionId,
              OffersSectionRegistry.sectionId,
              CollectionsSectionRegistry.sectionId,
            ].contains(s.id),
          ),
        ],
      _ => _fullSections,
    };
  }

  static final _fullSections = [
    StorefrontSectionEntry.layout(
      id: BannerSectionRegistry.sectionId,
      style: 'hero_banner',
      order: 1,
    ),
    StorefrontSectionEntry.layout(
      id: CollectionsSectionRegistry.sectionId,
      style: 'horizontal_circles',
      order: 2,
    ),
    StorefrontSectionEntry.layout(
      id: CategoriesSectionRegistry.sectionId,
      style: 'icon_hub',
      order: 3,
    ),
    StorefrontSectionEntry.layout(
      id: OffersSectionRegistry.sectionId,
      style: 'compact_horizontal_offer',
      order: 4,
    ),
    StorefrontSectionEntry.layout(
      id: BookingSectionRegistry.sectionId,
      style: 'stacked_step_cards',
      order: 5,
    ),
    StorefrontSectionEntry.layout(
      id: StaffSectionRegistry.sectionId,
      style: 'alternating_staff',
      order: 6,
    ),
    StorefrontSectionEntry.layout(
      id: ReviewsSectionRegistry.sectionId,
      style: 'review_dashboard',
      order: 7,
    ),
    StorefrontSectionEntry.layout(
      id: CertificationsSectionRegistry.sectionId,
      style: 'certificate_wall',
      order: 8,
    ),
    StorefrontSectionEntry.layout(
      id: SocialSectionRegistry.sectionId,
      style: 'minimal_social_chips',
      order: 9,
    ),
    StorefrontSectionEntry.layout(
      id: LocationSectionRegistry.sectionId,
      style: 'corner_location_badge',
      order: 10,
    ),
  ];

  static String? descriptionFor(String presetId) => switch (presetId) {
        fullStore => 'All storefront sections enabled',
        minimal => 'Banner, collections, social only',
        commerce => 'Banner, categories, offers, collections',
        _ => null,
      };
}
