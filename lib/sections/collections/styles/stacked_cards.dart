import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../../../design_system/scope/design_system_scope.dart';
import '../collections_tokens.dart';

class StackedCardsCollections extends StatelessWidget {
  const StackedCardsCollections({super.key});

  static const List<_StackLayer> _layers = [
    _StackLayer(offsetX: 0.00, offsetY: 0.00, rotation: -0.04, scale: 1.0),
    _StackLayer(offsetX: 0.14, offsetY: 0.06, rotation: 0.03, scale: 0.92),
    _StackLayer(offsetX: 0.28, offsetY: 0.12, rotation: 0.06, scale: 0.84),
  ];

  @override
  Widget build(BuildContext context) {
    final cardWidth = AppSizes.w(context, 0.52);
    final cardHeight = AppSizes.h(context, 0.26);
    final stackHeight = cardHeight + AppSizes.h(context, 0.10);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: CollectionsTokens.sectionPadding(context),
          child: Align(
            alignment: Alignment.centerRight,
            child: CollectionsTokens.textLine(
              context,
              widthFactor: 0.28,
              heightFactor: 0.010,
            ),
          ),
        ),
        SizedBox(height: CollectionsTokens.gapSm(context)),
        SizedBox(
          height: stackHeight,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                left: AppSizes.w(context, 0.04),
                top: AppSizes.h(context, 0.02),
                child: CollectionsTokens.shimmerBox(
                  context,
                  width: AppSizes.w(context, 0.22),
                  height: AppSizes.h(context, 0.006),
                ),
              ),
              ...List.generate(_layers.length, (index) {
                final layer = _layers[index];
                final isFront = index == 0;

                return Positioned(
                  left: AppSizes.w(context, 0.04) +
                      AppSizes.w(context, layer.offsetX),
                  top: AppSizes.h(context, layer.offsetY),
                  child: Transform.rotate(
                    angle: layer.rotation,
                    child: Transform.scale(
                      scale: layer.scale,
                      child: _EditorialCard(
                        width: cardWidth,
                        height: cardHeight,
                        elevated: isFront,
                      ),
                    ),
                  ),
                );
              }),
              Positioned(
                right: AppSizes.w(context, 0.04),
                bottom: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CollectionsTokens.textLine(
                      context,
                      widthFactor: 0.30,
                      heightFactor: 0.010,
                    ),
                    SizedBox(height: CollectionsTokens.gapSm(context)),
                    CollectionsTokens.textLine(
                      context,
                      widthFactor: 0.20,
                    ),
                    SizedBox(height: CollectionsTokens.gapXs(context)),
                    CollectionsTokens.textLine(
                      context,
                      widthFactor: 0.14,
                      heightFactor: 0.006,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _StackLayer {
  final double offsetX;
  final double offsetY;
  final double rotation;
  final double scale;

  const _StackLayer({
    required this.offsetX,
    required this.offsetY,
    required this.rotation,
    required this.scale,
  });
}

class _EditorialCard extends StatelessWidget {
  final double width;
  final double height;
  final bool elevated;

  const _EditorialCard({
    required this.width,
    required this.height,
    required this.elevated,
  });

  @override
  Widget build(BuildContext context) {
    final palette = context.ds.palette;

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: CollectionsTokens.surface(context),
        borderRadius: CollectionsTokens.borderMd(context),
        boxShadow: elevated
            ? CollectionsTokens.elevatedShadow(context)
            : CollectionsTokens.cardShadow(context),
        border: Border.all(
          color: palette.primarySoft(elevated ? 0.12 : 0.05),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 7,
            child: CollectionsTokens.imagePlaceholder(
              context,
              width: width,
              height: height * 0.7,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(context.ds.tokens.radiusMd),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.all(AppSizes.w(context, 0.04)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CollectionsTokens.textLine(
                    context,
                    widthFactor: 0.34,
                  ),
                  const Spacer(),
                  CollectionsTokens.shimmerBox(
                    context,
                    width: AppSizes.w(context, 0.12),
                    height: AppSizes.h(context, 0.005),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
