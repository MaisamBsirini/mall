import 'package:flutter/material.dart';

import 'section_showcase.dart';

class StaffShowcase extends StatelessWidget {
  const StaffShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return const SectionShowcaseById(sectionId: 'staff');
  }
}
