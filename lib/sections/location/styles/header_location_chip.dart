import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../../../design_system/scope/design_system_scope.dart';
import '../location_tokens.dart';

class HeaderLocationChip extends StatelessWidget {
  const HeaderLocationChip({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.ds.palette;

    return Padding(
      padding: LocationTokens.sectionPadding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          LocationTokens.textLine(
            context,
            widthFactor: 0.32,
            heightFactor: 0.011,
          ),
          SizedBox(height: LocationTokens.gapSm(context)),
          Row(
            children: [
              LocationTokens.textLine(
                context,
                widthFactor: 0.08,
                heightFactor: 0.008,
              ),
              SizedBox(width: LocationTokens.gapXs(context)),
              Icon(
                Icons.star_rounded,
                size: 14,
                color: palette.accent.withOpacity(0.65),
              ),
            ],
          ),
          SizedBox(height: LocationTokens.gapMd(context)),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppSizes.w(context, 0.035),
              vertical: AppSizes.h(context, 0.009),
            ),
            decoration: BoxDecoration(
              color: palette.primarySoft(0.06),
              borderRadius: LocationTokens.borderSm(context),
              border: Border.all(color: palette.primarySoft(0.12)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                LocationTokens.pinIcon(context, size: 13),
                SizedBox(width: LocationTokens.gapXs(context)),
                LocationTokens.locationText(context, widthFactor: 0.18),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
