import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  int userId;
  String username;
  String password;
  String roles;
  String token;

  User({
    this.userId = 0,
    this.username = '',
    this.password = '',
    this.roles = '',
    this.token = '',
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json["user_id"],
        username: json["username"],
        password: json["password"],
        roles: json["roles"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "username": username,
        "password": password,
        "roles": roles,
        "token": token,
      };

      @override
  String toString() => 'User(userId: $userId, username: $username, token: $token)';
}
