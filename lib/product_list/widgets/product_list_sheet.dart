import 'package:flutter/material.dart';

import '../../design_system/scope/design_system_scope.dart';
import 'product_list_ui.dart';

/// Presents a product list screen as an 85% height modal bottom sheet.
abstract final class ProductListSheet {
  static const sheetHeightFactor = 0.85;

  static Future<T?> show<T>(
    BuildContext context, {
    required Widget child,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withValues(alpha: 0.32),
      builder: (sheetContext) {
        final palette = sheetContext.ds.palette;
        final height = ProductListUi.sheetHeight(sheetContext);

        return Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.sizeOf(sheetContext).height * (1 - sheetHeightFactor),
          ),
          child: Container(
            height: height,
            decoration: BoxDecoration(
              color: palette.surface,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
              boxShadow: ProductListUi.softShadow(sheetContext),
            ),
            clipBehavior: Clip.antiAlias,
            child: child,
          ),
        );
      },
    );
  }
}
