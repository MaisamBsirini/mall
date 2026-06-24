import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../../../design_system/scope/design_system_scope.dart';
import '../collections_tokens.dart';

class HorizontalCirclesCollections extends StatelessWidget {
  const HorizontalCirclesCollections({super.key});

  @override
  Widget build(BuildContext context) {
    final circleSize = AppSizes.w(context, 0.14);
    final itemWidth = AppSizes.w(context, 0.17);
    final palette = context.ds.palette;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CollectionsTokens.compactHeader(context),
        SizedBox(height: CollectionsTokens.gapSm(context)),
        SizedBox(
          height: circleSize + AppSizes.h(context, 0.038),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: CollectionsTokens.sectionPadding(context),
            itemCount: CollectionsTokens.itemCount,
            separatorBuilder: (_, __) =>
                SizedBox(width: CollectionsTokens.gapSm(context)),
            itemBuilder: (context, index) {
              final isHighlighted = index == 0;

              return SizedBox(
                width: itemWidth,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: isHighlighted
                              ? palette.primary.withValues(alpha: 0.55)
                              : Colors.transparent,
                          width: 1.5,
                        ),
                      ),
                      child: CollectionsTokens.imagePlaceholder(
                        context,
                        width: circleSize,
                        height: circleSize,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(height: CollectionsTokens.gapXs(context)),
                    CollectionsTokens.textLine(
                      context,
                      widthFactor: 0.14,
                      heightFactor: 0.005,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
