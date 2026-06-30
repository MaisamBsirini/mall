import 'package:flutter/material.dart';

import '../../design_system/merchant_design_config.dart';
import 'config.dart';
import 'product_detail_renderer.dart';

/// Product detail screen — design from store customize, layout from product detail customize.
class ProductDetailScreen extends StatelessWidget {
  final MerchantDesignConfig design;
  final ProductDetailLayoutConfig layout;
  final ScrollPhysics? physics;

  const ProductDetailScreen({
    super.key,
    required this.design,
    required this.layout,
    this.physics,
  });

  ProductDetailScreen.fromStoreCustomize({
    super.key,
    required MerchantDesignConfig storeDesign,
    required ProductDetailLayoutConfig productLayout,
    this.physics,
  })  : design = storeDesign,
        layout = productLayout;

  @override
  Widget build(BuildContext context) {
    return ProductDetailRenderer(
      design: design,
      layout: layout,
      physics: physics,
    );
  }
}
