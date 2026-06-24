import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../../../design_system/scope/design_system_scope.dart';
import '../location_tokens.dart';

class CornerLocationBadge extends StatelessWidget {
  final bool previewExpanded;

  const CornerLocationBadge({
    super.key,
    this.previewExpanded = false,
  });

  @override
  Widget build(BuildContext context) {
    final palette = context.ds.palette;

    return Padding(
      padding: LocationTokens.sectionPadding(context),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          LocationTokens.mockBannerStrip(context),
          Positioned(
            top: AppSizes.h(context, 0.012),
            right: AppSizes.w(context, 0.03),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.w(context, 0.028),
                vertical: AppSizes.h(context, 0.008),
              ),
              decoration: BoxDecoration(
                color: palette.glassFill,
                borderRadius: LocationTokens.borderLg(context),
                border: Border.all(color: palette.glassBorder),
                boxShadow: LocationTokens.cardShadow(context),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  LocationTokens.pinIcon(context, size: 13),
                  SizedBox(width: LocationTokens.gapXs(context)),
                  LocationTokens.locationText(context, widthFactor: 0.14),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
