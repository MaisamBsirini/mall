import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../certifications_section_data.dart';
import '../certifications_tokens.dart';

/// Swipeable premium carousel through all certification images.
class PremiumCarouselStyle extends StatefulWidget {
  final CertificationsSectionData? data;

  const PremiumCarouselStyle({super.key, this.data});

  @override
  State<PremiumCarouselStyle> createState() => _PremiumCarouselStyleState();
}

class _PremiumCarouselStyleState extends State<PremiumCarouselStyle> {
  late final PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.88);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final items = CertificationsTokens.resolveItems(widget.data?.items);
    final images = items.allImages;
    if (images.isEmpty) return const SizedBox.shrink();

    final slideHeight = AppSizes.h(context, 0.30);
    final current = images[_currentPage.clamp(0, images.length - 1)];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CertificationsTokens.sectionTitle(context, title: widget.data?.title),
        SizedBox(height: CertificationsTokens.gapMd(context)),
        SizedBox(
          height: slideHeight,
          child: PageView.builder(
            controller: _pageController,
            itemCount: images.length,
            onPageChanged: (index) => setState(() => _currentPage = index),
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: CertificationsTokens.gapSm(context),
                ),
                child: CertificationsTokens.certificateImage(
                  context,
                  width: double.infinity,
                  height: slideHeight,
                  elevated: true,
                ),
              );
            },
          ),
        ),
        SizedBox(height: CertificationsTokens.gapSm(context)),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: CertificationsTokens.horizontalMargin(context),
          ),
          child: CertificationsTokens.itemTitle(
            context,
            title: current.item.title,
          ),
        ),
        SizedBox(height: CertificationsTokens.gapSm(context)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(images.length, (index) {
            final active = index == _currentPage;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: EdgeInsets.symmetric(
                horizontal: CertificationsTokens.gapXs(context) / 2,
              ),
              width: active ? 18 : 6,
              height: 6,
              decoration: BoxDecoration(
                color: active
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withValues(alpha: 0.25),
                borderRadius: BorderRadius.circular(3),
              ),
            );
          }),
        ),
      ],
    );
  }
}
