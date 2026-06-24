import 'package:flutter/material.dart';

import 'screens/service_category_product_list.dart';
import 'screens/service_collection_product_list.dart';
import 'screens/store_category_product_list.dart';
import 'screens/store_collection_product_list.dart';
import 'widgets/product_list_sheet.dart';

/// Navigation entry points for fixed product list destinations.
abstract final class ProductListNavigator {
  static Future<void> openStoreCategory(BuildContext context) {
    return ProductListSheet.show(
      context,
      child: const StoreCategoryProductList(),
    );
  }

  static Future<void> openStoreCollection(BuildContext context) {
    return ProductListSheet.show(
      context,
      child: const StoreCollectionProductList(),
    );
  }

  static Future<void> openServiceCategory(BuildContext context) {
    return ProductListSheet.show(
      context,
      child: const ServiceCategoryProductList(),
    );
  }

  static Future<void> openServiceCollection(BuildContext context) {
    return ProductListSheet.show(
      context,
      child: const ServiceCollectionProductList(),
    );
  }
}

enum ProductListDestination {
  storeCategory,
  storeCollection,
  serviceCategory,
  serviceCollection;

  String get title => switch (this) {
        ProductListDestination.storeCategory => 'Store Category Product List',
        ProductListDestination.storeCollection => 'Store Collection Product List',
        ProductListDestination.serviceCategory => 'Service Category Product List',
        ProductListDestination.serviceCollection =>
          'Service Collection Product List',
      };

  String get subtitle => switch (this) {
        ProductListDestination.storeCategory => 'Adaptive grid · fast browsing',
        ProductListDestination.storeCollection =>
          'Horizontal cards · curated collection',
        ProductListDestination.serviceCategory =>
          'Vertical cards · readable services',
        ProductListDestination.serviceCollection =>
          'Compact cards · featured services',
      };

  Future<void> open(BuildContext context) => switch (this) {
        ProductListDestination.storeCategory =>
          ProductListNavigator.openStoreCategory(context),
        ProductListDestination.storeCollection =>
          ProductListNavigator.openStoreCollection(context),
        ProductListDestination.serviceCategory =>
          ProductListNavigator.openServiceCategory(context),
        ProductListDestination.serviceCollection =>
          ProductListNavigator.openServiceCollection(context),
      };

  Widget buildPreviewContent() => switch (this) {
        ProductListDestination.storeCategory =>
          const StoreCategoryProductList(),
        ProductListDestination.storeCollection =>
          const StoreCollectionProductList(),
        ProductListDestination.serviceCategory =>
          const ServiceCategoryProductList(),
        ProductListDestination.serviceCollection =>
          const ServiceCollectionProductList(),
      };
}
