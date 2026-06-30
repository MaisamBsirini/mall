import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';
import '../certifications_section_data.dart';
import '../certifications_tokens.dart';

/// Overlapping peek cards — swipeable, bounded carousel height.
class PremiumCarouselStyle extends StatefulWidget {
  final CertificationsSectionData? data;

  const PremiumCarouselStyle({super.key, this.data});

  @override
  State<PremiumCarouselStyle> createState() => _PremiumCarouselStyleState();
}

class _PremiumCarouselStyleState extends State<PremiumCarouselStyle> {
  late final PageController _controller;
  int _page = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController(viewportFraction: 0.72);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final items = CertificationsTokens.resolveItems(widget.data?.items);
    final images = items.allImages;
    if (images.isEmpty) return const SizedBox.shrink();

    final height = CertificationsTokens.carouselHeight(context);
    final cardW = AppSizes.w(context, 0.36);
    final cardH = height * 0.78;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        CertificationsTokens.sectionTitle(context),
        SizedBox(height: CertificationsTokens.gapSm(context)),
        SizedBox(
          height: height,
          child: PageView.builder(
            controller: _controller,
            itemCount: images.length.clamp(1, 8),
            onPageChanged: (index) => setState(() => _page = index),
            itemBuilder: (context, index) {
              final active = index == _page;
              return AnimatedScale(
                scale: active ? 1.0 : 0.9,
                duration: const Duration(milliseconds: 200),
                child: Center(
                  child: CertificationsTokens.miniTile(
                    context,
                    width: cardW,
                    height: cardH,
                    selected: active,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
