import 'package:flutter/material.dart';

import '../../../design_system/scope/design_system_scope.dart';
import '../location_tokens.dart';

/// Soft ribbon strip along the bottom edge inside the banner.
class LocationRibbon extends StatelessWidget {
  const LocationRibbon({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.ds.palette;

    return LocationTokens.bannerWithOverlay(
      context,
      alignment: Alignment.bottomCenter,
      overlayPadding: EdgeInsets.zero,
      overlay: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          vertical: LocationTokens.gapXs(context),
        ),
        decoration: BoxDecoration(
          color: palette.glassFill,
          border: Border(
            top: BorderSide(color: palette.glassBorder),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            LocationTokens.pinDot(context, size: 8),
            SizedBox(width: LocationTokens.gapXs(context)),
            LocationTokens.textLine(context, widthFactor: 0.14, heightFactor: 0.005),
          ],
        ),
      ),
    );
  }
}
