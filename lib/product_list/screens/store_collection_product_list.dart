import 'package:flutter/material.dart';

import '../../core/constants/app_sizes.dart';
import '../../design_system/scope/design_system_scope.dart';
import '../widgets/product_list_ui.dart';

/// Store collection product list — premium horizontal cards.
class StoreCollectionProductList extends StatelessWidget {
  const StoreCollectionProductList({super.key});

  static const _itemCount = 5;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ProductListUi.sheetHeader(context, showActions: false),
        Expanded(
          child: ListView.separated(
            padding: ProductListUi.pagePadding(context),
            itemCount: _itemCount,
            separatorBuilder: (_, __) =>
                SizedBox(height: ProductListUi.gapMd(context) * 1.2),
            itemBuilder: (_, __) => _CollectionCard(context: context),
          ),
        ),
      ],
    );
  }
}

class _CollectionCard extends StatelessWidget {
  final BuildContext context;

  const _CollectionCard({required this.context});

  @override
  Widget build(BuildContext _) {
    final palette = context.ds.palette;
    final imageSize = AppSizes.w(context, 0.28);

    return Container(
      padding: EdgeInsets.all(ProductListUi.gapMd(context)),
      decoration: BoxDecoration(
        color: palette.surface,
        borderRadius: ProductListUi.radiusLg(context),
        border: Border.all(color: palette.border.withValues(alpha: 0.4)),
        boxShadow: ProductListUi.softShadow(context),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: ProductListUi.radiusMd(context),
            child: ProductListUi.imagePlaceholder(
              context,
              width: imageSize,
              height: imageSize * 1.15,
            ),
          ),
          SizedBox(width: ProductListUi.gapMd(context)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductListUi.titleBlock(context, widthFactor: 0.92),
                SizedBox(height: ProductListUi.gapSm(context)),
                ProductListUi.line(context, widthFactor: 0.55, heightFactor: 0.006),
                SizedBox(height: ProductListUi.gapMd(context)),
                Row(
                  children: [
                    Expanded(
                      child: ProductListUi.priceBlock(
                        context,
                        widthFactor: 0.32,
                      ),
                    ),
                    ProductListUi.favoriteIcon(context),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
