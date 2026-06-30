import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../certifications_section_data.dart';
import '../certifications_tokens.dart';

/// Compact horizontal medal strip — fixed height, scrolls when many items.
class CertificateWallStyle extends StatelessWidget {
  final CertificationsSectionData? data;

  const CertificateWallStyle({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    final items = CertificationsTokens.resolveItems(data?.items);
    final images = items.allImages;
    const visibleCap = 5;
    final visible = images.take(visibleCap).toList();
    final overflow = images.length - visible.length;
    final tileW = AppSizes.w(context, 0.14);
    final tileH = CertificationsTokens.bandHeight(context) * 0.82;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        CertificationsTokens.sectionTitle(context),
        SizedBox(height: CertificationsTokens.gapSm(context)),
        CertificationsTokens.boundedBand(
          context,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(
              horizontal: CertificationsTokens.horizontalMargin(context),
            ),
            itemCount: visible.length + (overflow > 0 ? 1 : 0),
            separatorBuilder: (_, __) =>
                SizedBox(width: CertificationsTokens.gapSm(context)),
            itemBuilder: (context, index) {
              if (overflow > 0 && index == visible.length) {
                return Center(
                  child: CertificationsTokens.overflowBadge(context, overflow),
                );
              }
              return CertificationsTokens.miniTile(
                context,
                width: tileW,
                height: tileH,
                selected: index == 0,
              );
            },
          ),
        ),
      ],
    );
  }
}
