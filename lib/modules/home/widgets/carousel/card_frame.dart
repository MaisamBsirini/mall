import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class CardFrame extends StatelessWidget {
  final Widget child;

  const CardFrame({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius:
            BorderRadius.circular(34),

        border: Border.all(
          color:
              AppColors.primary.withOpacity(
            0.75,
          ),
          width: 1.4,
        ),

        boxShadow: [
          BoxShadow(
            color:
                AppColors.primary.withOpacity(
              0.10,
            ),
            blurRadius: 30,
            offset: const Offset(0, 18),
          ),
        ],
      ),

      child: child,
    );
  }
}