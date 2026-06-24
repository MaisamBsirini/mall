/// A single internal platform review.
class ReviewItem {
  final String id;
  final String reviewerName;
  final int rating;
  final String comment;
  final String? reviewerAvatarUrl;
  final String? createdAt;
  final bool? isVerified;
  final bool? isFeatured;
  final bool reportable;

  const ReviewItem({
    required this.id,
    required this.reviewerName,
    required this.rating,
    required this.comment,
    this.reviewerAvatarUrl,
    this.createdAt,
    this.isVerified,
    this.isFeatured,
    this.reportable = true,
  });

  factory ReviewItem.fromJson(Map<String, dynamic> json) {
    return ReviewItem(
      id: json['id'] as String,
      reviewerName: json['reviewer_name'] as String,
      rating: json['rating'] as int,
      comment: json['comment'] as String,
      reviewerAvatarUrl: json['reviewer_avatar_url'] as String?,
      createdAt: json['created_at'] as String?,
      isVerified: json['is_verified'] as bool?,
      isFeatured: json['is_featured'] as bool?,
      reportable: json['reportable'] as bool? ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'reviewer_name': reviewerName,
      'rating': rating,
      'comment': comment,
      if (reviewerAvatarUrl != null) 'reviewer_avatar_url': reviewerAvatarUrl,
      if (createdAt != null) 'created_at': createdAt,
      if (isVerified != null) 'is_verified': isVerified,
      if (isFeatured != null) 'is_featured': isFeatured,
      'reportable': reportable,
    };
  }
}
