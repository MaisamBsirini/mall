import 'package:flutter/material.dart';

import '../design_system/scope/design_system_scope.dart';
import '../sections/section_registry.dart';

String formatShowcaseStyleId(String id) => formatSectionStyleName(id);

class ShowcaseSectionHeader extends StatelessWidget {
  final String label;
  final int styleCount;

  const ShowcaseSectionHeader({
    super.key,
    required this.label,
    required this.styleCount,
  });

  @override
  Widget build(BuildContext context) {
    final palette = context.ds.palette;
    final tokens = context.ds.tokens;

    return Padding(
      padding: tokens.sectionPadding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 4,
                height: 32,
                decoration: BoxDecoration(
                  color: palette.primary,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              SizedBox(width: tokens.gapMd(context)),
              Expanded(
                child: Text(
                  label,
                  style: context.ds.typography.heading(context),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: tokens.gapSm(context),
                  vertical: tokens.gapXs(context),
                ),
                decoration: BoxDecoration(
                  color: palette.primarySoft(0.10),
                  borderRadius: tokens.borderSm,
                  border: Border.all(color: palette.primarySoft(0.18)),
                ),
                child: Text(
                  '$styleCount styles',
                  style: context.ds.typography.caption(context),
                ),
              ),
            ],
          ),
          SizedBox(height: tokens.gapSm(context)),
          context.ds.placeholders.textLine(
            context,
            widthFactor: 0.38,
            heightFactor: 0.007,
          ),
        ],
      ),
    );
  }
}

class ShowcaseStyleTitle extends StatelessWidget {
  final String label;

  const ShowcaseStyleTitle({
    super.key,
    required this.label,
  });

  ShowcaseStyleTitle.fromStyleId({
    super.key,
    required String styleId,
  }) : label = formatShowcaseStyleId(styleId);

  @override
  Widget build(BuildContext context) {
    final tokens = context.ds.tokens;
    final placeholders = context.ds.placeholders;

    return Padding(
      padding: tokens.sectionPadding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: context.ds.typography.title(context),
          ),
          SizedBox(height: tokens.gapXs(context)),
          placeholders.textLine(
            context,
            widthFactor: 0.22,
            heightFactor: 0.006,
          ),
        ],
      ),
    );
  }
}

class ShowcaseStyleBlock extends StatelessWidget {
  final String styleId;
  final Widget child;

  const ShowcaseStyleBlock({
    super.key,
    required this.styleId,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final tokens = context.ds.tokens;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShowcaseStyleTitle.fromStyleId(styleId: styleId),
        SizedBox(height: tokens.gapSm(context)),
        child,
        SizedBox(height: tokens.sectionGap(context) * 1.5),
      ],
    );
  }
}

class ShowcaseSectionDivider extends StatelessWidget {
  const ShowcaseSectionDivider({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.ds.palette;
    final tokens = context.ds.tokens;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: tokens.horizontalMargin(context),
        vertical: tokens.sectionGap(context),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 1,
              color: palette.border,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: tokens.gapMd(context)),
            child: Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: palette.primary.withOpacity(0.45),
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 1,
              color: palette.border,
            ),
          ),
        ],
      ),
    );
  }
}
