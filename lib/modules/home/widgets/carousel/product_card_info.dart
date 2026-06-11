import 'package:flutter/material.dart';
import 'package:mall/data/models/product_model.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';

class ProductCardInfo
    extends StatelessWidget {
  final ProductModel product;

  const ProductCardInfo({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,

      children: [
        Text(
          product.name,
          textAlign: TextAlign.center,

          style: TextStyle(
            color: AppColors.primary,

            fontWeight: FontWeight.w500,

            fontSize: AppSizes.sp(
              context,
              0.055,
            ),
          ),
        ),

        SizedBox(
          height: AppSizes.h(context, 0.012),
        ),

        Text(
          "AED ${product.price.toInt()}",
          style: TextStyle(
            color: AppColors.primary,

            fontWeight: FontWeight.bold,

            fontSize: AppSizes.sp(
              context,
              0.065,
            ),
          ),
        ),

        SizedBox(
          height: AppSizes.h(context, 0.012),
        ),

        Row(
          mainAxisAlignment:
              MainAxisAlignment.center,

          children: [
            ...List.generate(
              5,
              (index) => Icon(
                Icons.star,
                color: AppColors.primary,
                size: AppSizes.w(
                  context,
                  0.045,
                ),
              ),
            ),

            SizedBox(
              width: AppSizes.w(
                context,
                0.02,
              ),
            ),

            Text(
              product.rating.toString(),

              style: TextStyle(
                color: Colors.grey.shade700,

                fontWeight:
                    FontWeight.w500,

                fontSize: AppSizes.sp(
                  context,
                  0.045,
                ),
              ),
            ),
          ],
        ),

        SizedBox(
          height: AppSizes.h(context, 0.025),
        ),

        Container(
          padding: EdgeInsets.symmetric(
            horizontal:
                AppSizes.w(context, 0.07),

            vertical:
                AppSizes.h(context, 0.012),
          ),

          decoration: BoxDecoration(
            color:
                AppColors.primary.withOpacity(
              0.08,
            ),

            borderRadius:
                BorderRadius.circular(30),
          ),

          child: Text(
            "View",

            style: TextStyle(
              color: AppColors.primary,

              fontWeight:
                  FontWeight.w500,

              fontSize: AppSizes.sp(
                context,
                0.05,
              ),
            ),
          ),
        ),
      ],
    );
  }
}