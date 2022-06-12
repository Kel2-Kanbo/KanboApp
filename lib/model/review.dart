import 'dart:convert';

Review reviewFromJson(String str) => Review.fromJson(json.decode(str));

String reviewToJson(Review data) => json.encode(data.toJson());

class Review {
  int reviewId;
  int userId;
  int roomId;
  String review;
  
  Review({
    this.reviewId = 0,
    this.userId = 0,
    this.roomId = 0,
    this.review = '',
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        reviewId: json["review_id"],
        userId: json["user_id"],
        roomId: json["room_id"],
        review: json["review"],
      );

  Map<String, dynamic> toJson() => {
        "review_id": reviewId,
        "user_id": userId,
        "room_id": roomId,
        "review": review,
      };
}
