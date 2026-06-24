import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../../../design_system/scope/design_system_scope.dart';
import '../location_tokens.dart';

class FloatingLocationPill extends StatelessWidget {
  final bool previewExpanded;

  const FloatingLocationPill({
    super.key,
    this.previewExpanded = true,
  });

  @override
  Widget build(BuildContext context) {
    final palette = context.ds.palette;

    return Padding(
      padding: LocationTokens.sectionPadding(context),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          LocationTokens.mockBannerStrip(context),
          Transform.translate(
            offset: Offset(0, -AppSizes.h(context, 0.018)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSizes.w(context, 0.045),
                    vertical: AppSizes.h(context, 0.010),
                  ),
                  decoration: BoxDecoration(
                    color: LocationTokens.surface(context),
                    borderRadius: BorderRadius.circular(999),
                    border: Border.all(color: palette.border),
                    boxShadow: LocationTokens.elevatedShadow(context),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      LocationTokens.pinIcon(context, size: 14),
                      SizedBox(width: LocationTokens.gapSm(context)),
                      LocationTokens.locationText(context, widthFactor: 0.16),
                    ],
                  ),
                ),
                if (previewExpanded) ...[
                  SizedBox(height: LocationTokens.gapSm(context)),
                  LocationTokens.overlayCard(context),
                ],
              ],
            ),
          ),
          SizedBox(height: LocationTokens.gapSm(context)),
          LocationTokens.mockContentStrip(context),
        ],
      ),
    );
  }
}
