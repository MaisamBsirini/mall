import 'package:flutter/material.dart';

import 'section_showcase.dart';

class BannerShowcase extends StatelessWidget {
  const BannerShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return const SectionShowcaseById(sectionId: 'banner');
  }
}
