import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../../../design_system/scope/design_system_scope.dart';
import '../social_tokens.dart';

class CreatorShowcaseStyle extends StatelessWidget {
  const CreatorShowcaseStyle({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.ds.palette;
    final heroHeight = AppSizes.h(context, 0.36);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: SocialTokens.sectionPadding(context),
          child: SocialTokens.textLine(
            context,
            widthFactor: 0.28,
            heightFactor: 0.010,
          ),
        ),
        SizedBox(height: SocialTokens.gapSm(context)),
        Padding(
          padding: SocialTokens.sectionPadding(context),
          child: ClipRRect(
            borderRadius: SocialTokens.borderLg(context),
            child: SizedBox(
              height: heroHeight,
              width: double.infinity,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  SocialTokens.shimmerBox(
                    context,
                    width: double.infinity,
                    height: heroHeight,
                    borderRadius: BorderRadius.zero,
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          palette.overlayDark.withOpacity(0.85),
                        ],
                        stops: const [0.35, 1.0],
                      ),
                    ),
                  ),
                  Positioned(
                    left: AppSizes.w(context, 0.05),
                    right: AppSizes.w(context, 0.05),
                    bottom: AppSizes.h(context, 0.022),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Transform.translate(
                          offset: Offset(0, AppSizes.h(context, 0.03)),
                          child: SocialTokens.profileImage(
                            context,
                            size: AppSizes.w(context, 0.24),
                            borderWidth: 4,
                          ),
                        ),
                        SizedBox(width: SocialTokens.gapMd(context)),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SocialTokens.textLine(
                                context,
                                widthFactor: 0.36,
                                heightFactor: 0.011,
                              ),
                              SizedBox(height: SocialTokens.gapXs(context)),
                              SocialTokens.textLine(
                                context,
                                widthFactor: 0.24,
                                heightFactor: 0.007,
                              ),
                              SizedBox(height: SocialTokens.gapSm(context)),
                              SocialTokens.ctaPill(context, onDark: true),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: AppSizes.h(context, 0.018),
                    right: AppSizes.w(context, 0.04),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppSizes.w(context, 0.03),
                        vertical: AppSizes.h(context, 0.007),
                      ),
                      decoration: BoxDecoration(
                        color: palette.glassFill,
                        borderRadius: SocialTokens.borderSm(context),
                        border: Border.all(color: palette.glassBorder),
                      ),
                      child: SocialTokens.textLine(
                        context,
                        widthFactor: 0.12,
                        heightFactor: 0.006,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Transform.translate(
          offset: Offset(0, -AppSizes.h(context, 0.04)),
          child: Padding(
            padding: SocialTokens.sectionPadding(context),
            child: Row(
              children: List.generate(3, (index) {
                return Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      right: index < 2 ? SocialTokens.gapSm(context) : 0,
                    ),
                    child: _CreatorStatCard(context: context),
                  ),
                );
              }),
            ),
          ),
        ),
        Padding(
          padding: SocialTokens.sectionPadding(context),
          child: _FeaturedPlatformCard(context: context),
        ),
      ],
    );
  }
}

class _CreatorStatCard extends StatelessWidget {
  final BuildContext context;

  const _CreatorStatCard({required this.context});

  @override
  Widget build(BuildContext _) {
    final palette = context.ds.palette;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.w(context, 0.035),
        vertical: AppSizes.h(context, 0.016),
      ),
      decoration: BoxDecoration(
        color: SocialTokens.surface(context),
        borderRadius: SocialTokens.borderMd(context),
        border: Border.all(color: palette.primarySoft(0.10)),
        boxShadow: SocialTokens.elevatedShadow(context),
      ),
      child: SocialTokens.followerStat(context, widthFactor: 0.18),
    );
  }
}

class _FeaturedPlatformCard extends StatelessWidget {
  final BuildContext context;

  const _FeaturedPlatformCard({required this.context});

  @override
  Widget build(BuildContext _) {
    final palette = context.ds.palette;
    final slot = SocialTokens.platforms.first;

    return Container(
      decoration: BoxDecoration(
        color: SocialTokens.surface(context),
        borderRadius: SocialTokens.borderLg(context),
        border: Border.all(color: slot.accentHint.withOpacity(0.15)),
        boxShadow: SocialTokens.cardShadow(context),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(
              AppSizes.w(context, 0.05),
              AppSizes.h(context, 0.018),
              AppSizes.w(context, 0.05),
              0,
            ),
            child: Row(
              children: [
                SocialTokens.textLine(
                  context,
                  widthFactor: 0.22,
                  heightFactor: 0.009,
                ),
                const Spacer(),
                SocialTokens.shimmerBox(
                  context,
                  width: AppSizes.w(context, 0.14),
                  height: AppSizes.h(context, 0.006),
                  borderRadius: SocialTokens.borderSm(context),
                ),
              ],
            ),
          ),
          SizedBox(height: SocialTokens.gapMd(context)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.w(context, 0.05)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SocialTokens.platformIcon(
                  context,
                  size: AppSizes.w(context, 0.15),
                  accentHint: slot.accentHint,
                ),
                SizedBox(width: SocialTokens.gapMd(context)),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SocialTokens.usernameLine(context, widthFactor: 0.32),
                      SizedBox(height: SocialTokens.gapXs(context)),
                      SocialTokens.textLine(
                        context,
                        widthFactor: 0.40,
                        heightFactor: 0.007,
                      ),
                      SizedBox(height: SocialTokens.gapSm(context)),
                      Row(
                        children: [
                          Expanded(
                            child: SocialTokens.followerStat(
                              context,
                              widthFactor: 0.16,
                            ),
                          ),
                          Expanded(
                            child: SocialTokens.followerStat(
                              context,
                              widthFactor: 0.16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: SocialTokens.gapMd(context)),
          Container(
            margin: EdgeInsets.fromLTRB(
              AppSizes.w(context, 0.05),
              0,
              AppSizes.w(context, 0.05),
              AppSizes.h(context, 0.018),
            ),
            height: AppSizes.h(context, 0.10),
            decoration: BoxDecoration(
              borderRadius: SocialTokens.borderMd(context),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  slot.accentHint.withOpacity(0.12),
                  palette.primarySoft(0.06),
                ],
              ),
            ),
            child: Center(
              child: SocialTokens.ctaPill(context),
            ),
          ),
        ],
      ),
    );
  }
}
