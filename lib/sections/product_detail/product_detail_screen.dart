import 'package:flutter/material.dart';

import 'config.dart';
import 'layout_engine.dart';

/// Product detail screen — delegates entirely to the layout engine.
class ProductDetailScreen extends StatelessWidget {
  final List<ProductDetailSectionEntry> sections;
  final ScrollPhysics? physics;

  const ProductDetailScreen({
    super.key,
    required this.sections,
    this.physics,
  });

  ProductDetailScreen.fromConfig({
    super.key,
    required ProductDetailLayoutConfig config,
    this.physics,
  }) : sections = config.sections;

  @override
  Widget build(BuildContext context) {
    return ProductDetailLayoutEngine(
      sections: sections,
      physics: physics,
    );
  }
}
