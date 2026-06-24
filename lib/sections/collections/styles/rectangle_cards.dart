import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../collections_tokens.dart';

class RectangleCardsCollections extends StatelessWidget {
  const RectangleCardsCollections({super.key});

  @override
  Widget build(BuildContext context) {
    final cardWidth = AppSizes.w(context, 0.34);
    final imageHeight = AppSizes.h(context, 0.095);
    final rowHeight = imageHeight + AppSizes.h(context, 0.048);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CollectionsTokens.compactHeader(context),
        SizedBox(height: CollectionsTokens.gapSm(context)),
        SizedBox(
          height: rowHeight,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: CollectionsTokens.sectionPadding(context),
            itemCount: CollectionsTokens.itemCount,
            separatorBuilder: (_, __) =>
                SizedBox(width: CollectionsTokens.gapSm(context)),
            itemBuilder: (context, index) {
              return SizedBox(
                width: cardWidth,
                child: CollectionsTokens.cardShell(
                  context,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CollectionsTokens.imagePlaceholder(
                        context,
                        width: cardWidth,
                        height: imageHeight,
                        borderRadius: BorderRadius.zero,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                          AppSizes.w(context, 0.028),
                          AppSizes.h(context, 0.008),
                          AppSizes.w(context, 0.028),
                          AppSizes.h(context, 0.010),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CollectionsTokens.textLine(
                              context,
                              widthFactor: 0.32,
                              heightFactor: 0.006,
                            ),
                            SizedBox(height: CollectionsTokens.gapXs(context)),
                            CollectionsTokens.textLine(
                              context,
                              widthFactor: 0.20,
                              heightFactor: 0.005,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
