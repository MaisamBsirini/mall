import 'package:flutter/material.dart';

import '../location_tokens.dart';

/// Top-right glass chip overlay on banner.
class CornerLocationBadge extends StatelessWidget {
  const CornerLocationBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return LocationTokens.bannerWithOverlay(
      context,
      alignment: Alignment.topRight,
      overlay: LocationTokens.glassChip(
        context,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            LocationTokens.pinDot(context, size: 9),
            SizedBox(width: LocationTokens.gapXs(context)),
            LocationTokens.textLine(context, widthFactor: 0.10, heightFactor: 0.006),
          ],
        ),
      ),
    );
  }
}
