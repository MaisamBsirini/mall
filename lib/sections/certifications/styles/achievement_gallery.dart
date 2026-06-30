import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../certifications_section_data.dart';
import '../certifications_tokens.dart';

/// Spotlight pager — one featured mini tile with dot indicators, fixed height.
class AchievementGalleryStyle extends StatefulWidget {
  final CertificationsSectionData? data;

  const AchievementGalleryStyle({super.key, this.data});

  @override
  State<AchievementGalleryStyle> createState() =>
      _AchievementGalleryStyleState();
}

class _AchievementGalleryStyleState extends State<AchievementGalleryStyle> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final items = CertificationsTokens.resolveItems(widget.data?.items);
    final images = items.allImages;
    if (images.isEmpty) return const SizedBox.shrink();

    final height = CertificationsTokens.carouselHeight(context);
    final tileW = AppSizes.w(context, 0.42);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        CertificationsTokens.sectionTitle(context),
        SizedBox(height: CertificationsTokens.gapSm(context)),
        SizedBox(
          height: height,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: CertificationsTokens.horizontalMargin(context),
            ),
            child: Column(
              children: [
                Expanded(
                  child: Center(
                    child: CertificationsTokens.miniTile(
                      context,
                      width: tileW,
                      height: height * 0.72,
                      selected: true,
                    ),
                  ),
                ),
                SizedBox(height: CertificationsTokens.gapXs(context)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(images.length.clamp(1, 8), (i) {
                    final active = i == _index % images.length;
                    final palette = Theme.of(context).colorScheme;
                    return GestureDetector(
                      onTap: () => setState(() => _index = i),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 180),
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        width: active ? 14 : 5,
                        height: 5,
                        decoration: BoxDecoration(
                          color: active
                              ? palette.primary
                              : palette.onSurface.withValues(alpha: 0.22),
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
