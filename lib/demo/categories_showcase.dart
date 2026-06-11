import 'package:flutter/material.dart';

import 'section_showcase.dart';

class CategoriesShowcase extends StatelessWidget {
  const CategoriesShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return const SectionShowcaseById(sectionId: 'categories');
  }
}
