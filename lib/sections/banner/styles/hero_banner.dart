import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../../../design_system/scope/design_system_scope.dart';
import '../banner_tokens.dart';

class HeroBanner extends StatelessWidget {
  const HeroBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final height = AppSizes.h(context, 0.30);

    return Padding(
      padding: BannerTokens.sectionPadding(context),
      child: ClipRRect(
        borderRadius: BannerTokens.borderMd(context),
        child: SizedBox(
          height: height,
          width: double.infinity,
          child: Stack(
            fit: StackFit.expand,
            children: [
              BannerTokens.placeholderBox(
                context,
                height: height,
                borderRadius: BorderRadius.zero,
                gradient: BannerTokens.placeholderGradient(context),
              ),
              Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: BannerTokens.heroOverlayGradient(context),
                  ),
                ),
              ),
              Positioned(
                left: AppSizes.w(context, 0.05),
                right: AppSizes.w(context, 0.05),
                bottom: AppSizes.h(context, 0.022),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    BannerTokens.textLine(
                      context,
                      widthFactor: 0.14,
                      heightFactor: 0.007,
                    ),
                    SizedBox(height: BannerTokens.gapXs(context)),
                    BannerTokens.textLine(
                      context,
                      widthFactor: 0.42,
                      heightFactor: 0.012,
                    ),
                    SizedBox(height: BannerTokens.gapMd(context)),
                    BannerTokens.ctaPill(context, onDark: true),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
