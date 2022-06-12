import 'dart:convert';

Room roomFromJson(String str) => Room.fromJson(json.decode(str));

String roomToJson(Room data) => json.encode(data.toJson());

class Room {
  int roomId;
  int buildingId;
  String roomName;
  double pricePerDay;
  String floor;
  String thumbnail;
  String description;

  Room({
    this.roomId = 0,
    this.buildingId = 0,
    this.roomName = '',
    this.pricePerDay = 0,
    this.floor = '',
    this.thumbnail = '',
    this.description = '',
  });

  factory Room.fromJson(Map<String, dynamic> json) => Room(
        roomId: json["room_id"],
        buildingId: json["building_id"],
        roomName: json["room_name"],
        pricePerDay: json["price_per_day"].toDouble(),
        floor: json["floor"],
        thumbnail: json["thumbnail"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "room_id": roomId,
        "building_id": buildingId,
        "room_name": roomName,
        "price_per_day": pricePerDay,
        "floor": floor,
        "thumbnail": thumbnail,
        "description": description,
      };
}
