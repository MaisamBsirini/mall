import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../certifications_section_data.dart';
import '../certifications_tokens.dart';

/// Staggered masonry layout with variable image tile heights.
class MasonryAchievementsStyle extends StatelessWidget {
  final CertificationsSectionData? data;

  const MasonryAchievementsStyle({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    final items = CertificationsTokens.resolveItems(data?.items);
    final images = items.allImages;
    final spacing = CertificationsTokens.gapSm(context);
    final columnWidth = (AppSizes.w(context, 1) -
            CertificationsTokens.horizontalMargin(context) * 2 -
            spacing) /
        2;

    final leftColumn = <Widget>[];
    final rightColumn = <Widget>[];

    for (var i = 0; i < images.length; i++) {
      final heightFactor = 1.0 + (i % 3) * 0.22;
      final tile = Padding(
        padding: EdgeInsets.only(bottom: spacing),
        child: CertificationsTokens.certificateImage(
          context,
          width: columnWidth,
          height: columnWidth * heightFactor,
        ),
      );

      if (i.isEven) {
        leftColumn.add(tile);
      } else {
        rightColumn.add(tile);
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CertificationsTokens.sectionTitle(context, title: data?.title),
        SizedBox(height: CertificationsTokens.gapMd(context)),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: CertificationsTokens.horizontalMargin(context),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: Column(children: leftColumn)),
              SizedBox(width: spacing),
              Expanded(child: Column(children: rightColumn)),
            ],
          ),
        ),
      ],
    );
  }
}
