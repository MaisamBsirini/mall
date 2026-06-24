import 'info/styles.dart';
import 'media/styles.dart';
import 'reviews/styles.dart';
import 'variants/styles.dart';

/// Human-readable labels for product detail style previews.
abstract final class ProductDetailStyleDescriptions {
  static const media = {
    MediaStyleId.heroFullWidth: 'Hero image with floating pill indicators',
    MediaStyleId.imageCarousel: 'Rounded carousel with elegant pagination',
    MediaStyleId.swipeGallery: 'Large preview + horizontal thumbnail strip',
    MediaStyleId.stackedGallery: 'Partially stacked cards with depth effect',
    MediaStyleId.cardGallery: 'Floating overlapping cards with soft shadows',
  };

  static const info = {
    InfoStyleId.largeTitleStack: 'Large title, category chip, description stack',
    InfoStyleId.compactHeader: 'Compact inline title and category row',
    InfoStyleId.overlayInfo: 'Info card overlay on media block',
    InfoStyleId.editorialCard: 'Editorial card with divider hierarchy',
    InfoStyleId.minimalCentered: 'Minimal centered typography',
  };

  static const variants = {
    VariantsStyleId.adaptiveChips: 'Soft pills — animated shadow on selection',
    VariantsStyleId.horizontalScroll: 'Horizontal scroll with active indicator bar',
    VariantsStyleId.cardSelector: 'Mini elevated cards with selection lift',
    VariantsStyleId.segmentedPills: 'Premium segmented control with sliding panel',
    VariantsStyleId.expandableList: 'Expandable panels with option grid',
  };

  static const reviews = {
    ReviewsStyleId.ratingSummary: 'Star rating with distribution summary',
    ReviewsStyleId.compactReviewsList: 'Compact stacked review cards',
    ReviewsStyleId.featuredReviewCard: 'Single featured review highlight',
    ReviewsStyleId.reviewTimeline: 'Editorial timeline with review nodes',
    ReviewsStyleId.minimalRatingStrip: 'Minimal tappable rating strip',
  };

  static String? forSection(String sectionId, String styleId) {
    return switch (sectionId) {
      'media' => media[styleId],
      'info' => info[styleId],
      'variants' => variants[styleId],
      'reviews' => reviews[styleId],
      _ => null,
    };
  }
}
