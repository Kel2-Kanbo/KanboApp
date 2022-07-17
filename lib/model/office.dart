import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'nearby_places.dart';
import 'room.dart';

class Office {
  int officeId;
  int review;
  double rating;
  String title; 
  String address;
  String description;
  String longAddress;
  String image;
  List<NearbyPlaces> nearbyPlaces;
  List<Room> listRoom;

  Office({
    required this.officeId,
    required this.review,
    required this.rating,
    required this.title,
    required this.address,
    required this.description,
    required this.longAddress,
    required this.image,
    required this.nearbyPlaces,
    required this.listRoom,
  });

  Office copyWith({
    int? officeId,
    int? review,
    double? rating,
    String? title,
    String? address,
    String? description,
    String? longAddress,
    String? image,
    List<NearbyPlaces>? nearbyPlaces,
    List<Room>? listRoom,
  }) {
    return Office(
      officeId: officeId ?? this.officeId,
      review: review ?? this.review,
      rating: rating ?? this.rating,
      title: title ?? this.title,
      address: address ?? this.address,
      description: description ?? this.description,
      longAddress: longAddress ?? this.longAddress,
      image: image ?? this.image,
      nearbyPlaces: nearbyPlaces ?? this.nearbyPlaces,
      listRoom: listRoom ?? this.listRoom,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'officeId': officeId});
    result.addAll({'review': review});
    result.addAll({'rating': rating});
    result.addAll({'title': title});
    result.addAll({'address': address});
    result.addAll({'description': description});
    result.addAll({'longAddress': longAddress});
    result.addAll({'image': image});
    result.addAll({'nearbyPlaces': nearbyPlaces.map((x) => x.toMap()).toList()});
    result.addAll({'listRoom': listRoom.map((x) => x.toJson()).toList()});
  
    return result;
  }

  factory Office.fromMap(Map<String, dynamic> map) {
    return Office(
      officeId: map['officeId']?.toInt() ?? 0,
      review: map['review']?.toInt() ?? 0,
      rating: map['rating']?.toDouble() ?? 0.0,
      title: map['title'] ?? '',
      address: map['address'] ?? '',
      description: map['description'] ?? '',
      longAddress: map['longAddress'] ?? '',
      image: map['image'] ?? '',
      nearbyPlaces: List<NearbyPlaces>.from(map['nearbyPlaces']?.map((x) => NearbyPlaces.fromMap(x))),
      listRoom: List<Room>.from(map['listRoom']?.map((x) => Room.fromJson(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Office.fromJson(String source) => Office.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Office(officeId: $officeId, review: $review, rating: $rating, title: $title, address: $address, description: $description, longAddress: $longAddress, image: $image, nearbyPlaces: $nearbyPlaces, listRoom: $listRoom)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Office &&
      other.officeId == officeId &&
      other.review == review &&
      other.rating == rating &&
      other.title == title &&
      other.address == address &&
      other.description == description &&
      other.longAddress == longAddress &&
      other.image == image &&
      listEquals(other.nearbyPlaces, nearbyPlaces) &&
      listEquals(other.listRoom, listRoom);
  }

  @override
  int get hashCode {
    return officeId.hashCode ^
      review.hashCode ^
      rating.hashCode ^
      title.hashCode ^
      address.hashCode ^
      description.hashCode ^
      longAddress.hashCode ^
      image.hashCode ^
      nearbyPlaces.hashCode ^
      listRoom.hashCode;
  }
}
