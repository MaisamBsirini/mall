import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../core/constants/app_sizes.dart';

class StoreBackground extends StatelessWidget {
  final String image;

  const StoreBackground({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Stack(
        fit: StackFit.expand,
        children: [
          /// خلفية المول ثلاثية الأبعاد
          Image.asset(
            "lib/assets/images/Gemini_Generated_Image_ordx16ordx16ordx.PNG",
            fit: BoxFit.fitWidth,
          ),

          /// ضباب خفيف فوق البيئة
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: Container(color: Colors.white.withOpacity(0.005)),
          ),
        ],
      ),
    );
  }
}
