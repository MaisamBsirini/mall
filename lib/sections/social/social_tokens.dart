import 'package:flutter/material.dart';

import '../../design_system/scope/design_system_scope.dart';
import 'social_item.dart';
import 'social_section_data.dart';

class SocialTokens {
  SocialTokens._();

  static const List<SocialItem> mockItems = [
    SocialItem(
      platform: 'instagram',
      profileUrl: 'https://instagram.com/store',
    ),
    SocialItem(
      platform: 'facebook',
      profileUrl: 'https://facebook.com/store',
    ),
    SocialItem(
      platform: 'tiktok',
      profileUrl: 'https://tiktok.com/@store',
    ),
    SocialItem(
      platform: 'youtube',
      profileUrl: 'https://youtube.com/@store',
    ),
    SocialItem(
      platform: 'x',
      profileUrl: 'https://x.com/store',
    ),
  ];

  static List<SocialItem> resolveItems(SocialSectionData? data) {
    if (data != null && data.items.isNotEmpty) return data.items;
    return mockItems;
  }

  static String labelForPlatform(String platform) {
    return switch (platform) {
      'instagram' => 'Instagram',
      'facebook' => 'Facebook',
      'tiktok' => 'TikTok',
      'youtube' => 'YouTube',
      'linkedin' => 'LinkedIn',
      'x' => 'X',
      'pinterest' => 'Pinterest',
      _ => platform[0].toUpperCase() + platform.substring(1),
    };
  }

  static Color accentForPlatform(String platform) {
    return switch (platform) {
      'instagram' => const Color(0xFFE1306C),
      'facebook' => const Color(0xFF1877F2),
      'tiktok' => const Color(0xFF111111),
      'youtube' => const Color(0xFFFF0000),
      'linkedin' => const Color(0xFF0A66C2),
      'x' => const Color(0xFF111111),
      'pinterest' => const Color(0xFFE60023),
      _ => const Color(0xFF64748B),
    };
  }

  static IconData iconForPlatform(String platform) {
    return switch (platform) {
      'instagram' => Icons.camera_alt_rounded,
      'facebook' => Icons.facebook,
      'tiktok' => Icons.music_note_rounded,
      'youtube' => Icons.play_arrow_rounded,
      'linkedin' => Icons.business_center_outlined,
      'x' => Icons.close_rounded,
      'pinterest' => Icons.push_pin_outlined,
      _ => Icons.link_rounded,
    };
  }

  static EdgeInsets sectionPadding(BuildContext context) =>
      context.ds.tokens.sectionPadding(context);

  static double gapXs(BuildContext context) =>
      context.ds.tokens.gapXs(context);

  static double gapSm(BuildContext context) =>
      context.ds.tokens.gapSm(context);

  static double gapMd(BuildContext context) =>
      context.ds.tokens.gapMd(context);

  static BorderRadius borderSm(BuildContext context) =>
      context.ds.tokens.borderSm;

  static BorderRadius borderMd(BuildContext context) =>
      context.ds.tokens.borderMd;

  static BorderRadius borderLg(BuildContext context) =>
      context.ds.tokens.borderLg;

  static List<BoxShadow> bubbleShadow(BuildContext context) => [
        BoxShadow(
          color: context.ds.palette.overlayDark.withValues(alpha: 0.10),
          blurRadius: 12,
          offset: const Offset(0, 4),
        ),
      ];

  static Widget sectionTitle(BuildContext context, {String? title}) {
    return Padding(
      padding: sectionPadding(context),
      child: Text(
        title ?? 'Follow Us',
        style: context.ds.typography.title(context).copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
      ),
    );
  }

  static Widget connectCaption(BuildContext context) {
    final palette = context.ds.palette;

    return Text(
      '♡  Stay connected with us',
      style: context.ds.typography.caption(context).copyWith(
            color: palette.textSecondary,
            fontSize: 11,
          ),
    );
  }

  /// Filled brand-color circle with white icon (inline row style).
  static Widget brandIconFilled(
    BuildContext context, {
    required SocialItem item,
    required double size,
  }) {
    final accent = accentForPlatform(item.platform);

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: accent,
        boxShadow: [
          BoxShadow(
            color: accent.withValues(alpha: 0.25),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Icon(
        iconForPlatform(item.platform),
        size: size * 0.48,
        color: Colors.white,
      ),
    );
  }

  /// Outline/minimal brand icon.
  static Widget brandIconOutline(
    BuildContext context, {
    required SocialItem item,
    required double size,
  }) {
    final accent = accentForPlatform(item.platform);
    final palette = context.ds.palette;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: palette.surface,
        border: Border.all(color: accent.withValues(alpha: 0.35)),
      ),
      child: Icon(
        iconForPlatform(item.platform),
        size: size * 0.44,
        color: accent,
      ),
    );
  }

  static Widget iconChip(
    BuildContext context, {
    required SocialItem item,
    required double height,
  }) {
    final accent = accentForPlatform(item.platform);
    final palette = context.ds.palette;

    return Container(
      height: height,
      padding: EdgeInsets.symmetric(horizontal: gapSm(context)),
      decoration: BoxDecoration(
        color: accent.withValues(alpha: 0.08),
        borderRadius: borderLg(context),
        border: Border.all(color: accent.withValues(alpha: 0.15)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            iconForPlatform(item.platform),
            size: height * 0.44,
            color: accent,
          ),
          SizedBox(width: gapXs(context)),
          Text(
            labelForPlatform(item.platform),
            style: context.ds.typography.caption(context).copyWith(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: palette.textPrimary,
                ),
          ),
        ],
      ),
    );
  }

  static Widget floatingBubble(
    BuildContext context, {
    required SocialItem item,
    required double size,
  }) {
    final accent = accentForPlatform(item.platform);
    final palette = context.ds.palette;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: palette.surface,
        boxShadow: bubbleShadow(context),
        border: Border.all(color: accent.withValues(alpha: 0.12)),
      ),
      child: Icon(
        iconForPlatform(item.platform),
        size: size * 0.46,
        color: accent,
      ),
    );
  }
}
