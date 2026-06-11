import 'package:flutter/material.dart';
import 'package:mall/data/models/product_model.dart';

import '../../../../core/constants/app_sizes.dart';
import 'card_frame.dart';
import 'floating_product_image.dart';
import 'product_card_info.dart';

class ActiveProductCard
    extends StatelessWidget {
  final ProductModel product;

  const ActiveProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: AppSizes.h(context, 0.05),
      ),

      child: Transform.scale(
        scale: 1,

        child: CardFrame(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal:
                  AppSizes.w(context, 0.04),

              vertical:
                  AppSizes.h(context, 0.03),
            ),

            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,

                  child: Container(
                    width:
                        AppSizes.w(context, 0.11),

                    height:
                        AppSizes.w(context, 0.11),

                    decoration: BoxDecoration(
                      shape: BoxShape.circle,

                      color: Colors.white,

                      boxShadow: [
                        BoxShadow(
                          color: Colors.black
                              .withOpacity(0.08),

                          blurRadius: 14,
                        ),
                      ],
                    ),

                    child: const Icon(
                      Icons.favorite,
                      color: Color(0xFF6B1E2E),
                    ),
                  ),
                ),

                const Spacer(),

                FloatingProductImage(
                  image: product.imagePng,
                ),

                SizedBox(
                  height:
                      AppSizes.h(context, 0.02),
                ),

                ProductCardInfo(
                  product: product,
                ),

                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}