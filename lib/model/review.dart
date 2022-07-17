import 'dart:convert';

class Review {
  int reviewId;
  int userId;
  int roomId;
  String review;
  double rating;
  DateTime timestamp;
  Review({
    required this.reviewId,
    required this.userId,
    required this.roomId,
    required this.review,
    required this.rating,
    required this.timestamp,
  });

  Review copyWith({
    int? reviewId,
    int? userId,
    int? roomId,
    String? review,
    double? rating,
    DateTime? timestamp,
  }) {
    return Review(
      reviewId: reviewId ?? this.reviewId,
      userId: userId ?? this.userId,
      roomId: roomId ?? this.roomId,
      review: review ?? this.review,
      rating: rating ?? this.rating,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'reviewId': reviewId});
    result.addAll({'userId': userId});
    result.addAll({'roomId': roomId});
    result.addAll({'review': review});
    result.addAll({'rating': rating});
    result.addAll({'timestamp': timestamp.millisecondsSinceEpoch});

    return result;
  }

  factory Review.fromMap(Map<String, dynamic> map) {
    return Review(
      reviewId: map['reviewId']?.toInt() ?? 0,
      userId: map['userId']?.toInt() ?? 0,
      roomId: map['roomId']?.toInt() ?? 0,
      review: map['review'] ?? '',
      rating: map['rating']?.toDouble() ?? 0.0,
      timestamp: DateTime.fromMillisecondsSinceEpoch(map['timestamp']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Review.fromJson(String source) => Review.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Review(reviewId: $reviewId, userId: $userId, roomId: $roomId, review: $review, rating: $rating, timestamp: $timestamp)';
  }
}
