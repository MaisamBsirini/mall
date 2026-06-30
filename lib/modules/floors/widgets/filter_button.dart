import 'package:flutter/material.dart';

import '../../shared/widgets/premium_circle_button.dart';
import '../../shared/widgets/search_header.dart';

/// Floors tab filter button — circular, burgundy outline.
class FilterButton extends StatelessWidget {
  final VoidCallback? onTap;

  const FilterButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final searchHeight = (width * 0.105).clamp(40.0, 44.0);
    final buttonSize = (searchHeight * 1.02).clamp(42.0, 46.0);

    return PremiumCircleButton(
      size: buttonSize,
      icon: Icons.tune_rounded,
      borderColor: null,
      borderWidth: 0.8,
      onTap: onTap ?? () {},
    );
  }
}

/// Floors tab header — search + filter.
class FloorsSearchHeader extends StatelessWidget {
  final VoidCallback? onFilterTap;

  const FloorsSearchHeader({super.key, this.onFilterTap});

  @override
  Widget build(BuildContext context) {
    return SearchHeader(
      trailing: [FilterButton(onTap: onFilterTap)],
    );
  }
}
