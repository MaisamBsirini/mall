import 'package:flutter/material.dart';

import 'section_showcase.dart';

class CollectionsShowcase extends StatelessWidget {
  const CollectionsShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return const SectionShowcaseById(sectionId: 'collections');
  }
}
