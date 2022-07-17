import 'dart:convert';

import 'package:kanbo/model/review.dart';

class ReviewResponse {
  int roomId;
  double rating;
  int review;
  List<Review> listReview;
  ReviewResponse({
    this.roomId = 0,
    this.rating = 0,
    this.review = 0,
    this.listReview = const [],
  });

  ReviewResponse copyWith({
    int? roomId,
    double? rating,
    int? review,
    List<Review>? listReview,
  }) {
    return ReviewResponse(
      roomId: roomId ?? this.roomId,
      rating: rating ?? this.rating,
      review: review ?? this.review,
      listReview: listReview ?? this.listReview,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'roomId': roomId});
    result.addAll({'rating': rating});
    result.addAll({'review': review});
    result.addAll({'listReview': listReview.map((x) => x.toMap()).toList()});

    return result;
  }

  factory ReviewResponse.fromMap(Map<String, dynamic> map) {
    return ReviewResponse(
      roomId: map['roomId']?.toInt() ?? 0,
      rating: map['rating']?.toDouble() ?? 0.0,
      review: map['review']?.toInt() ?? 0,
      listReview:
          List<Review>.from(map['listReview']?.map((x) => Review.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ReviewResponse.fromJson(String source) =>
      ReviewResponse.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ReviewResponse(roomId: $roomId, rating: $rating, review: $review, listReview: $listReview)';
  }
}
