import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../../../design_system/scope/design_system_scope.dart';
import '../collections_tokens.dart';

/// Image-dominant card with a compact caption strip — overflow-safe layout.
class SplitCardsCollections extends StatelessWidget {
  const SplitCardsCollections({super.key});

  @override
  Widget build(BuildContext context) {
    final cardWidth = AppSizes.w(context, 0.58);
    final cardHeight = AppSizes.h(context, 0.19);
    final palette = context.ds.palette;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CollectionsTokens.compactHeader(context),
        SizedBox(height: CollectionsTokens.gapSm(context)),
        SizedBox(
          height: cardHeight,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: CollectionsTokens.sectionPadding(context),
            itemCount: CollectionsTokens.itemCount,
            separatorBuilder: (_, __) =>
                SizedBox(width: CollectionsTokens.gapSm(context)),
            itemBuilder: (context, index) {
              return SizedBox(
                width: cardWidth,
                height: cardHeight,
                child: CollectionsTokens.cardShell(
                  context,
                  borderRadius: CollectionsTokens.borderMd(context),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        flex: 7,
                        child: CollectionsTokens.imagePlaceholder(
                          context,
                          width: cardWidth,
                          height: cardHeight * 0.7,
                          borderRadius: BorderRadius.zero,
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          color: palette.surface,
                          padding: EdgeInsets.symmetric(
                            horizontal: AppSizes.w(context, 0.03),
                          ),
                          alignment: Alignment.centerLeft,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CollectionsTokens.textLine(
                                context,
                                widthFactor: 0.42,
                                heightFactor: 0.006,
                              ),
                              SizedBox(height: CollectionsTokens.gapXs(context)),
                              CollectionsTokens.textLine(
                                context,
                                widthFactor: 0.24,
                                heightFactor: 0.005,
                              ),
                            ],
                          ),
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
