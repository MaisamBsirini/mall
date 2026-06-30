import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../certifications_section_data.dart';
import '../certifications_tokens.dart';

/// Clear credential strip — framed mini tiles in one bounded row.
class CredentialStripStyle extends StatelessWidget {
  final CertificationsSectionData? data;

  const CredentialStripStyle({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    final items = CertificationsTokens.resolveItems(data?.items);
    const visibleCap = 4;
    final visible = items.take(visibleCap).toList();
    final overflow = items.length - visible.length;
    final tileW = AppSizes.w(context, 0.16);
    final tileH = CertificationsTokens.bandHeight(context) * 0.88;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        CertificationsTokens.sectionTitle(context),
        SizedBox(height: CertificationsTokens.gapSm(context)),
        CertificationsTokens.boundedBand(
          context,
          child: Row(
            children: [
              Expanded(
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(
                    horizontal: CertificationsTokens.horizontalMargin(context),
                  ),
                  itemCount: visible.length,
                  separatorBuilder: (_, __) =>
                      SizedBox(width: CertificationsTokens.gapSm(context)),
                  itemBuilder: (context, index) {
                    return CertificationsTokens.miniTile(
                      context,
                      width: tileW,
                      height: tileH,
                      selected: index == 0,
                    );
                  },
                ),
              ),
              if (overflow > 0)
                Padding(
                  padding: EdgeInsets.only(
                    right: CertificationsTokens.horizontalMargin(context),
                  ),
                  child: CertificationsTokens.overflowBadge(context, overflow),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
