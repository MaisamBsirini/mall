import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../core/constants/app_sizes.dart';

class CompassButton extends StatelessWidget {
  const CompassButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 10,
          sigmaY: 10,
        ),

        child: Container(
          width: AppSizes.w(context, 0.1),
          height: AppSizes.w(context, 0.1),

          decoration: BoxDecoration(
            shape: BoxShape.circle,

            color: Colors.white.withOpacity(0.70),

            border: Border.all(
              color: const Color(0xFF6A0D25),
              width: 2,
            ),

            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.10),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),

          child: Icon(
            Icons.explore,
            color: const Color(0xFF6A0D25),
            size: AppSizes.sp(context, 0.07),
          ),
        ),
      ),
    );
  }
}