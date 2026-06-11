import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../../../design_system/scope/design_system_scope.dart';
import '../banner_tokens.dart';

class ModernBanner extends StatelessWidget {
  const ModernBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final bannerHeight = AppSizes.h(context, 0.22);
    final palette = context.ds.palette;
    final tokens = context.ds.tokens;

    return Padding(
      padding: BannerTokens.sectionPadding(context),
      child: SizedBox(
        height: bannerHeight,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 11,
                  child: Container(
                    padding: EdgeInsets.all(AppSizes.w(context, 0.045)),
                    decoration: BoxDecoration(
                      color: palette.primary,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(tokens.radiusMd),
                        bottomLeft: Radius.circular(tokens.radiusMd),
                        topRight: Radius.circular(tokens.radiusSm),
                        bottomRight: Radius.circular(tokens.radiusSm),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BannerTokens.textLine(
                          context,
                          widthFactor: 0.14,
                          heightFactor: 0.006,
                        ),
                        SizedBox(height: BannerTokens.gapSm(context)),
                        BannerTokens.textLine(
                          context,
                          widthFactor: 0.36,
                          heightFactor: 0.010,
                        ),
                        SizedBox(height: BannerTokens.gapSm(context)),
                        BannerTokens.ctaPill(context, onDark: true),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 9,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: BannerTokens.placeholderGradient(context),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(tokens.radiusMd),
                        bottomRight: Radius.circular(tokens.radiusMd),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: -AppSizes.h(context, 0.012),
              right: AppSizes.w(context, 0.06),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.w(context, 0.03),
                  vertical: AppSizes.h(context, 0.006),
                ),
                decoration: BoxDecoration(
                  color: palette.surface,
                  borderRadius: BannerTokens.borderLg(context),
                  boxShadow: tokens.cardShadow(context),
                ),
                child: BannerTokens.textLine(
                  context,
                  widthFactor: 0.08,
                  heightFactor: 0.006,
                ),
              ),
            ),
            Positioned(
              right: AppSizes.w(context, 0.02),
              bottom: -AppSizes.h(context, 0.018),
              child: BannerTokens.placeholderBox(
                context,
                width: AppSizes.w(context, 0.22),
                height: AppSizes.w(context, 0.22),
                borderRadius: BannerTokens.borderLg(context),
                color: palette.surface,
              ),
            ),
            Positioned(
              right: AppSizes.w(context, 0.14),
              top: AppSizes.h(context, 0.04),
              child: BannerTokens.placeholderBox(
                context,
                width: AppSizes.w(context, 0.14),
                height: AppSizes.w(context, 0.14),
                borderRadius: BannerTokens.borderSm(context),
                color: palette.placeholderMuted,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
