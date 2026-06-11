import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../../../design_system/scope/design_system_scope.dart';
import '../collections_tokens.dart';

class RectangleCardsCollections extends StatelessWidget {
  const RectangleCardsCollections({super.key});

  @override
  Widget build(BuildContext context) {
    final cardWidth = AppSizes.w(context, 0.42);
    final imageHeight = AppSizes.h(context, 0.14);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CollectionsTokens.sectionHeader(context),
        SizedBox(height: CollectionsTokens.gapMd(context)),
        SizedBox(
          height: imageHeight + AppSizes.h(context, 0.075),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: CollectionsTokens.sectionPadding(context),
            itemCount: CollectionsTokens.itemCount,
            separatorBuilder: (_, __) =>
                SizedBox(width: CollectionsTokens.gapMd(context)),
            itemBuilder: (context, index) {
              return Container(
                width: cardWidth,
                decoration: BoxDecoration(
                  color: CollectionsTokens.surface(context),
                  borderRadius: CollectionsTokens.borderMd(context),
                  boxShadow: CollectionsTokens.cardShadow(context),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CollectionsTokens.imagePlaceholder(
                      context,
                      width: cardWidth,
                      height: imageHeight,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(
                          context.ds.tokens.radiusMd,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(AppSizes.w(context, 0.035)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CollectionsTokens.textLine(
                            context,
                            widthFactor: 0.30,
                            heightFactor: 0.009,
                          ),
                          SizedBox(height: CollectionsTokens.gapXs(context)),
                          CollectionsTokens.textLine(
                            context,
                            widthFactor: 0.18,
                            heightFactor: 0.007,
                          ),
                        ],
                      ),
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
