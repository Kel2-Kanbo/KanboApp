import 'dart:convert';

import 'package:kanbo/model/review_response.dart';

import 'specification.dart';

class Room {
  int roomId;
  int officeId;
  String title;
  int pricePerDay;
  List<String> thumbnails;
  List<String> facilities;
  String description;
  Specification specification;
  ReviewResponse review;
  Room({
    this.roomId = 0,
    this.officeId = 0,
    this.title = '',
    this.pricePerDay = 0,
    this.thumbnails = const [],
    this.facilities = const [],
    this.description = '',
    required this.specification,
    required this.review,
  });

  Room copyWith({
    int? roomId,
    int? officeId,
    String? title,
    int? pricePerDay,
    List<String>? thumbnails,
    List<String>? facilities,
    String? description,
    Specification? specification,
    ReviewResponse? review,
  }) {
    return Room(
      roomId: roomId ?? this.roomId,
      officeId: officeId ?? this.officeId,
      title: title ?? this.title,
      pricePerDay: pricePerDay ?? this.pricePerDay,
      thumbnails: thumbnails ?? this.thumbnails,
      facilities: facilities ?? this.facilities,
      description: description ?? this.description,
      specification: specification ?? this.specification,
      review: review ?? this.review,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'roomId': roomId});
    result.addAll({'officeId': officeId});
    result.addAll({'roomName': title});
    result.addAll({'pricePerDay': pricePerDay});
    result.addAll({'thumbnails': thumbnails});
    result.addAll({'facilities': facilities});
    result.addAll({'description': description});
    result.addAll({'specification': specification.toMap()});
    result.addAll({'review': review.toMap()});

    return result;
  }

  factory Room.fromMap(Map<String, dynamic> map) {
    return Room(
      roomId: map['roomId']?.toInt() ?? 0,
      officeId: map['officeId']?.toInt() ?? 0,
      title: map['roomName'] ?? '',
      pricePerDay: map['pricePerDay']?.toDouble() ?? 0.0,
      thumbnails: List<String>.from(map['thumbnails']),
      facilities: List<String>.from(map['facilities']),
      description: map['description'] ?? '',
      specification: Specification.fromMap(map['specification']),
      review: ReviewResponse.fromMap(map['review']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Room.fromJson(String source) => Room.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Room(roomId: $roomId, officeId: $officeId, roomName: $title, pricePerDay: $pricePerDay, thumbnails: $thumbnails, facilities: $facilities, description: $description, specification: $specification, review: $review)';
  }
}
