import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../social_section_data.dart';
import '../social_tokens.dart';

/// Style 1 — inline row of filled brand icons + connect caption.
class MinimalSocialChipsStyle extends StatelessWidget {
  final SocialSectionData? data;

  const MinimalSocialChipsStyle({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    final items = SocialTokens.resolveItems(data);
    final iconSize = AppSizes.w(context, 0.105);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SocialTokens.sectionTitle(context, title: data?.title),
        SizedBox(height: SocialTokens.gapSm(context)),
        Padding(
          padding: SocialTokens.sectionPadding(context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (final item in items)
                SocialTokens.brandIconFilled(
                  context,
                  item: item,
                  size: iconSize,
                ),
            ],
          ),
        ),
        SizedBox(height: SocialTokens.gapSm(context)),
        Center(child: SocialTokens.connectCaption(context)),
        SizedBox(height: SocialTokens.gapXs(context)),
      ],
    );
  }
}
