import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../../../design_system/scope/design_system_scope.dart';
import '../banner_tokens.dart';

class MinimalBanner extends StatelessWidget {
  const MinimalBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.ds.palette;

    return Padding(
      padding: BannerTokens.sectionPadding(context),
      child: Container(
        padding: EdgeInsets.all(AppSizes.w(context, 0.04)),
        decoration: BoxDecoration(
          color: palette.surface,
          borderRadius: BannerTokens.borderMd(context),
          border: Border(
            left: BorderSide(
              color: palette.primary,
              width: 4,
            ),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BannerTokens.textLine(
                    context,
                    widthFactor: 0.12,
                  ),
                  SizedBox(height: BannerTokens.gapXs(context)),
                  BannerTokens.textLine(
                    context,
                    widthFactor: 0.38,
                    heightFactor: 0.010,
                  ),
                  SizedBox(height: BannerTokens.gapSm(context)),
                  BannerTokens.textLine(
                    context,
                    widthFactor: 0.30,
                  ),
                  SizedBox(height: BannerTokens.gapMd(context)),
                  Row(
                    children: [
                      BannerTokens.textLine(
                        context,
                        widthFactor: 0.16,
                        heightFactor: 0.007,
                      ),
                      SizedBox(width: BannerTokens.gapXs(context)),
                      Icon(
                        Icons.arrow_forward,
                        size: AppSizes.sp(context, 0.034),
                        color: palette.primary,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(width: BannerTokens.gapMd(context)),
            BannerTokens.placeholderBox(
              context,
              width: AppSizes.w(context, 0.20),
              height: AppSizes.w(context, 0.20),
              borderRadius: BannerTokens.borderSm(context),
              color: palette.placeholderMuted,
            ),
          ],
        ),
      ),
    );
  }
}
