import 'package:flutter/material.dart';

import '../../widgets/ui_placeholders.dart';

/// Info 5 — minimal centered typography hierarchy.
class MinimalCenteredInfo extends StatelessWidget {
  const MinimalCenteredInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ProductDetailUi.pagePadding(context),
      child: Column(
        children: [
          ProductDetailUi.categoryChip(context),
          SizedBox(height: ProductDetailUi.gapSm(context)),
          Center(child: ProductDetailUi.titleBlock(context, primaryWidth: 0.62)),
          SizedBox(height: ProductDetailUi.gapMd(context)),
          Align(
            alignment: Alignment.center,
            child: ProductDetailUi.descriptionBlock(
              context,
              compact: true,
              lines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
