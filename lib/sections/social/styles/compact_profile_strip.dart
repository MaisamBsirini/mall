import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../social_section_data.dart';
import '../social_tokens.dart';

/// Style 3 — smaller outline icons with generous whitespace.
class CompactProfileStripStyle extends StatelessWidget {
  final SocialSectionData? data;

  const CompactProfileStripStyle({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    final items = SocialTokens.resolveItems(data);
    final iconSize = AppSizes.w(context, 0.082);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SocialTokens.sectionTitle(context, title: data?.title),
        SizedBox(height: SocialTokens.gapSm(context) * 1.5),
        Padding(
          padding: SocialTokens.sectionPadding(context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              for (final item in items)
                SocialTokens.brandIconOutline(
                  context,
                  item: item,
                  size: iconSize,
                ),
            ],
          ),
        ),
        SizedBox(height: SocialTokens.gapSm(context) * 1.5),
      ],
    );
  }
}
