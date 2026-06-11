import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../../../design_system/scope/design_system_scope.dart';
import '../social_tokens.dart';

class GlassSocialPanelStyle extends StatelessWidget {
  const GlassSocialPanelStyle({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.ds.palette;
    final panelHeight = AppSizes.h(context, 0.42);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SocialTokens.sectionHeader(context),
        SizedBox(height: SocialTokens.gapMd(context)),
        Padding(
          padding: SocialTokens.sectionPadding(context),
          child: ClipRRect(
            borderRadius: SocialTokens.borderLg(context),
            child: SizedBox(
              height: panelHeight,
              width: double.infinity,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: SocialTokens.glassBackgroundGradient(context),
                    ),
                  ),
                  Positioned(
                    left: -AppSizes.w(context, 0.10),
                    bottom: -AppSizes.h(context, 0.06),
                    child: _GlassOrb(
                      size: AppSizes.w(context, 0.38),
                      color: palette.accent.withOpacity(0.25),
                    ),
                  ),
                  Positioned(
                    right: -AppSizes.w(context, 0.08),
                    top: -AppSizes.h(context, 0.04),
                    child: _GlassOrb(
                      size: AppSizes.w(context, 0.30),
                      color: palette.primary.withOpacity(0.30),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(AppSizes.w(context, 0.045)),
                    child: Column(
                      children: [
                        _GlassProfileBar(context: context),
                        SizedBox(height: SocialTokens.gapMd(context)),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                flex: 5,
                                child: _GlassPlatformCard(
                                  platformIndex: 0,
                                  tall: true,
                                ),
                              ),
                              SizedBox(width: SocialTokens.gapSm(context)),
                              Expanded(
                                flex: 4,
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: _GlassPlatformCard(
                                        platformIndex: 1,
                                      ),
                                    ),
                                    SizedBox(height: SocialTokens.gapSm(context)),
                                    Expanded(
                                      child: _GlassPlatformCard(
                                        platformIndex: 2,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  ...List.generate(2, (index) {
                    final slot = SocialTokens.platforms[index + 3];
                    return Positioned(
                      right: AppSizes.w(context, 0.06 + index * 0.14),
                      bottom: AppSizes.h(context, 0.025),
                      child: Transform.rotate(
                        angle: index == 0 ? -0.08 : 0.06,
                        child: SocialTokens.platformIcon(
                          context,
                          size: AppSizes.w(context, 0.10),
                          accentHint: slot.accentHint,
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _GlassOrb extends StatelessWidget {
  final double size;
  final Color color;

  const _GlassOrb({
    required this.size,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}

class _GlassProfileBar extends StatelessWidget {
  final BuildContext context;

  const _GlassProfileBar({required this.context});

  @override
  Widget build(BuildContext _) {
    final palette = context.ds.palette;

    return ClipRRect(
      borderRadius: SocialTokens.borderMd(context),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.w(context, 0.04),
            vertical: AppSizes.h(context, 0.014),
          ),
          decoration: BoxDecoration(
            color: palette.glassFill,
            borderRadius: SocialTokens.borderMd(context),
            border: Border.all(color: palette.glassBorder),
          ),
          child: Row(
            children: [
              SocialTokens.profileImage(
                context,
                size: AppSizes.w(context, 0.11),
                borderWidth: 2,
              ),
              SizedBox(width: SocialTokens.gapMd(context)),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SocialTokens.usernameLine(context, widthFactor: 0.30),
                    SizedBox(height: SocialTokens.gapXs(context)),
                    SocialTokens.textLine(
                      context,
                      widthFactor: 0.20,
                      heightFactor: 0.006,
                    ),
                  ],
                ),
              ),
              SocialTokens.followerStat(context, widthFactor: 0.12),
            ],
          ),
        ),
      ),
    );
  }
}

class _GlassPlatformCard extends StatelessWidget {
  final int platformIndex;
  final bool tall;

  const _GlassPlatformCard({
    required this.platformIndex,
    this.tall = false,
  });

  @override
  Widget build(BuildContext context) {
    final palette = context.ds.palette;
    final slot = SocialTokens.platforms[platformIndex];

    return ClipRRect(
      borderRadius: SocialTokens.borderMd(context),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: palette.glassFill,
            borderRadius: SocialTokens.borderMd(context),
            border: Border.all(color: palette.glassBorder),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          padding: EdgeInsets.all(AppSizes.w(context, 0.04)),
          child: tall
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SocialTokens.platformIcon(
                      context,
                      size: AppSizes.w(context, 0.12),
                      accentHint: slot.accentHint,
                    ),
                    SizedBox(height: SocialTokens.gapMd(context)),
                    SocialTokens.usernameLine(context, widthFactor: 0.34),
                    SizedBox(height: SocialTokens.gapXs(context)),
                    SocialTokens.textLine(
                      context,
                      widthFactor: 0.22,
                      heightFactor: 0.006,
                    ),
                    const Spacer(),
                    SocialTokens.followerStat(context),
                    SizedBox(height: SocialTokens.gapSm(context)),
                    SocialTokens.ctaPill(context, onDark: true),
                  ],
                )
              : Row(
                  children: [
                    SocialTokens.platformIcon(
                      context,
                      size: AppSizes.w(context, 0.09),
                      accentHint: slot.accentHint,
                      elevated: false,
                    ),
                    SizedBox(width: SocialTokens.gapSm(context)),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SocialTokens.usernameLine(
                            context,
                            widthFactor: 0.24,
                          ),
                          SizedBox(height: SocialTokens.gapXs(context)),
                          SocialTokens.textLine(
                            context,
                            widthFactor: 0.14,
                            heightFactor: 0.006,
                          ),
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
