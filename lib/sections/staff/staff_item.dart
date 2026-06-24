/// A team member profile for presentation-only staff sections.
class StaffItem {
  final String id;
  final String fullName;
  final String role;
  final String profileImageUrl;
  final String? shortBio;

  const StaffItem({
    required this.id,
    required this.fullName,
    required this.role,
    required this.profileImageUrl,
    this.shortBio,
  });

  factory StaffItem.fromJson(Map<String, dynamic> json) {
    return StaffItem(
      id: json['id'] as String,
      fullName: json['full_name'] as String,
      role: json['role'] as String,
      profileImageUrl: json['profile_image_url'] as String,
      shortBio: json['short_bio'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'full_name': fullName,
      'role': role,
      'profile_image_url': profileImageUrl,
      if (shortBio != null) 'short_bio': shortBio,
    };
  }
}
