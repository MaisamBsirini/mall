import 'package:flutter/material.dart';

import '../core/constants/app_sizes.dart';
import '../design_system/app_design_system.dart';
import '../design_system/scope/design_system_scope.dart';
import '../product_list/widgets/product_list_sheet.dart';
import '../product_list/widgets/product_list_ui.dart';
import '../sections/storefront_renderer.dart';
import 'demo_product_detail.dart';
import 'demo_products.dart';
import 'demo_store_data.dart';

/// Temporary demo entry — run without touching [main.dart]:
///
/// ```bash
/// flutter run -t lib/demo/demo_navigation.dart
/// ```
void main() {
  runApp(const DemoExperienceApp());
}

/// Isolated demo app wrapper.
class DemoExperienceApp extends StatelessWidget {
  const DemoExperienceApp({super.key});

  @override
  Widget build(BuildContext context) {
    final designSystem = AppDesignSystem.fromConfig(
      DemoStoreData.config.design,
    );

    return DesignSystemScope(
      designSystem: designSystem,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Demo Store',
        theme: designSystem.toThemeData(),
        home: const DemoStoreExperienceScreen(),
      ),
    );
  }
}

/// Full temporary merchant experience — store → list → product detail.
class DemoStoreExperienceScreen extends StatelessWidget {
  const DemoStoreExperienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.ds.palette;

    return Scaffold(
      backgroundColor: palette.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _DemoTopBar(),
            _DemoFlowHint(),
            _DemoCategoryCollectionStrip(),
            Expanded(
              child: StorefrontRenderer(config: DemoStoreData.config),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => DemoNavigation.openRandomProduct(context),
        backgroundColor: palette.primary,
        foregroundColor: palette.onPrimary,
        icon: const Icon(Icons.shopping_bag_outlined, size: 20),
        label: Text(
          'Random product',
          style: context.ds.typography.caption(context).copyWith(
                color: palette.onPrimary,
                fontWeight: FontWeight.w600,
              ),
        ),
      ),
    );
  }
}

