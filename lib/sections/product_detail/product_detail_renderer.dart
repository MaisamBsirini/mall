import 'package:flutter/material.dart';

import '../../design_system/merchant_design_config.dart';
import '../../design_system/scope/design_system_scope.dart';
import 'config.dart';
import 'layout_engine.dart';

/// Renders product detail using the store-level [design] (palette + typography)
/// and a separate layout payload ([layout]) with sections only.
class ProductDetailRenderer extends StatelessWidget {
  final MerchantDesignConfig design;
  final ProductDetailLayoutConfig layout;
  final ScrollPhysics? physics;

  const ProductDetailRenderer({
    super.key,
    required this.design,
    required this.layout,
    this.physics,
  });

  /// Builds from storefront customize (design) + product detail customize (sections).
  factory ProductDetailRenderer.fromStoreCustomize({
    Key? key,
    required MerchantDesignConfig storeDesign,
    required ProductDetailLayoutConfig productLayout,
    ScrollPhysics? physics,
  }) {
    return ProductDetailRenderer(
      key: key,
      design: storeDesign,
      layout: productLayout,
      physics: physics,
    );
  }

  @override
  Widget build(BuildContext context) {
    return DesignSystemScope.fromConfig(
      config: design,
      child: Builder(
        builder: (context) {
          return ColoredBox(
            color: context.ds.palette.background,
            child: ProductDetailLayoutEngine.fromConfig(
              config: layout,
              physics: physics,
            ),
          );
        },
      ),
    );
  }
}
