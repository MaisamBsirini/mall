import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../../../design_system/scope/design_system_scope.dart';
import '../banner_tokens.dart';

class GlassBanner extends StatelessWidget {
  const GlassBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final height = AppSizes.h(context, 0.26);
    final palette = context.ds.palette;

    return Padding(
      padding: BannerTokens.sectionPadding(context),
      child: ClipRRect(
        borderRadius: BannerTokens.borderLg(context),
        child: SizedBox(
          height: height,
          width: double.infinity,
          child: Stack(
            fit: StackFit.expand,
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  gradient: BannerTokens.glassBackgroundGradient(context),
                ),
              ),
              Positioned(
                right: -AppSizes.w(context, 0.08),
                top: -AppSizes.h(context, 0.04),
                child: BannerTokens.placeholderBox(
                  context,
                  width: AppSizes.w(context, 0.45),
                  height: AppSizes.w(context, 0.45),
                  borderRadius: BorderRadius.circular(999),
                  color: palette.glassFill,
                ),
              ),
              Positioned(
                left: AppSizes.w(context, 0.05),
                right: AppSizes.w(context, 0.05),
                top: AppSizes.h(context, 0.04),
                bottom: AppSizes.h(context, 0.04),
                child: ClipRRect(
                  borderRadius: BannerTokens.borderLg(context),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppSizes.w(context, 0.06),
                        vertical: AppSizes.h(context, 0.028),
                      ),
                      decoration: BoxDecoration(
                        color: palette.glassFill,
                        borderRadius: BannerTokens.borderLg(context),
                        border: Border.all(color: palette.glassBorder),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BannerTokens.textLine(
                            context,
                            widthFactor: 0.12,
                          ),
                          SizedBox(height: BannerTokens.gapSm(context)),
                          BannerTokens.textLine(
                            context,
                            widthFactor: 0.40,
                            heightFactor: 0.011,
                          ),
                          SizedBox(height: BannerTokens.gapXs(context)),
                          BannerTokens.textLine(
                            context,
                            widthFactor: 0.32,
                          ),
                          SizedBox(height: BannerTokens.gapLg(context)),
                          BannerTokens.ctaPill(context, onDark: true),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
