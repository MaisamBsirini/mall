import 'package:flutter/material.dart';

import '../location_tokens.dart';

/// Bottom-center pill overlay on banner.
class FloatingLocationPill extends StatelessWidget {
  const FloatingLocationPill({super.key});

  @override
  Widget build(BuildContext context) {
    return LocationTokens.bannerWithOverlay(
      context,
      alignment: Alignment.bottomCenter,
      overlayPadding: EdgeInsets.only(bottom: LocationTokens.gapSm(context)),
      overlay: LocationTokens.glassChip(
        context,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            LocationTokens.pinDot(context, size: 9),
            SizedBox(width: LocationTokens.gapXs(context)),
            LocationTokens.textLine(context, widthFactor: 0.12, heightFactor: 0.006),
          ],
        ),
      ),
    );
  }
}
