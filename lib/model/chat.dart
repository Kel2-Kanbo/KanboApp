import 'dart:convert';

import 'package:intl/intl.dart';

class Chat {
  String message;
  DateTime time;
  bool isUser;
  Chat({
    required this.message,
    required this.time,
    required this.isUser,
  });

  String getMessageTime() {
    final timeFormat = DateFormat.Hm();
    return timeFormat.format(time);
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'message': message});
    result.addAll({'time': time.millisecondsSinceEpoch});
    result.addAll({'isUser': isUser});
  
    return result;
  }

  factory Chat.fromMap(Map<String, dynamic> map) {
    return Chat(
      message: map['message'] ?? '',
      time: DateTime.fromMillisecondsSinceEpoch(map['time']),
      isUser: map['isUser'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Chat.fromJson(String source) => Chat.fromMap(json.decode(source));

  @override
  String toString() => 'Chat(message: $message, time: $time, isUser: $isUser)';
}
