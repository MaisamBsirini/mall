import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../../../design_system/scope/design_system_scope.dart';
import '../collections_tokens.dart';

/// Stable horizontal peek carousel — no rotation, mobile-friendly depth.
class StackedCardsCollections extends StatelessWidget {
  const StackedCardsCollections({super.key});

  @override
  Widget build(BuildContext context) {
    final cardWidth = AppSizes.w(context, 0.44);
    final cardHeight = AppSizes.h(context, 0.17);
    final viewportHeight = cardHeight + CollectionsTokens.gapSm(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: CollectionsTokens.sectionPadding(context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CollectionsTokens.textLine(
                context,
                widthFactor: 0.28,
                heightFactor: 0.008,
              ),
              CollectionsTokens.textLine(
                context,
                widthFactor: 0.10,
                heightFactor: 0.006,
              ),
            ],
          ),
        ),
        SizedBox(height: CollectionsTokens.gapSm(context)),
        SizedBox(
          height: viewportHeight,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: CollectionsTokens.sectionPadding(context),
            itemCount: CollectionsTokens.itemCount,
            separatorBuilder: (_, __) =>
                SizedBox(width: CollectionsTokens.gapSm(context)),
            itemBuilder: (context, index) {
              final isLead = index == 0;

              return AnimatedScale(
                scale: isLead ? 1.0 : 0.94,
                duration: const Duration(milliseconds: 200),
                child: _PeekCard(
                  width: cardWidth,
                  height: cardHeight,
                  elevated: isLead,
                  depth: index,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _PeekCard extends StatelessWidget {
  final double width;
  final double height;
  final bool elevated;
  final int depth;

  const _PeekCard({
    required this.width,
    required this.height,
    required this.elevated,
    required this.depth,
  });

  @override
  Widget build(BuildContext context) {
    final palette = context.ds.palette;
    final topInset = depth.clamp(0, 2) * 2.0;

    return Padding(
      padding: EdgeInsets.only(top: topInset),
      child: CollectionsTokens.cardShell(
        context,
        elevated: elevated,
        child: SizedBox(
          width: width,
          height: height,
          child: Row(
            children: [
              CollectionsTokens.imagePlaceholder(
                context,
                width: height,
                height: height,
                borderRadius: BorderRadius.zero,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(AppSizes.w(context, 0.028)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CollectionsTokens.textLine(
                        context,
                        widthFactor: 0.36,
                        heightFactor: 0.006,
                      ),
                      SizedBox(height: CollectionsTokens.gapXs(context)),
                      CollectionsTokens.textLine(
                        context,
                        widthFactor: 0.22,
                        heightFactor: 0.005,
                      ),
                      SizedBox(height: CollectionsTokens.gapSm(context)),
                      Container(
                        width: AppSizes.w(context, 0.14),
                        height: 2,
                        decoration: BoxDecoration(
                          color: palette.primarySoft(0.35),
                          borderRadius: BorderRadius.circular(1),
                        ),
                      ),
                    ],
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
