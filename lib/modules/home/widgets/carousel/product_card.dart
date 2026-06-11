import 'package:flutter/material.dart';
import 'package:mall/data/models/product_model.dart';

import 'active_product_card.dart';
import 'inactive_product_card.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;

  final bool isActive;

  const ProductCard({
    super.key,
    required this.product,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    if (isActive) {
      return ActiveProductCard(
        product: product,
      );
    }

    return InactiveProductCard(
      product: product,
    );
  }
}