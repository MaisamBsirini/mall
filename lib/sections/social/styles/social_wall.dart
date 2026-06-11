import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../../../design_system/scope/design_system_scope.dart';
import '../social_tokens.dart';

class SocialWallStyle extends StatelessWidget {
  const SocialWallStyle({super.key});

  @override
  Widget build(BuildContext context) {
    final gap = SocialTokens.gapSm(context);
    final margin = SocialTokens.horizontalMargin(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: SocialTokens.sectionPadding(context),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SocialTokens.textLine(
                      context,
                      widthFactor: 0.34,
                      heightFactor: 0.011,
                    ),
                    SizedBox(height: SocialTokens.gapXs(context)),
                    SocialTokens.textLine(
                      context,
                      widthFactor: 0.22,
                      heightFactor: 0.007,
                    ),
                  ],
                ),
              ),
              SocialTokens.ctaPill(context),
            ],
          ),
        ),
        SizedBox(height: SocialTokens.gapMd(context)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: margin),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 5,
                    child: _WallCard(
                      height: AppSizes.h(context, 0.34),
                      platformIndex: 0,
                      layout: _WallCardLayout.tall,
                    ),
                  ),
                  SizedBox(width: gap),
                  Expanded(
                    flex: 4,
                    child: Column(
                      children: [
                        _WallCard(
                          height: AppSizes.h(context, 0.16),
                          platformIndex: 1,
                          layout: _WallCardLayout.compact,
                        ),
                        SizedBox(height: gap),
                        _WallCard(
                          height: AppSizes.h(context, 0.16),
                          platformIndex: 2,
                          layout: _WallCardLayout.compact,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: gap),
              Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: _WallCard(
                      height: AppSizes.h(context, 0.14),
                      platformIndex: 3,
                      layout: _WallCardLayout.wide,
                    ),
                  ),
                  SizedBox(width: gap),
                  Expanded(
                    flex: 3,
                    child: _WallCard(
                      height: AppSizes.h(context, 0.14),
                      platformIndex: 4,
                      layout: _WallCardLayout.pin,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

enum _WallCardLayout { tall, compact, wide, pin }

class _WallCard extends StatelessWidget {
  final double height;
  final int platformIndex;
  final _WallCardLayout layout;

  const _WallCard({
    required this.height,
    required this.platformIndex,
    required this.layout,
  });

  @override
  Widget build(BuildContext context) {
    final slot = SocialTokens.platforms[platformIndex % SocialTokens.platforms.length];
    final iconSize = layout == _WallCardLayout.tall
        ? AppSizes.w(context, 0.11)
        : AppSizes.w(context, 0.085);

    return Container(
      height: height,
      decoration: BoxDecoration(
        color: SocialTokens.surface(context),
        borderRadius: SocialTokens.borderMd(context),
        border: Border.all(color: slot.accentHint.withOpacity(0.12)),
        boxShadow: SocialTokens.cardShadow(context),
      ),
      child: ClipRRect(
        borderRadius: SocialTokens.borderMd(context),
        child: Stack(
          children: [
            Positioned(
              right: -AppSizes.w(context, 0.06),
              top: -AppSizes.h(context, 0.02),
              child: Container(
                width: AppSizes.w(context, 0.22),
                height: AppSizes.w(context, 0.22),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: slot.accentHint.withOpacity(0.08),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(AppSizes.w(context, 0.04)),
              child: _buildContent(context, slot, iconSize),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    SocialPlatformSlot slot,
    double iconSize,
  ) {
    switch (layout) {
      case _WallCardLayout.tall:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SocialTokens.platformIcon(
                  context,
                  size: iconSize,
                  accentHint: slot.accentHint,
                ),
                const Spacer(),
                SocialTokens.shimmerBox(
                  context,
                  width: AppSizes.w(context, 0.12),
                  height: AppSizes.h(context, 0.006),
                  borderRadius: SocialTokens.borderSm(context),
                ),
              ],
            ),
            SizedBox(height: SocialTokens.gapMd(context)),
            Expanded(
              child: SocialTokens.shimmerBox(
                context,
                width: double.infinity,
                borderRadius: SocialTokens.borderSm(context),
              ),
            ),
            SizedBox(height: SocialTokens.gapMd(context)),
            SocialTokens.usernameLine(context, widthFactor: 0.30),
            SizedBox(height: SocialTokens.gapXs(context)),
            Row(
              children: [
                Expanded(child: SocialTokens.followerStat(context)),
                Expanded(child: SocialTokens.followerStat(context)),
              ],
            ),
          ],
        );
      case _WallCardLayout.compact:
        return Row(
          children: [
            SocialTokens.platformIcon(
              context,
              size: iconSize,
              accentHint: slot.accentHint,
            ),
            SizedBox(width: SocialTokens.gapSm(context)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialTokens.usernameLine(context, widthFactor: 0.22),
                  SizedBox(height: SocialTokens.gapXs(context)),
                  SocialTokens.textLine(
                    context,
                    widthFactor: 0.16,
                    heightFactor: 0.006,
                  ),
                ],
              ),
            ),
          ],
        );
      case _WallCardLayout.wide:
        return Row(
          children: [
            SocialTokens.platformIcon(
              context,
              size: iconSize,
              accentHint: slot.accentHint,
            ),
            SizedBox(width: SocialTokens.gapMd(context)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialTokens.usernameLine(context, widthFactor: 0.26),
                  SizedBox(height: SocialTokens.gapXs(context)),
                  SocialTokens.textLine(
                    context,
                    widthFactor: 0.18,
                    heightFactor: 0.006,
                  ),
                ],
              ),
            ),
            SocialTokens.followerStat(context, widthFactor: 0.12),
          ],
        );
      case _WallCardLayout.pin:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SocialTokens.platformIcon(
              context,
              size: iconSize,
              accentHint: slot.accentHint,
              elevated: false,
            ),
            SizedBox(height: SocialTokens.gapXs(context)),
            SocialTokens.textLine(
              context,
              widthFactor: 0.14,
              heightFactor: 0.006,
            ),
          ],
        );
    }
  }
}
