import 'package:flutter/material.dart';

import '../../reviews/renderer.dart';

/// Product detail reviews reuse the storefront reviews UI — style only, data later.
abstract final class ReviewsSectionRenderer {
  static const sectionId = 'reviews';

  static Widget build(String styleId) {
    return ReviewsRenderer.fromStyleId(styleId: styleId);
  }
}
