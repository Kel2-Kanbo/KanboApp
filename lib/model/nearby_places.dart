import 'dart:convert';

class NearbyPlaces {
  int nearbyId;
  String title;
  double distance;
  int estimate;
  String category;

  NearbyPlaces({
    required this.nearbyId,
    required this.title,
    required this.distance,
    required this.estimate,
    required this.category,
  });

  NearbyPlaces copyWith({
    int? nearbyId,
    String? title,
    double? distance,
    int? estimate,
    String? category,
  }) {
    return NearbyPlaces(
      nearbyId: nearbyId ?? this.nearbyId,
      title: title ?? this.title,
      distance: distance ?? this.distance,
      estimate: estimate ?? this.estimate,
      category: category ?? this.category,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'nearbyId': nearbyId});
    result.addAll({'title': title});
    result.addAll({'distance': distance});
    result.addAll({'estimate': estimate});
    result.addAll({'category': category});
  
    return result;
  }

  factory NearbyPlaces.fromMap(Map<String, dynamic> map) {
    return NearbyPlaces(
      nearbyId: map['nearbyId']?.toInt() ?? 0,
      title: map['title'] ?? '',
      distance: map['distance']?.toDouble() ?? 0.0,
      estimate: map['estimate']?.toInt() ?? 0,
      category: map['category'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory NearbyPlaces.fromJson(String source) => NearbyPlaces.fromMap(json.decode(source));

  @override
  String toString() {
    return 'NearbyPlaces(nearbyId: $nearbyId, title: $title, distance: $distance, estimate: $estimate, category: $category)';
  }
}
