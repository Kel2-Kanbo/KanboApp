import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  int id;
  String username;
  String email;
  String password;
  List<String> roles;
  String token;

  User({
    this.id = 0,
    this.username = '',
    this.email = '',
    this.password = '',
    this.roles = const ['user'],
    this.token = '',
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] ?? 0,
        username: json["username"] ?? '',
        email: json["email"] ?? '',
        password: json["password"] ?? '',
        //roles: json["roles"] ?? [],
        token: json["token"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "password": password,
        "roles": roles,
        "token": token
      };

  Map<String, dynamic> toJsonLogin() => {
        "username": username,
        "password": password,
      };

  Map<String, dynamic> toJsonRegister() => {
        "username": username,
        "email": email,
        "password": password,
        "role": roles,
      };

  @override
  String toString() => 'User(id: $id, username: $username, email: $email)';
}
