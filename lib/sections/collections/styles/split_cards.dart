import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../../../design_system/scope/design_system_scope.dart';
import '../collections_tokens.dart';

class SplitCardsCollections extends StatelessWidget {
  const SplitCardsCollections({super.key});

  @override
  Widget build(BuildContext context) {
    final cardWidth = AppSizes.w(context, 0.68);
    final cardHeight = AppSizes.h(context, 0.28);
    final imageHeight = cardHeight * 0.75;
    final contentHeight = cardHeight * 0.25;
    final palette = context.ds.palette;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: CollectionsTokens.sectionPadding(context),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CollectionsTokens.textLine(
                      context,
                      widthFactor: 0.36,
                      heightFactor: 0.011,
                    ),
                    SizedBox(height: CollectionsTokens.gapXs(context)),
                    CollectionsTokens.textLine(
                      context,
                      widthFactor: 0.24,
                    ),
                  ],
                ),
              ),
              CollectionsTokens.shimmerBox(
                context,
                width: AppSizes.w(context, 0.10),
                height: AppSizes.h(context, 0.028),
                borderRadius: CollectionsTokens.borderLg(context),
              ),
            ],
          ),
        ),
        SizedBox(height: CollectionsTokens.gapLg(context)),
        SizedBox(
          height: cardHeight,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: CollectionsTokens.sectionPadding(context),
            itemCount: CollectionsTokens.itemCount,
            separatorBuilder: (_, __) =>
                SizedBox(width: CollectionsTokens.gapLg(context)),
            itemBuilder: (context, index) {
              return Container(
                width: cardWidth,
                height: cardHeight,
                decoration: BoxDecoration(
                  color: CollectionsTokens.surface(context),
                  borderRadius: CollectionsTokens.borderLg(context),
                  boxShadow: CollectionsTokens.elevatedShadow(context),
                  border: Border.all(
                    color: palette.primarySoft(0.08),
                  ),
                ),
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: [
                    CollectionsTokens.imagePlaceholder(
                      context,
                      width: cardWidth,
                      height: imageHeight,
                      borderRadius: BorderRadius.zero,
                    ),
                    SizedBox(
                      height: contentHeight,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppSizes.w(context, 0.04),
                          vertical: AppSizes.h(context, 0.012),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CollectionsTokens.textLine(
                                    context,
                                    widthFactor: 0.38,
                                    heightFactor: 0.009,
                                  ),
                                  SizedBox(
                                    height: CollectionsTokens.gapXs(context),
                                  ),
                                  CollectionsTokens.textLine(
                                    context,
                                    widthFactor: 0.22,
                                    heightFactor: 0.007,
                                  ),
                                ],
                              ),
                            ),
                            CollectionsTokens.shimmerBox(
                              context,
                              width: AppSizes.w(context, 0.08),
                              height: AppSizes.w(context, 0.08),
                              borderRadius: CollectionsTokens.borderSm(context),
                            ),
                          ],
                        ),
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
