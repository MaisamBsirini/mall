import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../social_section_data.dart';
import '../social_tokens.dart';

/// Style 5 — floating bubble icons with soft drop shadows.
class BottomSocialDockStyle extends StatelessWidget {
  final SocialSectionData? data;

  const BottomSocialDockStyle({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    final items = SocialTokens.resolveItems(data);
    final bubbleSize = AppSizes.w(context, 0.105);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SocialTokens.sectionTitle(context, title: data?.title),
        SizedBox(height: SocialTokens.gapMd(context)),
        Padding(
          padding: SocialTokens.sectionPadding(context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (final item in items)
                SocialTokens.floatingBubble(
                  context,
                  item: item,
                  size: bubbleSize,
                ),
            ],
          ),
        ),
        SizedBox(height: SocialTokens.gapSm(context)),
        Center(child: SocialTokens.connectCaption(context)),
      ],
    );
  }
}
