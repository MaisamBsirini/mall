import 'package:flutter/material.dart';

import '../styles/media/card_gallery.dart';
import '../styles/media/hero_full_width.dart';
import '../styles/media/image_carousel.dart';
import '../styles/media/stacked_gallery.dart';
import '../styles/media/swipe_gallery.dart';
import 'styles.dart';

/// Style registry for the Media section — maps styleId → widget.
abstract final class MediaSectionRenderer {
  static const sectionId = 'media';

  static Widget build(String styleId) {
    return _builders[styleId]?.call() ?? const _UnknownMediaStyle();
  }

  static final Map<String, Widget Function()> _builders = {
    MediaStyleId.heroFullWidth: () => const HeroFullWidthMedia(),
    MediaStyleId.imageCarousel: () => const ImageCarouselMedia(),
    MediaStyleId.swipeGallery: () => const SwipeGalleryMedia(),
    MediaStyleId.stackedGallery: () => const StackedGalleryMedia(),
    MediaStyleId.cardGallery: () => const CardGalleryMedia(),
  };
}

class _UnknownMediaStyle extends StatelessWidget {
  const _UnknownMediaStyle();

  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}
