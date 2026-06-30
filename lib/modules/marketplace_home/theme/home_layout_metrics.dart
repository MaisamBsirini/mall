import 'package:flutter/material.dart';

/// Screen-proportional spacing — equal gaps, no vertical scroll.
class HomeLayoutMetrics {
  final double width;
  final double height;
  final double bottomInset;

  HomeLayoutMetrics.of(BuildContext context)
      : width = MediaQuery.sizeOf(context).width,
        height = MediaQuery.sizeOf(context).height,
        bottomInset = MediaQuery.paddingOf(context).bottom;

  /// Gap: search ↔ banner, recent ↔ nav.
  double get sectionGap => _h(0.032, min: 14, max: 18);

  /// Gap: banner ↔ categories.
  double get gapAfterBanner => _h(0.032, min: 22, max: 32);

  /// Gap: categories ↔ recently watched.
  double get gapAfterCategories => _h(0.032, min: 22, max: 32);

  double get topBreathing => _h(0.03, min: 12, max: 20);

  double get horizontalPad => width * 0.045;

  double get navBarHeight => (width * 0.172).clamp(66.0, 76.0);

  double get navBottomLift =>
      (width * 0.048).clamp(16.0, 24.0) + bottomInset * 0.55;

  /// Total space reserved under content (gap + floating nav + lift from bottom).
  double get bottomClearance => sectionGap + navBarHeight + navBottomLift;

  double get estimateTopBarHeight => (width * 0.105).clamp(40.0, 44.0);

  double get estimateBannerBlockHeight =>
      (width * 0.4).clamp(128.0, 158.0) + width * 0.032 + 8;

  double get estimateCategoriesBlockHeight {
    final cardSize = (width * 0.132).clamp(54.0, 62.0);
    return 24 + width * 0.032 + cardSize + 32;
  }

  double get recentHeaderBlock => 24 + width * 0.025;

  double computeRecentCardHeight(double viewportHeight) {
    final cardWidth = (width * 0.278).clamp(108.0, 130.0);
    final consumed = topBreathing +
        estimateTopBarHeight +
        sectionGap +
        estimateBannerBlockHeight +
        gapAfterBanner +
        estimateCategoriesBlockHeight +
        gapAfterCategories +
        recentHeaderBlock +
        bottomClearance;

    return (viewportHeight - consumed).clamp(cardWidth * 1.12, cardWidth * 1.38);
  }

  double _h(double factor, {required double min, required double max}) =>
      (height * factor).clamp(min, max);
}
