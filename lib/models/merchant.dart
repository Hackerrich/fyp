// To parse this JSON data, do
//
//     final merchant = merchantFromJson(jsonString);

import 'dart:convert';

List<Merchant> merchantFromJson(String str) =>
    List<Merchant>.from(json.decode(str).map((x) => Merchant.fromJson(x)));

String merchantToJson(List<Merchant> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Merchant {
  Merchant({
    required this.id,
    required this.username,
    required this.password,
    required this.role,
  });

  String id;
  String username;
  String password;
  String role;

  factory Merchant.fromJson(Map<String, dynamic> json) => Merchant(
        id: json["User_Id"],
        username: json["username"],
        password: json["password"],
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "User_Id": id,
        "username": username,
        "password": password,
        "role": role,
      };
}
