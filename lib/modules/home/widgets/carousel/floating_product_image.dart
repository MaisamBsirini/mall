import 'package:flutter/material.dart';

import '../../../../core/constants/app_sizes.dart';

class FloatingProductImage
    extends StatelessWidget {
  final String image;

  const FloatingProductImage({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(
        0,
        -AppSizes.h(context, 0.03),
      ),

      child: Container(
        width: AppSizes.w(context, 0.42),
        height: AppSizes.h(context, 0.28),

        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(
                0.18,
              ),
              blurRadius: 35,
              offset: const Offset(0, 28),
            ),
          ],
        ),

        child: Image.network(
          image,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}