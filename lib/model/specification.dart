import 'dart:convert';

class Specification {
  int roomId;
  int capacity;
  double luas;
  String table;
  int floor;
  Specification({
    this.capacity = 0,
    this.roomId = 0,
    this.luas = 0,
    this.table = '',
    this.floor = 0,
  });

  Specification copyWith({
    int? roomId,
    int? capacity,
    double? luas,
    String? table,
    int? floor,
  }) {
    return Specification(
      roomId: roomId ?? this.roomId,
      capacity: capacity ?? this.capacity,
      luas: luas ?? this.luas,
      table: table ?? this.table,
      floor: floor ?? this.floor,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'roomId': roomId});
    result.addAll({'capacity': capacity});
    result.addAll({'luas': luas});
    result.addAll({'table': table});
    result.addAll({'floor': floor});

    return result;
  }

  factory Specification.fromMap(Map<String, dynamic> map) {
    return Specification(
      roomId: map['roomId']?.toInt() ?? 0,
      capacity: map['capacity']?.toInt() ?? 0,
      luas: map['luas']?.toDouble() ?? 0.0,
      table: map['table'] ?? '',
      floor: map['floor']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Specification.fromJson(String source) =>
      Specification.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Specification(roomId: $roomId, capacity: $capacity, luas: $luas, table: $table, floor: $floor)';
  }
}
