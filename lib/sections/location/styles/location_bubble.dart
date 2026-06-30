import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../location_tokens.dart';

/// Bottom-right FAB-style circle on banner.
class LocationBubble extends StatelessWidget {
  const LocationBubble({super.key});

  @override
  Widget build(BuildContext context) {
    final size = AppSizes.w(context, 0.09);

    return LocationTokens.bannerWithOverlay(
      context,
      alignment: Alignment.bottomRight,
      overlay: LocationTokens.fabCircle(
        context,
        size: size,
        child: LocationTokens.pinDot(context, size: 12),
      ),
    );
  }
}
