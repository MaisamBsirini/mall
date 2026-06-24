import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../../../design_system/scope/design_system_scope.dart';
import '../collections_tokens.dart';

class MinimalTilesCollections extends StatelessWidget {
  const MinimalTilesCollections({super.key});

  static const int _columns = 3;
  static const int _rows = 2;

  @override
  Widget build(BuildContext context) {
    final spacing = CollectionsTokens.gapSm(context);
    final tileWidth =
        (AppSizes.w(context, 0.92) - spacing * (_columns - 1)) / _columns;
    final gridHeight = (tileWidth * 0.82 * _rows) + (spacing * (_rows - 1));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CollectionsTokens.compactHeader(context),
        SizedBox(height: CollectionsTokens.gapSm(context)),
        Padding(
          padding: CollectionsTokens.sectionPadding(context),
          child: SizedBox(
            height: gridHeight,
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: _columns,
                mainAxisSpacing: spacing,
                crossAxisSpacing: spacing,
                childAspectRatio: 1.22,
              ),
              itemCount: _columns * _rows,
              itemBuilder: (context, index) => _CompactTile(index: index),
            ),
          ),
        ),
      ],
    );
  }
}

class _CompactTile extends StatelessWidget {
  final int index;

  const _CompactTile({required this.index});

  @override
  Widget build(BuildContext context) {
    final palette = context.ds.palette;

    return CollectionsTokens.cardShell(
      context,
      borderRadius: CollectionsTokens.borderSm(context),
      child: Padding(
        padding: EdgeInsets.all(AppSizes.w(context, 0.022)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: CollectionsTokens.imagePlaceholder(
                context,
                width: double.infinity,
                height: double.infinity,
                borderRadius: CollectionsTokens.borderSm(context),
              ),
            ),
            SizedBox(height: CollectionsTokens.gapXs(context)),
            CollectionsTokens.textLine(
              context,
              widthFactor: 0.16,
              heightFactor: 0.005,
            ),
            SizedBox(height: 2),
            Container(
              width: AppSizes.w(context, 0.08),
              height: 2,
              decoration: BoxDecoration(
                color: palette.primarySoft(index == 0 ? 0.4 : 0.2),
                borderRadius: BorderRadius.circular(1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
