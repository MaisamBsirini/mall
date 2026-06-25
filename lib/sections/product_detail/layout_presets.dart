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
      mediaInfo => [
          ProductDetailSectionEntry.layout(
            id: ProductDetailSectionId.media,
            style: MediaStyleId.heroFullWidth,
            enabled: true,
            order: 1,
          ),
          ProductDetailSectionEntry.layout(
            id: ProductDetailSectionId.info,
            style: InfoStyleId.largeTitleStack,
            enabled: true,
            order: 2,
          ),
          ProductDetailSectionEntry.layout(
            id: ProductDetailSectionId.variants,
            style: VariantsStyleId.adaptiveChips,
            enabled: false,
            order: 3,
          ),
          ProductDetailSectionEntry.layout(
            id: ProductDetailSectionId.reviews,
            style: ReviewsStyleId.ratingSummary,
            enabled: false,
            order: 4,
          ),
        ],
      infoVariants => [
          ProductDetailSectionEntry.layout(
            id: ProductDetailSectionId.info,
            style: InfoStyleId.compactHeader,
            enabled: true,
            order: 1,
          ),
          ProductDetailSectionEntry.layout(
            id: ProductDetailSectionId.variants,
            style: VariantsStyleId.adaptiveChips,
            enabled: true,
            order: 2,
          ),
          ProductDetailSectionEntry.layout(
            id: ProductDetailSectionId.media,
            style: MediaStyleId.heroFullWidth,
            enabled: false,
            order: 3,
          ),
          ProductDetailSectionEntry.layout(
            id: ProductDetailSectionId.reviews,
            style: ReviewsStyleId.compactReviewsList,
            enabled: false,
            order: 4,
          ),
        ],
      stackedFull => [
          ProductDetailSectionEntry.layout(
            id: ProductDetailSectionId.media,
            style: MediaStyleId.imageCarousel,
            enabled: true,
            order: 1,
          ),
          ProductDetailSectionEntry.layout(
            id: ProductDetailSectionId.info,
            style: InfoStyleId.largeTitleStack,
            enabled: true,
            order: 2,
          ),
          ProductDetailSectionEntry.layout(
            id: ProductDetailSectionId.variants,
            style: VariantsStyleId.horizontalScroll,
            enabled: true,
            order: 3,
          ),
          ProductDetailSectionEntry.layout(
            id: ProductDetailSectionId.reviews,
            style: ReviewsStyleId.featuredReviewCard,
            enabled: true,
            order: 4,
          ),
        ],
      variantsFirst => [
          ProductDetailSectionEntry.layout(
            id: ProductDetailSectionId.variants,
            style: VariantsStyleId.segmentedPills,
            enabled: true,
            order: 1,
          ),
          ProductDetailSectionEntry.layout(
            id: ProductDetailSectionId.media,
            style: MediaStyleId.swipeGallery,
            enabled: true,
            order: 2,
          ),
          ProductDetailSectionEntry.layout(
            id: ProductDetailSectionId.info,
            style: InfoStyleId.editorialCard,
            enabled: true,
            order: 3,
          ),
          ProductDetailSectionEntry.layout(
            id: ProductDetailSectionId.reviews,
            style: ReviewsStyleId.reviewTimeline,
            enabled: true,
            order: 4,
          ),
        ],
      heroSheet => [
          ProductDetailSectionEntry.layout(
            id: ProductDetailSectionId.media,
            style: MediaStyleId.heroFullWidth,
            enabled: true,
            order: 1,
          ),
          ProductDetailSectionEntry.layout(
            id: ProductDetailSectionId.info,
            style: InfoStyleId.compactHeader,
            enabled: true,
            order: 2,
          ),
          ProductDetailSectionEntry.layout(
            id: ProductDetailSectionId.variants,
            style: VariantsStyleId.adaptiveChips,
            enabled: true,
            order: 3,
          ),
          ProductDetailSectionEntry.layout(
            id: ProductDetailSectionId.reviews,
            style: ReviewsStyleId.minimalRatingStrip,
            enabled: true,
            order: 4,
          ),
        ],
      splitComposition => [
          ProductDetailSectionEntry.layout(
            id: ProductDetailSectionId.media,
            style: MediaStyleId.swipeGallery,
            enabled: true,
            order: 1,
          ),
          ProductDetailSectionEntry.layout(
            id: ProductDetailSectionId.info,
            style: InfoStyleId.compactHeader,
            enabled: true,
            order: 2,
          ),
          ProductDetailSectionEntry.layout(
            id: ProductDetailSectionId.variants,
            style: VariantsStyleId.horizontalScroll,
            enabled: true,
            order: 3,
          ),
          ProductDetailSectionEntry.layout(
            id: ProductDetailSectionId.reviews,
            style: ReviewsStyleId.ratingSummary,
            enabled: true,
            order: 4,
          ),
        ],
      _ => _example1,
    };
  }

  static final _example1 = [
    ProductDetailSectionEntry.layout(
      id: ProductDetailSectionId.media,
      style: MediaStyleId.heroFullWidth,
      enabled: true,
      order: 1,
    ),
    ProductDetailSectionEntry.layout(
      id: ProductDetailSectionId.info,
      style: InfoStyleId.largeTitleStack,
      enabled: true,
      order: 2,
    ),
    ProductDetailSectionEntry.layout(
      id: ProductDetailSectionId.variants,
      style: VariantsStyleId.adaptiveChips,
      enabled: true,
      order: 3,
    ),
    ProductDetailSectionEntry.layout(
      id: ProductDetailSectionId.reviews,
      style: ReviewsStyleId.ratingSummary,
      enabled: true,
      order: 4,
    ),
  ];

  static final _example2 = [
    ProductDetailSectionEntry.layout(
      id: ProductDetailSectionId.info,
      style: InfoStyleId.compactHeader,
      enabled: true,
      order: 1,
    ),
    ProductDetailSectionEntry.layout(
      id: ProductDetailSectionId.media,
      style: MediaStyleId.imageCarousel,
      enabled: true,
      order: 2,
    ),
    ProductDetailSectionEntry.layout(
      id: ProductDetailSectionId.reviews,
      style: ReviewsStyleId.compactReviewsList,
      enabled: true,
      order: 3,
    ),
    ProductDetailSectionEntry.layout(
      id: ProductDetailSectionId.variants,
      style: VariantsStyleId.horizontalScroll,
      enabled: true,
      order: 4,
    ),
  ];

  static final _example3 = [
    ProductDetailSectionEntry.layout(
      id: ProductDetailSectionId.variants,
      style: VariantsStyleId.segmentedPills,
      enabled: true,
      order: 1,
    ),
    ProductDetailSectionEntry.layout(
      id: ProductDetailSectionId.info,
      style: InfoStyleId.editorialCard,
      enabled: true,
      order: 2,
    ),
    ProductDetailSectionEntry.layout(
      id: ProductDetailSectionId.media,
      style: MediaStyleId.swipeGallery,
      enabled: true,
      order: 3,
    ),
    ProductDetailSectionEntry.layout(
      id: ProductDetailSectionId.reviews,
      style: ReviewsStyleId.featuredReviewCard,
      enabled: true,
      order: 4,
    ),
  ];

  static final _example4 = [
    ProductDetailSectionEntry.layout(
      id: ProductDetailSectionId.reviews,
      style: ReviewsStyleId.reviewTimeline,
      enabled: true,
      order: 1,
    ),
    ProductDetailSectionEntry.layout(
      id: ProductDetailSectionId.media,
      style: MediaStyleId.stackedGallery,
      enabled: true,
      order: 2,
    ),
    ProductDetailSectionEntry.layout(
      id: ProductDetailSectionId.variants,
      style: VariantsStyleId.cardSelector,
      enabled: true,
      order: 3,
    ),
    ProductDetailSectionEntry.layout(
      id: ProductDetailSectionId.info,
      style: InfoStyleId.minimalCentered,
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
    return active.map((s) => s.id).join(' → ');
  }
}
