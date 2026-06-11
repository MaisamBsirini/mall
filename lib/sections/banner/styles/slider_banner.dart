import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../../../design_system/scope/design_system_scope.dart';
import '../banner_tokens.dart';

class SliderBanner extends StatelessWidget {
  const SliderBanner({super.key});

  static const int _cardCount = 3;
  static const int _activeIndex = 1;

  @override
  Widget build(BuildContext context) {
    final cardHeight = AppSizes.h(context, 0.17);
    final cardWidth = AppSizes.w(context, 0.72);
    final palette = context.ds.palette;

    return Padding(
      padding: BannerTokens.sectionPadding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BannerTokens.textLine(context, widthFactor: 0.12),
          SizedBox(height: BannerTokens.gapSm(context)),
          SizedBox(
            height: cardHeight,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: _cardCount,
              separatorBuilder: (_, __) =>
                  SizedBox(width: BannerTokens.gapMd(context)),
              itemBuilder: (context, index) {
                final isActive = index == _activeIndex;

                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: cardWidth,
                  decoration: BoxDecoration(
                    borderRadius: BannerTokens.borderMd(context),
                    gradient: BannerTokens.placeholderGradient(context),
                    border: isActive
                        ? Border.all(
                            color: palette.primary.withOpacity(0.6),
                            width: 1.5,
                          )
                        : null,
                    boxShadow: isActive
                        ? context.ds.tokens.elevatedShadow(context)
                        : null,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(AppSizes.w(context, 0.04)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BannerTokens.placeholderBox(
                          context,
                          height: AppSizes.h(context, 0.06),
                          width: AppSizes.w(context, 0.18),
                          borderRadius: BannerTokens.borderSm(context),
                          color: palette.placeholderMuted,
                        ),
                        const Spacer(),
                        BannerTokens.textLine(
                          context,
                          widthFactor: 0.34,
                          heightFactor: 0.009,
                        ),
                        SizedBox(height: BannerTokens.gapXs(context)),
                        BannerTokens.textLine(
                          context,
                          widthFactor: 0.20,
                          heightFactor: 0.007,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: BannerTokens.gapMd(context)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(_cardCount, (index) {
              final isActive = index == _activeIndex;

              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: EdgeInsets.symmetric(
                  horizontal: AppSizes.w(context, 0.012),
                ),
                width: isActive
                    ? AppSizes.w(context, 0.05)
                    : AppSizes.w(context, 0.018),
                height: AppSizes.h(context, 0.006),
                decoration: BoxDecoration(
                  color: isActive
                      ? palette.primary
                      : palette.placeholderDark,
                  borderRadius: BannerTokens.borderLg(context),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
