import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../../../design_system/scope/design_system_scope.dart';
import '../location_tokens.dart';

class LocationRibbon extends StatelessWidget {
  const LocationRibbon({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.ds.palette;

    return Padding(
      padding: LocationTokens.sectionPadding(context),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 1,
            color: palette.border.withOpacity(0.6),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: AppSizes.h(context, 0.012)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LocationTokens.pinIcon(context, size: 13),
                SizedBox(width: LocationTokens.gapSm(context)),
                LocationTokens.locationText(context, widthFactor: 0.20),
              ],
            ),
          ),
          Container(
            height: 1,
            color: palette.border.withOpacity(0.6),
          ),
        ],
      ),
    );
  }
}
