import 'package:flutter/material.dart';

import '../location_tokens.dart';

/// Top-left compact chip overlay on banner.
class HeaderLocationChip extends StatelessWidget {
  const HeaderLocationChip({super.key});

  @override
  Widget build(BuildContext context) {
    return LocationTokens.bannerWithOverlay(
      context,
      alignment: Alignment.topLeft,
      overlay: LocationTokens.glassChip(
        context,
        padding: EdgeInsets.symmetric(
          horizontal: LocationTokens.gapSm(context),
          vertical: LocationTokens.gapXs(context),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            LocationTokens.pinDot(context, size: 8),
            SizedBox(width: LocationTokens.gapXs(context)),
            LocationTokens.textLine(context, widthFactor: 0.11, heightFactor: 0.005),
          ],
        ),
      ),
    );
  }
}
