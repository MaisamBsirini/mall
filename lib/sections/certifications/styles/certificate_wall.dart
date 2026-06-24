import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../certifications_section_data.dart';
import '../certifications_tokens.dart';

/// Uniform grid of certificate and award images.
class CertificateWallStyle extends StatelessWidget {
  final CertificationsSectionData? data;

  const CertificateWallStyle({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    final items = CertificationsTokens.resolveItems(data?.items);
    final images = items.allImages;
    final crossAxisCount = 3;
    final spacing = CertificationsTokens.gapSm(context);
    final tileWidth = (AppSizes.w(context, 1) -
            CertificationsTokens.horizontalMargin(context) * 2 -
            spacing * (crossAxisCount - 1)) /
        crossAxisCount;
    final tileHeight = tileWidth * 1.25;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CertificationsTokens.sectionTitle(context, title: data?.title),
        SizedBox(height: CertificationsTokens.gapMd(context)),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: CertificationsTokens.horizontalMargin(context),
          ),
          child: Wrap(
            spacing: spacing,
            runSpacing: spacing,
            children: [
              for (var i = 0; i < images.length; i++)
                CertificationsTokens.certificateImage(
                  context,
                  width: tileWidth,
                  height: tileHeight,
                ),
            ],
          ),
        ),
      ],
    );
  }
}
