import 'package:flutter/material.dart';

import '../../marketplace_home/l10n/home_strings.dart';
import 'premium_circle_button.dart';
import 'premium_search_field.dart';

/// Search bar row with configurable trailing actions.
class SearchHeader extends StatelessWidget {
  final List<Widget> trailing;

  const SearchHeader({
    super.key,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final searchHeight = (width * 0.105).clamp(40.0, 44.0);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.045),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: PremiumSearchField(
              hint: HomeStrings.searchHint(context),
              height: searchHeight,
            ),
          ),
          for (var i = 0; i < trailing.length; i++) ...[
            SizedBox(width: i == 0 ? width * 0.028 : width * 0.022),
            trailing[i],
          ],
        ],
      ),
    );
  }
}

/// Home tab header — search + notifications + profile.
class HomeSearchHeader extends StatelessWidget {
  final int notificationCount;
  final VoidCallback? onNotificationsTap;
  final VoidCallback? onProfileTap;

  const HomeSearchHeader({
    super.key,
    this.notificationCount = 0,
    this.onNotificationsTap,
    this.onProfileTap,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final searchHeight = (width * 0.105).clamp(40.0, 44.0);
    final buttonSize = (searchHeight * 1.02).clamp(42.0, 46.0);

    return SearchHeader(
      trailing: [
        PremiumCircleButton(
          size: buttonSize,
          icon: Icons.notifications_none_rounded,
          badgeCount: notificationCount,
          onTap: onNotificationsTap ?? () {},
        ),
        PremiumCircleButton(
          size: buttonSize,
          icon: Icons.person_outline_rounded,
          onTap: onProfileTap ?? () {},
        ),
      ],
    );
  }
}
