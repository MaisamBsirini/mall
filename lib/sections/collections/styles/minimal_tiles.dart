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
    final tileSize = AppSizes.w(context, 0.26);
    final spacing = AppSizes.w(context, 0.035);
    final gridHeight = (tileSize * _rows) + (spacing * (_rows - 1));
    final palette = context.ds.palette;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: CollectionsTokens.sectionPadding(context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CollectionsTokens.textLine(
                context,
                widthFactor: 0.26,
                heightFactor: 0.009,
              ),
              Container(
                width: AppSizes.w(context, 0.06),
                height: AppSizes.h(context, 0.003),
                color: palette.accentSoft(0.4),
              ),
            ],
          ),
        ),
        SizedBox(height: CollectionsTokens.gapMd(context)),
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
                childAspectRatio: 1,
              ),
              itemCount: _columns * _rows,
              itemBuilder: (context, index) {
                return _MinimalTile(size: tileSize);
              },
            ),
          ),
        ),
      ],
    );
  }
}

class _MinimalTile extends StatelessWidget {
  final double size;

  const _MinimalTile({required this.size});

  @override
  Widget build(BuildContext context) {
    final palette = context.ds.palette;

    return Container(
      decoration: BoxDecoration(
        color: palette.placeholderLight,
        borderRadius: CollectionsTokens.borderSm(context),
        border: Border.all(color: palette.border),
      ),
      child: Padding(
        padding: EdgeInsets.all(AppSizes.w(context, 0.025)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CollectionsTokens.shimmerBox(
              context,
              width: size * 0.45,
              height: size * 0.45,
              borderRadius: BorderRadius.circular(6),
            ),
            const Spacer(),
            CollectionsTokens.textLine(
              context,
              widthFactor: 0.18,
              heightFactor: 0.006,
            ),
            SizedBox(height: CollectionsTokens.gapXs(context)),
            Container(
              width: AppSizes.w(context, 0.10),
              height: AppSizes.h(context, 0.003),
              decoration: BoxDecoration(
                color: palette.primarySoft(0.25),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
