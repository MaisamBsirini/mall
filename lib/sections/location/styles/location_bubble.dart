import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../../../design_system/scope/design_system_scope.dart';
import '../location_tokens.dart';

class LocationBubble extends StatelessWidget {
  final bool previewExpanded;

  const LocationBubble({
    super.key,
    this.previewExpanded = true,
  });

  @override
  Widget build(BuildContext context) {
    final palette = context.ds.palette;
    final bubbleSize = AppSizes.w(context, 0.11);

    return Padding(
      padding: LocationTokens.sectionPadding(context),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          LocationTokens.mockBannerStrip(context),
          SizedBox(height: LocationTokens.gapSm(context)),
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              if (previewExpanded)
                Positioned(
                  top: bubbleSize + LocationTokens.gapSm(context),
                  child: LocationTokens.overlayCard(context),
                ),
              Container(
                width: bubbleSize,
                height: bubbleSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: LocationTokens.surface(context),
                  border: Border.all(color: palette.primarySoft(0.20)),
                  boxShadow: LocationTokens.elevatedShadow(context),
                ),
                child: Center(
                  child: LocationTokens.pinIcon(context, size: 20),
                ),
              ),
            ],
          ),
          SizedBox(height: previewExpanded ? AppSizes.h(context, 0.10) : 0),
          LocationTokens.mockContentStrip(context),
        ],
      ),
    );
  }
}
