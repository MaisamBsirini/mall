import 'package:flutter/material.dart';

import '../design_system/scope/design_system_scope.dart';
import '../sections/section_registry.dart';
import '../sections/sections_catalog.dart';
import 'showcase_shared.dart';

/// Renders every style for a single [SectionRegistry] entry.
class SectionShowcase extends StatelessWidget {
  final SectionRegistry section;

  const SectionShowcase({
    super.key,
    required this.section,
  });

  @override
  Widget build(BuildContext context) {
    final tokens = context.ds.tokens;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShowcaseSectionHeader(
          label: section.showcaseTitle,
          styleCount: section.styleCount,
        ),
        SizedBox(height: tokens.gapLg(context)),
        ...section.styles.map(
          (styleId) => ShowcaseStyleBlock(
            styleId: styleId,
            child: section.buildStyle(styleId),
          ),
        ),
      ],
    );
  }
}

/// Iterates [SectionsCatalog.all] and renders every registered section and style.
class AllSectionsShowcase extends StatelessWidget {
  const AllSectionsShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    final sections = SectionsCatalog.all;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var i = 0; i < sections.length; i++) ...[
          SectionShowcase(section: sections[i]),
          if (i < sections.length - 1) const ShowcaseSectionDivider(),
        ],
      ],
    );
  }
}

/// Renders a single section from [SectionsCatalog] by [sectionId].
class SectionShowcaseById extends StatelessWidget {
  final String sectionId;

  const SectionShowcaseById({
    super.key,
    required this.sectionId,
  });

  @override
  Widget build(BuildContext context) {
    final section = SectionsCatalog.findById(sectionId);

    if (section == null) {
      return const SizedBox.shrink();
    }

    return SectionShowcase(section: section);
  }
}
