import 'package:flutter/material.dart';

import '../../shared/widgets/search_header.dart';

/// Home top bar — re-exports shared [HomeSearchHeader] for backward compatibility.
class TopBarSection extends StatelessWidget {
  final int notificationCount;
  final VoidCallback? onNotificationsTap;
  final VoidCallback? onProfileTap;

  const TopBarSection({
    super.key,
    this.notificationCount = 0,
    this.onNotificationsTap,
    this.onProfileTap,
  });

  @override
  Widget build(BuildContext context) {
    return HomeSearchHeader(
      notificationCount: notificationCount,
      onNotificationsTap: onNotificationsTap,
      onProfileTap: onProfileTap,
    );
  }
}
