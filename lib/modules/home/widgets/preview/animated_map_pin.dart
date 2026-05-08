import 'package:flutter/material.dart';

import '../../../../core/constants/app_sizes.dart';

class AnimatedMapPin extends StatelessWidget {
  final double x;
  final double y;

  const AnimatedMapPin({
    super.key,
    required this.x,
    required this.y,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final mapWidth = width * 0.40;
    final mapHeight = AppSizes.h(context, -0.06);

    final mapLeft = (width - mapWidth) / 2;
    final mapTop = AppSizes.h(context, 0.32);

    return AnimatedPositioned(
      duration: const Duration(milliseconds: 500),

      curve: Curves.easeInOut,

      left: mapLeft + (mapWidth * x),

      top: mapTop + (mapHeight * y),

      child: Column(
        children: [
          Icon(
            Icons.location_on,
            size: AppSizes.sp(context, 0.12),
            color: const Color(0xFF6A0D25),
          ),

          Container(
            width: AppSizes.w(context, 0.08),
            height: AppSizes.w(context, 0.08),

            decoration: BoxDecoration(
              shape: BoxShape.circle,

              border: Border.all(
                color: const Color(0xFF6A0D25)
                    .withOpacity(0.18),

                width: 3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}