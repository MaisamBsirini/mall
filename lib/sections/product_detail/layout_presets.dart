import 'config.dart';
import 'product_detail_section_ids.dart';
import 'info/styles.dart';
import 'media/styles.dart';
import 'reviews/styles.dart';
import 'variants/styles.dart';

/// Named layout presets — backend-driven section order examples.
abstract final class ProductDetailLayoutPresets {
  static const defaultLayout = 'layout_default';
  static const example1 = 'layout_example_1';
  static const example2 = 'layout_example_2';
  static const example3 = 'layout_example_3';
  static const example4 = 'layout_example_4';

  /// Legacy preset ids kept for storefront registry compatibility.
  static const mediaInfo = 'layout_media_info';
  static const infoVariants = 'layout_info_variants';
  static const stackedFull = 'layout_stacked_full';
  static const variantsFirst = 'layout_variants_first';
  static const heroSheet = 'layout_hero_sheet';
  static const splitComposition = 'layout_split_composition';

  static const dynamicExamples = [example1, example2, example3, example4];

  static const all = [
    defaultLayout,
    ...dynamicExamples,
    mediaInfo,
    infoVariants,
    stackedFull,
    variantsFirst,
    heroSheet,
    splitComposition,
  ];

  static ProductDetailLayoutConfig configFor(String presetId) {
    return ProductDetailLayoutConfig(sections: sectionsFor(presetId));
  }

  static List<ProductDetailSectionEntry> sectionsFor(String presetId) {
    return switch (resolvePresetId(presetId)) {
      example1 || defaultLayout => _example1,
      example2 => _example2,
      example3 => _example3,
      example4 => _example4,
      mediaInfo => const [
          ProductDetailSectionEntry(
            sectionId: ProductDetailSectionId.media,
            styleId: MediaStyleId.heroFullWidth,
            enabled: true,
            order: 1,
          ),
          ProductDetailSectionEntry(
            sectionId: ProductDetailSectionId.info,
            styleId: InfoStyleId.largeTitleStack,
            enabled: true,
            order: 2,
          ),
          ProductDetailSectionEntry(
            sectionId: ProductDetailSectionId.variants,
            styleId: VariantsStyleId.adaptiveChips,
            enabled: false,
            order: 3,
          ),
          ProductDetailSectionEntry(
            sectionId: ProductDetailSectionId.reviews,
            styleId: ReviewsStyleId.ratingSummary,
            enabled: false,
            order: 4,
          ),
        ],
      infoVariants => const [
          ProductDetailSectionEntry(
            sectionId: ProductDetailSectionId.info,
            styleId: InfoStyleId.compactHeader,
            enabled: true,
            order: 1,
          ),
          ProductDetailSectionEntry(
            sectionId: ProductDetailSectionId.variants,
            styleId: VariantsStyleId.adaptiveChips,
            enabled: true,
            order: 2,
          ),
          ProductDetailSectionEntry(
            sectionId: ProductDetailSectionId.media,
            styleId: MediaStyleId.heroFullWidth,
            enabled: false,
            order: 3,
          ),
          ProductDetailSectionEntry(
            sectionId: ProductDetailSectionId.reviews,
            styleId: ReviewsStyleId.compactReviewsList,
            enabled: false,
            order: 4,
          ),
        ],
      stackedFull => const [
          ProductDetailSectionEntry(
            sectionId: ProductDetailSectionId.media,
            styleId: MediaStyleId.imageCarousel,
            enabled: true,
            order: 1,
          ),
          ProductDetailSectionEntry(
            sectionId: ProductDetailSectionId.info,
            styleId: InfoStyleId.largeTitleStack,
            enabled: true,
            order: 2,
          ),
          ProductDetailSectionEntry(
            sectionId: ProductDetailSectionId.variants,
            styleId: VariantsStyleId.horizontalScroll,
            enabled: true,
            order: 3,
          ),
          ProductDetailSectionEntry(
            sectionId: ProductDetailSectionId.reviews,
            styleId: ReviewsStyleId.featuredReviewCard,
            enabled: true,
            order: 4,
          ),
        ],
      variantsFirst => const [
          ProductDetailSectionEntry(
            sectionId: ProductDetailSectionId.variants,
            styleId: VariantsStyleId.segmentedPills,
            enabled: true,
            order: 1,
          ),
          ProductDetailSectionEntry(
            sectionId: ProductDetailSectionId.media,
            styleId: MediaStyleId.swipeGallery,
            enabled: true,
            order: 2,
          ),
          ProductDetailSectionEntry(
            sectionId: ProductDetailSectionId.info,
            styleId: InfoStyleId.editorialCard,
            enabled: true,
            order: 3,
          ),
          ProductDetailSectionEntry(
            sectionId: ProductDetailSectionId.reviews,
            styleId: ReviewsStyleId.reviewTimeline,
            enabled: true,
            order: 4,
          ),
        ],
      heroSheet => const [
          ProductDetailSectionEntry(
            sectionId: ProductDetailSectionId.media,
            styleId: MediaStyleId.heroFullWidth,
            enabled: true,
            order: 1,
          ),
          ProductDetailSectionEntry(
            sectionId: ProductDetailSectionId.info,
            styleId: InfoStyleId.compactHeader,
            enabled: true,
            order: 2,
          ),
          ProductDetailSectionEntry(
            sectionId: ProductDetailSectionId.variants,
            styleId: VariantsStyleId.adaptiveChips,
            enabled: true,
            order: 3,
          ),
          ProductDetailSectionEntry(
            sectionId: ProductDetailSectionId.reviews,
            styleId: ReviewsStyleId.minimalRatingStrip,
            enabled: true,
            order: 4,
          ),
        ],
      splitComposition => const [
          ProductDetailSectionEntry(
            sectionId: ProductDetailSectionId.media,
            styleId: MediaStyleId.swipeGallery,
            enabled: true,
            order: 1,
          ),
          ProductDetailSectionEntry(
            sectionId: ProductDetailSectionId.info,
            styleId: InfoStyleId.compactHeader,
            enabled: true,
            order: 2,
          ),
          ProductDetailSectionEntry(
            sectionId: ProductDetailSectionId.variants,
            styleId: VariantsStyleId.horizontalScroll,
            enabled: true,
            order: 3,
          ),
          ProductDetailSectionEntry(
            sectionId: ProductDetailSectionId.reviews,
            styleId: ReviewsStyleId.ratingSummary,
            enabled: true,
            order: 4,
          ),
        ],
      _ => _example1,
    };
  }

