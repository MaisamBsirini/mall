import 'package:flutter/material.dart';
import 'package:mall/data/models/product_model.dart';

import '../../../../core/constants/app_sizes.dart';
import 'card_frame.dart';
import 'floating_product_image.dart';

class InactiveProductCard
    extends StatelessWidget {
  final ProductModel product;

  const InactiveProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: AppSizes.h(context, 0.08),
      ),

      child: Transform.scale(
        scale: 0.82,

        child: Transform.rotate(
          angle: -0.08,

          child: Opacity(
            opacity: 0.45,

            child: CardFrame(
              child: Padding(
                padding: EdgeInsets.all(
                  AppSizes.w(context, 0.04),
                ),

                child: Center(
                  child:
                      FloatingProductImage(
                    image:
                        product.imagePng,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}