import 'package:flutter/material.dart';

import '../../design_system/scope/design_system_scope.dart';
import '../widgets/product_list_ui.dart';

/// Store category product list — adaptive grid for fast browsing.
class StoreCategoryProductList extends StatelessWidget {
  const StoreCategoryProductList({super.key});

  static const _itemCount = 8;

  @override
  Widget build(BuildContext context) {
    final columns = ProductListUi.gridColumns(context);
    final tokens = context.ds.tokens;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ProductListUi.sheetHeader(context),
        Expanded(
          child: GridView.builder(
            padding: ProductListUi.pagePadding(context),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: columns,
              mainAxisSpacing: ProductListUi.gapMd(context),
              crossAxisSpacing: ProductListUi.gapSm(context),
              childAspectRatio: 0.72,
            ),
            itemCount: _itemCount,
            itemBuilder: (_, __) => _GridProductTile(context: context),
          ),
        ),
        SizedBox(height: tokens.gapSm(context)),
      ],
    );
  }
}

class _GridProductTile extends StatelessWidget {
  final BuildContext context;

  const _GridProductTile({required this.context});

  @override
  Widget build(BuildContext _) {
    final palette = context.ds.palette;

    return Container(
      decoration: BoxDecoration(
        color: palette.surface,
        borderRadius: ProductListUi.radiusMd(context),
        border: Border.all(color: palette.border.withValues(alpha: 0.45)),
        boxShadow: ProductListUi.softShadow(context),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(
                    top: ProductListUi.radiusMd(context).topLeft,
                  ),
                  child: ProductListUi.imagePlaceholder(
                    context,
                    height: double.infinity,
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                Positioned(
                  top: ProductListUi.gapXs(context),
                  right: ProductListUi.gapXs(context),
                  child: ProductListUi.favoriteIcon(context),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(ProductListUi.gapSm(context)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductListUi.titleBlock(context, widthFactor: 0.88),
                SizedBox(height: ProductListUi.gapXs(context)),
                ProductListUi.priceBlock(context, widthFactor: 0.38),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
