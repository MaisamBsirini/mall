import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../certification_item.dart';
import '../certifications_section_data.dart';
import '../certifications_tokens.dart';

/// Large featured image with thumbnail strip per certification item.
class AchievementGalleryStyle extends StatefulWidget {
  final CertificationsSectionData? data;

  const AchievementGalleryStyle({super.key, this.data});

  @override
  State<AchievementGalleryStyle> createState() =>
      _AchievementGalleryStyleState();
}

class _AchievementGalleryStyleState extends State<AchievementGalleryStyle> {
  int _itemIndex = 0;
  int _imageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final items = CertificationsTokens.resolveItems(widget.data?.items);
    if (items.isEmpty) return const SizedBox.shrink();

    final item = items[_itemIndex.clamp(0, items.length - 1)];
    final images = item.images.isNotEmpty ? item.images : ['placeholder'];
    final safeImageIndex = _imageIndex.clamp(0, images.length - 1);
    final featuredHeight = AppSizes.h(context, 0.28);
    final thumbSize = AppSizes.w(context, 0.18);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CertificationsTokens.sectionTitle(context, title: widget.data?.title),
        SizedBox(height: CertificationsTokens.gapMd(context)),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: CertificationsTokens.horizontalMargin(context),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CertificationsTokens.certificateImage(
                context,
                width: double.infinity,
                height: featuredHeight,
                elevated: true,
              ),
              if (images.length > 1) ...[
                SizedBox(height: CertificationsTokens.gapSm(context)),
                SizedBox(
                  height: thumbSize,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: images.length,
                    separatorBuilder: (_, __) =>
                        SizedBox(width: CertificationsTokens.gapSm(context)),
                    itemBuilder: (context, index) {
                      final selected = index == safeImageIndex;
                      return GestureDetector(
                        onTap: () => setState(() => _imageIndex = index),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          decoration: BoxDecoration(
                            borderRadius: CertificationsTokens.borderSm(context),
                            border: Border.all(
                              color: selected
                                  ? Theme.of(context).colorScheme.primary
                                  : Colors.transparent,
                              width: 2,
                            ),
                          ),
                          child: CertificationsTokens.certificateImage(
                            context,
                            width: thumbSize,
                            height: thumbSize,
                            framed: false,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
              SizedBox(height: CertificationsTokens.gapSm(context)),
              CertificationsTokens.itemTitle(context, title: item.title),
            ],
          ),
        ),
        SizedBox(height: CertificationsTokens.gapMd(context)),
        SizedBox(
          height: AppSizes.h(context, 0.06),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(
              horizontal: CertificationsTokens.horizontalMargin(context),
            ),
            itemCount: items.length,
            separatorBuilder: (_, __) =>
                SizedBox(width: CertificationsTokens.gapSm(context)),
            itemBuilder: (context, index) {
              final entry = items[index];
              final selected = index == _itemIndex;
              return _ItemChip(
                item: entry,
                selected: selected,
                onTap: () => setState(() {
                  _itemIndex = index;
                  _imageIndex = 0;
                }),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _ItemChip extends StatelessWidget {
  final CertificationItem item;
  final bool selected;
  final VoidCallback onTap;

  const _ItemChip({
    required this.item,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final size = AppSizes.w(context, 0.14);

    return GestureDetector(
      onTap: onTap,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 200),
        opacity: selected ? 1 : 0.55,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CertificationsTokens.certificateImage(
              context,
              width: size,
              height: size * 0.75,
              framed: false,
            ),
            SizedBox(height: CertificationsTokens.gapXs(context)),
            SizedBox(
              width: size + AppSizes.w(context, 0.04),
              child: CertificationsTokens.itemTitle(context, title: item.title),
            ),
          ],
        ),
      ),
    );
  }
}
