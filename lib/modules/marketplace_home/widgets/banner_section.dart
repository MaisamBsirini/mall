import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../models/home_banner_model.dart';
import '../l10n/home_strings.dart';
import '../theme/home_colors.dart';
import '../theme/home_typography.dart';

class BannerSection extends StatefulWidget {
  final List<HomeBannerModel> banners;

  const BannerSection({
    super.key,
    required this.banners,
  });

  @override
  State<BannerSection> createState() => _BannerSectionState();
}

class _BannerSectionState extends State<BannerSection> {
  int _activeIndex = 0;
  final _carouselController = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    if (widget.banners.isEmpty) return const SizedBox.shrink();

    final rtl = HomeStrings.isRtl(context);
    final screenWidth = MediaQuery.sizeOf(context).width;
    final bannerHeight = (screenWidth * 0.4).clamp(128.0, 158.0);

    return Column(
      children: [
        CarouselSlider.builder(
          carouselController: _carouselController,
          itemCount: widget.banners.length,
          options: CarouselOptions(
            height: bannerHeight,
            viewportFraction: 0.96,
            padEnds: false,
            enlargeCenterPage: false,
            autoPlay: widget.banners.length > 1,
            autoPlayInterval: const Duration(seconds: 5),
            autoPlayAnimationDuration: const Duration(milliseconds: 700),
            autoPlayCurve: Curves.easeOutCubic,
            onPageChanged: (index, _) => setState(() => _activeIndex = index),
          ),
          itemBuilder: (context, index, _) {
            return AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: index == _activeIndex ? 1 : 0.93,
              child: _BannerCard(
                banner: widget.banners[index],
                rtl: rtl,
                height: bannerHeight,
              ),
            );
          },
        ),
        SizedBox(height: screenWidth * 0.032),
        AnimatedSmoothIndicator(
          activeIndex: _activeIndex,
          count: widget.banners.length,
          effect: const WormEffect(
            dotHeight: 5,
            dotWidth: 5,
            spacing: 5,
            radius: 3,
            activeDotColor: HomeColors.primary,
            dotColor: Color(0xFFE8DED8),
          ),
          onDotClicked: (index) => _carouselController.animateToPage(index),
        ),
      ],
    );
  }
}

class _BannerCard extends StatelessWidget {
  final HomeBannerModel banner;
  final bool rtl;
  final double height;

  const _BannerCard({
    required this.banner,
    required this.rtl,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    final title = rtl ? banner.titleAr : banner.titleEn;
    final description = rtl ? banner.descriptionAr : banner.descriptionEn;
    final cta = rtl ? banner.ctaAr : banner.ctaEn;
    final tag = rtl ? banner.tagAr : banner.tagEn;
    final horizontalPad = MediaQuery.sizeOf(context).width * 0.018;

    return Container(
      height: height,
      margin: EdgeInsets.symmetric(horizontal: horizontalPad),
      decoration: BoxDecoration(
        color: HomeColors.bannerSurface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: HomeColors.bannerBorder,
          width: 0.5,
        ),
        boxShadow: HomeColors.softElevation(blur: 20, y: 5),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          const _BannerInnerDecor(),
          Row(
            textDirection: rtl ? TextDirection.rtl : TextDirection.ltr,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 50,
                child: _BannerImagePlaceholder(
                  icon: banner.imageIcon,
                  gradient: banner.imageGradient,
                ),
              ),
              Expanded(
                flex: 50,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(14, 18, 14, 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(tag, style: HomeTypography.bannerTag(context)),
                      const SizedBox(height: 6),
                      Flexible(
                        child: Text(
                          title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: HomeTypography.bannerTitle(context),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Flexible(
                        child: Text(
                          description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: HomeTypography.bannerDescription(context),
                        ),
                      ),
                      const SizedBox(height: 16),
                      _CtaButton(label: cta, rtl: rtl),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _BannerInnerDecor extends StatelessWidget {
  const _BannerInnerDecor();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final w = constraints.maxWidth;
        final h = constraints.maxHeight;

        return Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              right: w * 0.06,
              top: h * 0.08,
              child: Container(
                width: w * 0.22,
                height: w * 0.22,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: HomeColors.bannerDecor.withValues(alpha: 0.55),
                ),
              ),
            ),
            Positioned(
              right: w * 0.18,
              bottom: h * 0.12,
              child: Container(
                width: w * 0.12,
                height: w * 0.12,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: HomeColors.bannerDecor.withValues(alpha: 0.4),
                ),
              ),
            ),
            Positioned(
              left: w * 0.42,
              top: h * 0.15,
              child: Container(
                width: w * 0.35,
                height: 1,
                color: HomeColors.bannerDecor.withValues(alpha: 0.45),
              ),
            ),
            Positioned(
              left: w * 0.48,
              bottom: h * 0.22,
              child: Container(
                width: w * 0.28,
                height: 1,
                color: HomeColors.bannerDecor.withValues(alpha: 0.35),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _BannerImagePlaceholder extends StatelessWidget {
  final IconData icon;
  final List<Color> gradient;

  const _BannerImagePlaceholder({
    required this.icon,
    required this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              gradient.first.withValues(alpha: 0.85),
              gradient.last.withValues(alpha: 0.75),
            ],
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              bottom: 18,
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: HomeColors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            Icon(
              icon,
              size: 46,
              color: HomeColors.primary.withValues(alpha: 0.26),
            ),
          ],
        ),
      ),
    );
  }
}

class _CtaButton extends StatelessWidget {
  final String label;
  final bool rtl;

  const _CtaButton({
    required this.label,
    required this.rtl,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: HomeColors.primary,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(14),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(label, style: HomeTypography.bannerCta(context)),
              const SizedBox(width: 4),
              Icon(
                rtl
                    ? Icons.arrow_back_ios_new_rounded
                    : Icons.arrow_forward_ios_rounded,
                size: 9,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
