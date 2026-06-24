import 'package:flutter/material.dart';

/// How aggressively the product detail variant placeholders should render.
enum DemoVariantProfile {
  /// 0 attribute groups
  none,

  /// 1 group, few options
  single,

  /// 3 groups — standard density
  standard,

  /// 6 groups — dense layout stress test
  many,

  /// 4 groups with long placeholder labels (dense)
  longLabels,

  /// 1 group, minimal labels
  shortLabels,
}

/// Temporary local product — not a production model.
class DemoProduct {
  final String id;
  final String name;
  final String categoryId;
  final String collectionId;
  final double price;
  final double rating;
  final Color accent;
  final DemoVariantProfile variantProfile;
  final List<DemoReview> reviews;

  const DemoProduct({
    required this.id,
    required this.name,
    required this.categoryId,
    required this.collectionId,
    required this.price,
    required this.rating,
    required this.accent,
    required this.variantProfile,
    required this.reviews,
  });

  String get formattedPrice => '\$${price.toStringAsFixed(2)}';
}

class DemoReview {
  final String reviewerName;
  final int rating;
  final String comment;

  const DemoReview({
    required this.reviewerName,
    required this.rating,
    required this.comment,
  });
}

/// Fake product catalog — no API, no persistence.
abstract final class DemoProducts {
  static final List<DemoProduct> all = [
    DemoProduct(
      id: 'p_001',
      name: 'Hydra Renewal Serum',
      categoryId: 'cat_skincare',
      collectionId: 'col_bestsellers',
      price: 48.00,
      rating: 4.8,
      accent: const Color(0xFFE8B4B8),
      variantProfile: DemoVariantProfile.many,
      reviews: _reviewsLong,
    ),
    DemoProduct(
      id: 'p_002',
      name: 'Silk Finish Moisturizer',
      categoryId: 'cat_skincare',
      collectionId: 'col_new',
      price: 36.50,
      rating: 4.6,
      accent: const Color(0xFFD4A5A5),
      variantProfile: DemoVariantProfile.single,
      reviews: _reviewsShort,
    ),
    DemoProduct(
      id: 'p_003',
      name: 'Vitamin C Brightening Drops',
      categoryId: 'cat_skincare',
      collectionId: 'col_bestsellers',
      price: 52.00,
      rating: 4.9,
      accent: const Color(0xFFF5C6AA),
      variantProfile: DemoVariantProfile.standard,
      reviews: _reviewsMixed,
    ),
    DemoProduct(
      id: 'p_004',
      name: 'Aromatherapy Body Oil',
      categoryId: 'cat_wellness',
      collectionId: 'col_spa',
      price: 29.00,
      rating: 4.4,
      accent: const Color(0xFFC9B8A8),
      variantProfile: DemoVariantProfile.none,
      reviews: _reviewsShort,
    ),
    DemoProduct(
      id: 'p_005',
      name: 'Deep Tissue Massage Session',
      categoryId: 'cat_wellness',
      collectionId: 'col_spa',
      price: 95.00,
      rating: 5.0,
      accent: const Color(0xFFB8C9A8),
      variantProfile: DemoVariantProfile.longLabels,
      reviews: _reviewsLong,
    ),
    DemoProduct(
      id: 'p_006',
      name: 'Rose Oud Eau de Parfum',
      categoryId: 'cat_fragrance',
      collectionId: 'col_gifts',
      price: 118.00,
      rating: 4.7,
      accent: const Color(0xFFD8A8C9),
      variantProfile: DemoVariantProfile.shortLabels,
      reviews: _reviewsMixed,
    ),
    DemoProduct(
      id: 'p_007',
      name: 'Citrus Veil Body Mist',
      categoryId: 'cat_fragrance',
      collectionId: 'col_new',
      price: 34.00,
      rating: 4.3,
      accent: const Color(0xFFE8D4A8),
      variantProfile: DemoVariantProfile.single,
      reviews: _reviewsShort,
    ),
    DemoProduct(
      id: 'p_008',
      name: 'Ceramic Gua Sha Tool',
      categoryId: 'cat_tools',
      collectionId: 'col_bestsellers',
      price: 24.00,
      rating: 4.5,
      accent: const Color(0xFFB8B8C9),
      variantProfile: DemoVariantProfile.none,
      reviews: _reviewsMixed,
    ),
    DemoProduct(
      id: 'p_009',
      name: 'Jade Facial Roller Pro',
      categoryId: 'cat_tools',
      collectionId: 'col_gifts',
      price: 32.00,
      rating: 4.2,
      accent: const Color(0xFFA8C9B8),
      variantProfile: DemoVariantProfile.standard,
      reviews: _reviewsShort,
    ),
    DemoProduct(
      id: 'p_010',
      name: 'Overnight Recovery Mask',
      categoryId: 'cat_skincare',
      collectionId: 'col_new',
      price: 44.00,
      rating: 4.6,
      accent: const Color(0xFFC9A8D8),
      variantProfile: DemoVariantProfile.many,
      reviews: _reviewsLong,
    ),
  ];

  static List<DemoProduct> forCategory(String categoryId) =>
      all.where((p) => p.categoryId == categoryId).toList();

  static List<DemoProduct> forCollection(String collectionId) =>
      all.where((p) => p.collectionId == collectionId).toList();

  static DemoProduct? findById(String id) {
    for (final product in all) {
      if (product.id == id) return product;
    }
    return null;
  }

  static const _reviewsShort = [
    DemoReview(
      reviewerName: 'Maya K.',
      rating: 5,
      comment: 'Love it.',
    ),
    DemoReview(
      reviewerName: 'Jonas P.',
      rating: 4,
      comment: 'Great quality.',
    ),
  ];

  static const _reviewsMixed = [
    DemoReview(
      reviewerName: 'Elena R.',
      rating: 5,
      comment: 'Exactly what I needed for my evening routine.',
    ),
    DemoReview(
      reviewerName: 'Chris D.',
      rating: 3,
      comment: 'Good, but shipping took a while.',
    ),
    DemoReview(
      reviewerName: 'Aisha N.',
      rating: 5,
      comment: 'Repurchasing for the third time.',
    ),
  ];

  static const _reviewsLong = [
    DemoReview(
      reviewerName: 'Victoria S.',
      rating: 5,
      comment:
          'The texture is incredibly lightweight and absorbs within seconds. '
          'I noticed a visible difference in hydration after one week of daily use.',
    ),
    DemoReview(
      reviewerName: 'Daniel M.',
      rating: 4,
      comment:
          'Packaging feels premium and the scent is subtle. Would recommend '
          'for anyone with combination skin looking for a daily staple.',
    ),
    DemoReview(
      reviewerName: 'Priya L.',
      rating: 5,
      comment: 'Outstanding results. My skin feels smoother and more even.',
    ),
  ];
}