class _DemoTopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final palette = context.ds.palette;
    final tokens = context.ds.tokens;

    return Container(
      padding: EdgeInsets.fromLTRB(
        tokens.horizontalMargin(context),
        tokens.gapSm(context),
        tokens.horizontalMargin(context),
        tokens.gapSm(context),
      ),
      decoration: BoxDecoration(
        color: palette.surface,
        border: Border(bottom: BorderSide(color: palette.border)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Demo Store Experience',
                  style: context.ds.typography.title(context).copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
                SizedBox(height: tokens.gapXs(context) * 0.5),
                Text(
                  DemoStoreData.merchantName,
                  style: context.ds.typography.caption(context).copyWith(
                        color: palette.textSecondary,
                      ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: tokens.gapSm(context),
              vertical: tokens.gapXs(context),
            ),
            decoration: BoxDecoration(
              color: palette.warning.withValues(alpha: 0.12),
              borderRadius: tokens.borderSm,
              border: Border.all(color: palette.warning.withValues(alpha: 0.35)),
            ),
            child: Text(
              'TEMP DEMO',
              style: context.ds.typography.caption(context).copyWith(
                    color: palette.warning,
                    fontWeight: FontWeight.w700,
                    fontSize: 10,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DemoFlowHint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final palette = context.ds.palette;
    final tokens = context.ds.tokens;

    return Padding(
      padding: EdgeInsets.fromLTRB(
        tokens.horizontalMargin(context),
        tokens.gapSm(context),
        tokens.horizontalMargin(context),
        0,
      ),
      child: Text(
        'Scroll the dynamic store below. Tap a category or collection to open '
        'a product list, then tap any product for product detail.',
        style: context.ds.typography.caption(context).copyWith(
              color: palette.textSecondary,
            ),
      ),
    );
  }
}

class _DemoCategoryCollectionStrip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tokens = context.ds.tokens;

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: tokens.gapSm(context),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: tokens.horizontalMargin(context),
            ),
            child: Text(
              'Categories',
              style: context.ds.typography.caption(context).copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
          SizedBox(height: tokens.gapXs(context)),
          SizedBox(
            height: 40,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(
                horizontal: tokens.horizontalMargin(context),
              ),
              itemCount: DemoStoreData.categories.length,
              separatorBuilder: (_, __) => SizedBox(width: tokens.gapSm(context)),
              itemBuilder: (context, index) {
                final category = DemoStoreData.categories[index];
                return ActionChip(
                  avatar: Icon(
                    _iconFor(category.icon),
                    size: 16,
                    color: context.ds.palette.primary,
                  ),
                  label: Text(category.name),
                  onPressed: () => DemoNavigation.openCategoryList(
                    context,
                    category: category,
                  ),
                );
              },
            ),
          ),
          SizedBox(height: tokens.gapSm(context)),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: tokens.horizontalMargin(context),
            ),
            child: Text(
              'Collections',
              style: context.ds.typography.caption(context).copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
          SizedBox(height: tokens.gapXs(context)),
          SizedBox(
            height: 40,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(
                horizontal: tokens.horizontalMargin(context),
              ),
              itemCount: DemoStoreData.collections.length,
              separatorBuilder: (_, __) => SizedBox(width: tokens.gapSm(context)),
              itemBuilder: (context, index) {
                final collection = DemoStoreData.collections[index];
                return ActionChip(
                  avatar: Icon(
                    Icons.collections_bookmark_outlined,
                    size: 16,
                    color: context.ds.palette.primary,
                  ),
                  label: Text(collection.name),
                  onPressed: () => DemoNavigation.openCollectionList(
                    context,
                    collection: collection,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  static IconData _iconFor(String key) => switch (key) {
        'spa_outlined' => Icons.spa_outlined,
        'fitness_center_outlined' => Icons.fitness_center_outlined,
        'local_florist_outlined' => Icons.local_florist_outlined,
        'brush_outlined' => Icons.brush_outlined,
        _ => Icons.category_outlined,
      };
}

/// Demo-only navigation helpers.
abstract final class DemoNavigation {
  static void openCategoryList(
    BuildContext context, {
    required DemoCategory category,
  }) {
    final products = DemoProducts.forCategory(category.id);
    ProductListSheet.show(
      context,
      child: _DemoCategoryProductList(
        title: category.name,
        subtitle: '${products.length} products',
        products: products,
      ),
    );
  }

  static void openCollectionList(
    BuildContext context, {
    required DemoCollection collection,
  }) {
    final products = DemoProducts.forCollection(collection.id);
    ProductListSheet.show(
      context,
      child: _DemoCollectionProductList(
        title: collection.name,
        subtitle: '${products.length} products',
        products: products,
      ),
    );
  }

  static void openProductDetail(
    BuildContext context, {
    required DemoProduct product,
  }) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => DesignSystemScope(
          designSystem: context.ds,
          child: Theme(
            data: context.ds.toThemeData(),
            child: Scaffold(
              backgroundColor: context.ds.palette.background,
              appBar: AppBar(
                title: Text(product.name),
                backgroundColor: context.ds.palette.surface,
                foregroundColor: context.ds.palette.textPrimary,
                elevation: 0,
              ),
              body: DemoProductDetail.buildScreen(product),
            ),
          ),
        ),
      ),
    );
  }

  static void openRandomProduct(BuildContext context) {
    final index = DateTime.now().millisecond % DemoProducts.all.length;
    openProductDetail(context, product: DemoProducts.all[index]);
  }
}

class _DemoCategoryProductList extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<DemoProduct> products;

  const _DemoCategoryProductList({
    required this.title,
    required this.subtitle,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    final columns = ProductListUi.gridColumns(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _DemoSheetHeader(title: title, subtitle: subtitle),
        Expanded(
          child: products.isEmpty
              ? _DemoEmptyList(message: 'No products in this category.')
              : GridView.builder(
                  padding: ProductListUi.pagePadding(context),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: columns,
                    mainAxisSpacing: ProductListUi.gapMd(context),
                    crossAxisSpacing: ProductListUi.gapSm(context),
                    childAspectRatio: 0.72,
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return _DemoProductGridTile(product: products[index]);
                  },
                ),
        ),
      ],
    );
  }
}

class _DemoCollectionProductList extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<DemoProduct> products;

  const _DemoCollectionProductList({
    required this.title,
    required this.subtitle,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _DemoSheetHeader(title: title, subtitle: subtitle),
        Expanded(
          child: products.isEmpty
              ? _DemoEmptyList(message: 'No products in this collection.')
              : ListView.separated(
                  padding: ProductListUi.pagePadding(context),
                  itemCount: products.length,
                  separatorBuilder: (_, __) =>
                      SizedBox(height: ProductListUi.gapMd(context) * 1.1),
                  itemBuilder: (context, index) {
                    return _DemoProductCollectionCard(
                      product: products[index],
                    );
                  },
                ),
        ),
      ],
    );
  }
}

