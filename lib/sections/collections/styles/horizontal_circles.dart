import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../../../design_system/scope/design_system_scope.dart';
import '../collections_tokens.dart';

class HorizontalCirclesCollections extends StatelessWidget {
  const HorizontalCirclesCollections({super.key});

  @override
  Widget build(BuildContext context) {
    final circleSize = AppSizes.w(context, 0.18);
    final itemWidth = AppSizes.w(context, 0.22);
    final palette = context.ds.palette;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CollectionsTokens.sectionHeader(context),
        SizedBox(height: CollectionsTokens.gapMd(context)),
        SizedBox(
          height: circleSize + AppSizes.h(context, 0.055),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: CollectionsTokens.sectionPadding(context),
            itemCount: CollectionsTokens.itemCount,
            separatorBuilder: (_, __) =>
                SizedBox(width: CollectionsTokens.gapMd(context)),
            itemBuilder: (context, index) {
              final isHighlighted = index == 0;

              return SizedBox(
                width: itemWidth,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: isHighlighted
                              ? palette.primary.withOpacity(0.7)
                              : Colors.transparent,
                          width: 2,
                        ),
                      ),
                      child: CollectionsTokens.imagePlaceholder(
                        context,
                        width: circleSize,
                        height: circleSize,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(height: CollectionsTokens.gapSm(context)),
                    CollectionsTokens.textLine(
                      context,
                      widthFactor: 0.16,
                    ),
                    SizedBox(height: CollectionsTokens.gapXs(context)),
                    CollectionsTokens.textLine(
                      context,
                      widthFactor: 0.10,
                      heightFactor: 0.006,
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
