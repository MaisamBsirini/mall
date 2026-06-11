import 'package:flutter/material.dart';

import '../design_system/app_design_system.dart';
import '../design_system/scope/design_system_scope.dart';
import 'section_showcase.dart';
import 'showcase_presets.dart';

class UiShowcaseScreen extends StatefulWidget {
  const UiShowcaseScreen({super.key});

  @override
  State<UiShowcaseScreen> createState() => _UiShowcaseScreenState();
}

class _UiShowcaseScreenState extends State<UiShowcaseScreen> {
  String _themePresetId = ShowcaseThemePreset.all.first.id;
  String _typographyId = ShowcaseTypographyPreset.all.first.id;

  ShowcaseThemePreset get _themePreset =>
      ShowcaseThemePreset.get(_themePresetId);

  AppDesignSystem get _designSystem => AppDesignSystem.resolve(
        paletteId: _themePreset.paletteId,
        typographyId: _typographyId,
        themeId: _themePreset.themeId,
      );

  @override
  Widget build(BuildContext context) {
    return DesignSystemScope(
      designSystem: _designSystem,
      child: Builder(
        builder: (context) {
          final palette = context.ds.palette;
          final tokens = context.ds.tokens;

          return Theme(
            data: context.ds.toThemeData(),
            child: Scaffold(
              backgroundColor: palette.background,
              body: SafeArea(
                child: Column(
                  children: [
                    _DesignPlaygroundPanel(
                      themePresetId: _themePresetId,
                      typographyId: _typographyId,
                      onThemePresetChanged: (value) {
                        if (value != null) {
                          setState(() => _themePresetId = value);
                        }
                      },
                      onTypographyChanged: (value) {
                        if (value != null) {
                          setState(() => _typographyId = value);
                        }
                      },
                    ),
                    Expanded(
                      child: ListView(
                        padding: EdgeInsets.only(
                          top: tokens.gapMd(context),
                          bottom: tokens.sectionGap(context) * 3,
                        ),
                        children: const [
                          AllSectionsShowcase(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _DesignPlaygroundPanel extends StatelessWidget {
  final String themePresetId;
  final String typographyId;
  final ValueChanged<String?> onThemePresetChanged;
  final ValueChanged<String?> onTypographyChanged;

  const _DesignPlaygroundPanel({
    required this.themePresetId,
    required this.typographyId,
    required this.onThemePresetChanged,
    required this.onTypographyChanged,
  });

  @override
  Widget build(BuildContext context) {
    final palette = context.ds.palette;
    final tokens = context.ds.tokens;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: tokens.horizontalMargin(context),
        vertical: tokens.gapMd(context),
      ),
      decoration: BoxDecoration(
        color: palette.surface,
        border: Border(bottom: BorderSide(color: palette.border)),
        boxShadow: tokens.cardShadow(context),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Design Playground',
            style: context.ds.typography.heading(context),
          ),
          SizedBox(height: tokens.gapXs(context)),
          Text(
            'Scroll to compare every section style in one place.',
            style: context.ds.typography.caption(context),
          ),
          SizedBox(height: tokens.gapMd(context)),
          _SwitcherRow(
            label: 'Theme',
            value: themePresetId,
            items: ShowcaseThemePreset.all
                .map((p) => _SwitcherItem(id: p.id, name: p.name))
                .toList(),
            onChanged: onThemePresetChanged,
          ),
          SizedBox(height: tokens.gapSm(context)),
          _SwitcherRow(
            label: 'Typography',
            value: typographyId,
            items: ShowcaseTypographyPreset.all
                .map((t) => _SwitcherItem(id: t.id, name: t.name))
                .toList(),
            onChanged: onTypographyChanged,
          ),
        ],
      ),
    );
  }
}

class _SwitcherItem {
  final String id;
  final String name;

  const _SwitcherItem({required this.id, required this.name});
}

class _SwitcherRow extends StatelessWidget {
  final String label;
  final String value;
  final List<_SwitcherItem> items;
  final ValueChanged<String?> onChanged;

  const _SwitcherRow({
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final palette = context.ds.palette;

    return Row(
      children: [
        SizedBox(
          width: 90,
          child: Text(
            label,
            style: context.ds.typography.caption(context),
          ),
        ),
        Expanded(
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: palette.placeholderLight,
              borderRadius: context.ds.tokens.borderSm,
              border: Border.all(color: palette.border),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                isExpanded: true,
                value: value,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                borderRadius: context.ds.tokens.borderSm,
                dropdownColor: palette.surface,
                style: context.ds.typography.body(context),
                items: items
                    .map(
                      (item) => DropdownMenuItem<String>(
                        value: item.id,
                        child: Text(item.name),
                      ),
                    )
                    .toList(),
                onChanged: onChanged,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
