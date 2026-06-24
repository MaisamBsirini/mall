import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../certification_item.dart';
import '../certifications_section_data.dart';
import '../certifications_tokens.dart';

/// Horizontal scroll of award and certificate image cards.
class AwardsShowcaseStyle extends StatelessWidget {
  final CertificationsSectionData? data;

  const AwardsShowcaseStyle({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    final items = CertificationsTokens.resolveItems(data?.items);
    final cardWidth = AppSizes.w(context, 0.52);
    final imageHeight = AppSizes.h(context, 0.22);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CertificationsTokens.sectionTitle(context, title: data?.title),
        SizedBox(height: CertificationsTokens.gapMd(context)),
        SizedBox(
          height: imageHeight + AppSizes.h(context, 0.055),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(
              horizontal: CertificationsTokens.horizontalMargin(context),
            ),
            itemCount: items.length,
            separatorBuilder: (_, __) =>
                SizedBox(width: CertificationsTokens.gapMd(context)),
            itemBuilder: (context, index) {
              return _AwardCard(
                item: items[index],
                width: cardWidth,
                imageHeight: imageHeight,
              );
            },
          ),
        ),
      ],
    );
  }
}

class _AwardCard extends StatelessWidget {
  final CertificationItem item;
  final double width;
  final double imageHeight;

  const _AwardCard({
    required this.item,
    required this.width,
    required this.imageHeight,
  });

  @override
  Widget build(BuildContext context) {
    final extraCount = item.images.length > 1 ? item.images.length - 1 : 0;

    return Container(
      width: width,
      decoration: BoxDecoration(
        color: CertificationsTokens.surface(context),
        borderRadius: CertificationsTokens.borderMd(context),
        boxShadow: CertificationsTokens.cardShadow(context),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              CertificationsTokens.certificateImage(
                context,
                width: width,
                height: imageHeight,
                framed: false,
              ),
              if (extraCount > 0)
                Positioned(
                  top: CertificationsTokens.gapSm(context),
                  right: CertificationsTokens.gapSm(context),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: CertificationsTokens.gapSm(context),
                      vertical: CertificationsTokens.gapXs(context),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.55),
                      borderRadius: CertificationsTokens.borderSm(context),
                    ),
                    child: Text(
                      '+$extraCount',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ),
                ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(CertificationsTokens.gapSm(context)),
            child: CertificationsTokens.itemTitle(context, title: item.title),
          ),
        ],
      ),
    );
  }
}
