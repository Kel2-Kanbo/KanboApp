import 'dart:convert';

import 'package:intl/intl.dart';

import 'package:kanbo/model/payment.dart';
import 'package:kanbo/model/room.dart';

class Order {
  int orderId;
  DateTime? startDate;
  DateTime? endDate;
  int duration;
  String name;
  String email;
  String phoneNumber;
  int totalPrice;
  Room room;
  Payment payment;

  Order({
    this.orderId = 0,
    this.startDate,
    this.endDate,
    this.duration = 0,
    this.name = '',
    this.email = '',
    this.phoneNumber = '',
    this.totalPrice = 0,
    required this.room,
    required this.payment
  });
  String getDateRange() {
    String result = '-';
    if (startDate != null && endDate != null) {
      final dateFormat = DateFormat('EEEE, dd MMMM yyyy');
      final String start = dateFormat.format(startDate!);
      final String end = dateFormat.format(endDate!);
      result = duration == 1 ? start : '$start - $end';
    }
    return result;
  }

  Order copyWith({
    int? orderId,
    DateTime? startDate,
    DateTime? endDate,
    int? duration,
    String? name,
    String? email,
    String? phoneNumber,
    int? totalPrice,
    Room? room,
    Payment? payment,
  }) {
    return Order(
      orderId: orderId ?? this.orderId,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      duration: duration ?? this.duration,
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      totalPrice: totalPrice ?? this.totalPrice,
      room: room ?? this.room,
      payment: payment ?? this.payment,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'orderId': orderId});
    if(startDate != null){
      result.addAll({'startDate': startDate!.millisecondsSinceEpoch});
    }
    if(endDate != null){
      result.addAll({'endDate': endDate!.millisecondsSinceEpoch});
    }
    result.addAll({'duration': duration});
    result.addAll({'name': name});
    result.addAll({'email': email});
    result.addAll({'phoneNumber': phoneNumber});
    result.addAll({'totalPrice': totalPrice});
    result.addAll({'room': room.toMap()});
    result.addAll({'payment': payment.toMap()});
  
    return result;
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      orderId: map['orderId']?.toInt() ?? 0,
      startDate: map['startDate'] != null ? DateTime.fromMillisecondsSinceEpoch(map['startDate']) : null,
      endDate: map['endDate'] != null ? DateTime.fromMillisecondsSinceEpoch(map['endDate']) : null,
      duration: map['duration']?.toInt() ?? 0,
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      totalPrice: map['totalPrice']?.toInt() ?? 0,
      room: Room.fromMap(map['room']),
      payment: Payment.fromMap(map['payment']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) => Order.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Order(orderId: $orderId, startDate: $startDate, endDate: $endDate, duration: $duration, name: $name, email: $email, phoneNumber: $phoneNumber, totalPrice: $totalPrice, room: $room, payment: $payment)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Order &&
      other.orderId == orderId &&
      other.startDate == startDate &&
      other.endDate == endDate &&
      other.duration == duration &&
      other.name == name &&
      other.email == email &&
      other.phoneNumber == phoneNumber &&
      other.totalPrice == totalPrice &&
      other.room == room &&
      other.payment == payment;
  }

  @override
  int get hashCode {
    return orderId.hashCode ^
      startDate.hashCode ^
      endDate.hashCode ^
      duration.hashCode ^
      name.hashCode ^
      email.hashCode ^
      phoneNumber.hashCode ^
      totalPrice.hashCode ^
      room.hashCode ^
      payment.hashCode;
  }
}