  static const _example1 = [
    ProductDetailSectionEntry(
      sectionId: ProductDetailSectionId.media,
      styleId: MediaStyleId.heroFullWidth,
      enabled: true,
      order: 1,
    ),
    ProductDetailSectionEntry(
      sectionId: ProductDetailSectionId.info,
      styleId: InfoStyleId.largeTitleStack,
      enabled: true,
      order: 2,
    ),
    ProductDetailSectionEntry(
      sectionId: ProductDetailSectionId.variants,
      styleId: VariantsStyleId.adaptiveChips,
      enabled: true,
      order: 3,
    ),
    ProductDetailSectionEntry(
      sectionId: ProductDetailSectionId.reviews,
      styleId: ReviewsStyleId.ratingSummary,
      enabled: true,
      order: 4,
    ),
  ];

  static const _example2 = [
    ProductDetailSectionEntry(
      sectionId: ProductDetailSectionId.info,
      styleId: InfoStyleId.compactHeader,
      enabled: true,
      order: 1,
    ),
    ProductDetailSectionEntry(
      sectionId: ProductDetailSectionId.media,
      styleId: MediaStyleId.imageCarousel,
      enabled: true,
      order: 2,
    ),
    ProductDetailSectionEntry(
      sectionId: ProductDetailSectionId.reviews,
      styleId: ReviewsStyleId.compactReviewsList,
      enabled: true,
      order: 3,
    ),
    ProductDetailSectionEntry(
      sectionId: ProductDetailSectionId.variants,
      styleId: VariantsStyleId.horizontalScroll,
      enabled: true,
      order: 4,
    ),
  ];

  static const _example3 = [
    ProductDetailSectionEntry(
      sectionId: ProductDetailSectionId.variants,
      styleId: VariantsStyleId.segmentedPills,
      enabled: true,
      order: 1,
    ),
    ProductDetailSectionEntry(
      sectionId: ProductDetailSectionId.info,
      styleId: InfoStyleId.editorialCard,
      enabled: true,
      order: 2,
    ),
    ProductDetailSectionEntry(
      sectionId: ProductDetailSectionId.media,
      styleId: MediaStyleId.swipeGallery,
      enabled: true,
      order: 3,
    ),
    ProductDetailSectionEntry(
      sectionId: ProductDetailSectionId.reviews,
      styleId: ReviewsStyleId.featuredReviewCard,
      enabled: true,
      order: 4,
    ),
  ];

  static const _example4 = [
    ProductDetailSectionEntry(
      sectionId: ProductDetailSectionId.reviews,
      styleId: ReviewsStyleId.reviewTimeline,
      enabled: true,
      order: 1,
    ),
    ProductDetailSectionEntry(
      sectionId: ProductDetailSectionId.media,
      styleId: MediaStyleId.stackedGallery,
      enabled: true,
      order: 2,
    ),
    ProductDetailSectionEntry(
      sectionId: ProductDetailSectionId.variants,
      styleId: VariantsStyleId.cardSelector,
      enabled: true,
      order: 3,
    ),
    ProductDetailSectionEntry(
      sectionId: ProductDetailSectionId.info,
      styleId: InfoStyleId.minimalCentered,
      enabled: true,
      order: 4,
    ),
  ];

  /// Maps legacy combined style ids to current layout preset ids.
  static String resolvePresetId(String presetId) => switch (presetId) {
        'media_info' => mediaInfo,
        'info_variants' => infoVariants,
        'stacked_full' => stackedFull,
        'hero_sheet' => heroSheet,
        'split_composition' => splitComposition,
        _ => presetId,
      };

  static String? descriptionFor(String presetId) =>
      switch (resolvePresetId(presetId)) {
        defaultLayout || example1 => 'Media → Info → Variants → Reviews',
        example2 => 'Info → Media → Reviews → Variants',
        example3 => 'Variants → Info → Media → Reviews',
        example4 => 'Reviews → Media → Variants → Info',
        mediaInfo => 'Media + Info only',
        infoVariants => 'Info + Variants only',
        stackedFull => 'Full stack with reviews',
        variantsFirst => 'Variants first — full four sections',
        heroSheet => 'Hero media with info, variants, reviews',
        splitComposition => 'Split-friendly media, info, variants, reviews',
        _ => null,
      };

  static String orderLabelFor(String presetId) {
    final active = ProductDetailLayoutPresets.sectionsFor(presetId)
        .where((s) => s.enabled)
        .toList()
      ..sort((a, b) => a.order.compareTo(b.order));
    return active.map((s) => s.sectionId).join(' → ');
  }
}
