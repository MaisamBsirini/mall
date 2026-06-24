/// A link to an external social profile.
class SocialItem {
  final String platform;
  final String profileUrl;

  const SocialItem({
    required this.platform,
    required this.profileUrl,
  });

  factory SocialItem.fromJson(Map<String, dynamic> json) {
    return SocialItem(
      platform: json['platform'] as String,
      profileUrl: json['profile_url'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'platform': platform,
      'profile_url': profileUrl,
    };
  }
}
