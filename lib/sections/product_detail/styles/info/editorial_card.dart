import 'package:flutter/material.dart';

import '../../widgets/ui_placeholders.dart';

/// Info 4 — editorial card with divider hierarchy.
class EditorialCardInfo extends StatelessWidget {
  const EditorialCardInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ProductDetailUi.pagePadding(context),
      child: ProductDetailUi.sectionSurface(
        context,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductDetailUi.categoryChip(context),
            SizedBox(height: ProductDetailUi.gapSm(context)),
            ProductDetailUi.titleBlock(context),
            SizedBox(height: ProductDetailUi.gapMd(context)),
            ProductDetailUi.divider(context),
            SizedBox(height: ProductDetailUi.gapMd(context)),
            ProductDetailUi.descriptionBlock(context, compact: true),
          ],
        ),
      ),
    );
  }
}
