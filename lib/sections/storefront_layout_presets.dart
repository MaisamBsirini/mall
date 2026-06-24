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
import 'storefront_layout_config.dart';

/// Default storefront layout presets for local configuration bootstrap.
abstract final class StorefrontLayoutPresets {
  static const fullStore = 'preset_full_store';
  static const minimal = 'preset_minimal';
  static const commerce = 'preset_commerce';

  static const all = [fullStore, minimal, commerce];

  static List<StorefrontLayoutSectionEntry> sectionsFor(String presetId) {
    return switch (presetId) {
      minimal => const [
          StorefrontLayoutSectionEntry(
            sectionId: BannerSectionRegistry.sectionId,
            styleId: 'hero_banner',
            enabled: true,
            order: 1,
          ),
          StorefrontLayoutSectionEntry(
            sectionId: CollectionsSectionRegistry.sectionId,
            styleId: 'horizontal_circles',
            enabled: true,
            order: 2,
          ),
          StorefrontLayoutSectionEntry(
            sectionId: SocialSectionRegistry.sectionId,
            styleId: 'minimal_social_chips',
            enabled: true,
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
            ].contains(s.sectionId),
          ),
        ],
      _ => _fullSections,
    };
  }

  static const _fullSections = [
    StorefrontLayoutSectionEntry(
      sectionId: BannerSectionRegistry.sectionId,
      styleId: 'hero_banner',
      enabled: true,
      order: 1,
    ),
    StorefrontLayoutSectionEntry(
      sectionId: CollectionsSectionRegistry.sectionId,
      styleId: 'horizontal_circles',
      enabled: true,
      order: 2,
    ),
    StorefrontLayoutSectionEntry(
      sectionId: CategoriesSectionRegistry.sectionId,
      styleId: 'icon_hub',
      enabled: true,
      order: 3,
    ),
    StorefrontLayoutSectionEntry(
      sectionId: OffersSectionRegistry.sectionId,
      styleId: 'compact_horizontal_offer',
      enabled: true,
      order: 4,
    ),
    StorefrontLayoutSectionEntry(
      sectionId: BookingSectionRegistry.sectionId,
      styleId: 'stacked_step_cards',
      enabled: true,
      order: 5,
    ),
    StorefrontLayoutSectionEntry(
      sectionId: StaffSectionRegistry.sectionId,
      styleId: 'alternating_staff',
      enabled: true,
      order: 6,
    ),
    StorefrontLayoutSectionEntry(
      sectionId: ReviewsSectionRegistry.sectionId,
      styleId: 'review_dashboard',
      enabled: true,
      order: 7,
    ),
    StorefrontLayoutSectionEntry(
      sectionId: CertificationsSectionRegistry.sectionId,
      styleId: 'certificate_wall',
      enabled: true,
      order: 8,
    ),
    StorefrontLayoutSectionEntry(
      sectionId: SocialSectionRegistry.sectionId,
      styleId: 'minimal_social_chips',
      enabled: true,
      order: 9,
    ),
    StorefrontLayoutSectionEntry(
      sectionId: LocationSectionRegistry.sectionId,
      styleId: 'corner_location_badge',
      enabled: true,
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