class _DemoSheetHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  const _DemoSheetHeader({
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final palette = context.ds.palette;
    final tokens = context.ds.tokens;

    return Padding(
      padding: EdgeInsets.fromLTRB(
        tokens.horizontalMargin(context),
        tokens.gapMd(context),
        tokens.horizontalMargin(context),
        tokens.gapSm(context),
      ),
      child: Column(
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: palette.border,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          SizedBox(height: tokens.gapMd(context)),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: context.ds.typography.title(context).copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    Text(
                      subtitle,
                      style: context.ds.typography.caption(context).copyWith(
                            color: palette.textSecondary,
                          ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.close_rounded),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _DemoProductGridTile extends StatelessWidget {
  final DemoProduct product;

  const _DemoProductGridTile({required this.product});

  @override
  Widget build(BuildContext context) {
    final palette = context.ds.palette;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => DemoNavigation.openProductDetail(context, product: product),
        borderRadius: ProductListUi.radiusMd(context),
        child: Ink(
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
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(
                    top: ProductListUi.radiusMd(context).topLeft,
                  ),
                  child: _DemoProductImage(product: product),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(ProductListUi.gapSm(context)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: context.ds.typography.caption(context).copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    SizedBox(height: ProductListUi.gapXs(context)),
                    Text(
                      product.formattedPrice,
                      style: context.ds.typography.caption(context).copyWith(
                            color: palette.primary,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DemoProductCollectionCard extends StatelessWidget {
  final DemoProduct product;

  const _DemoProductCollectionCard({required this.product});

  @override
  Widget build(BuildContext context) {
    final palette = context.ds.palette;
    final imageSize = AppSizes.w(context, 0.28);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => DemoNavigation.openProductDetail(context, product: product),
        borderRadius: ProductListUi.radiusLg(context),
        child: Ink(
          padding: EdgeInsets.all(ProductListUi.gapMd(context)),
          decoration: BoxDecoration(
            color: palette.surface,
            borderRadius: ProductListUi.radiusLg(context),
            border: Border.all(color: palette.border.withValues(alpha: 0.4)),
            boxShadow: ProductListUi.softShadow(context),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: ProductListUi.radiusMd(context),
                child: SizedBox(
                  width: imageSize,
                  height: imageSize,
                  child: _DemoProductImage(product: product),
                ),
              ),
              SizedBox(width: ProductListUi.gapMd(context)),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: context.ds.typography.title(context).copyWith(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    SizedBox(height: ProductListUi.gapXs(context)),
                    Text(
                      product.formattedPrice,
                      style: context.ds.typography.caption(context).copyWith(
                            color: palette.primary,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    SizedBox(height: ProductListUi.gapXs(context)),
                    Text(
                      DemoProductDetail.variantProfileLabel(
                        product.variantProfile,
                      ),
                      style: context.ds.typography.caption(context).copyWith(
                            color: palette.textSecondary,
                            fontSize: 11,
                          ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right_rounded,
                color: palette.textSecondary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DemoProductImage extends StatelessWidget {
  final DemoProduct product;

  const _DemoProductImage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: product.accent.withValues(alpha: 0.35),
      child: Center(
        child: Icon(
          Icons.image_outlined,
          size: 32,
          color: context.ds.palette.textSecondary.withValues(alpha: 0.5),
        ),
      ),
    );
  }
}

class _DemoEmptyList extends StatelessWidget {
  final String message;

  const _DemoEmptyList({required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: context.ds.typography.caption(context).copyWith(
              color: context.ds.palette.textSecondary,
            ),
      ),
    );
  }
}
