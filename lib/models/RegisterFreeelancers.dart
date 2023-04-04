// To parse this JSON data, do
//
//     final Freelancers = FreelancerFromJson(jsonString);

import 'dart:convert';

List<Freelancers> freelancerFromJson(String str) => List<Freelancers>.from(
    json.decode(str).map((x) => Freelancers.fromJson(x)));

String freelancerToJson(List<Freelancers> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Freelancers {
  Freelancers({
    required this.id,
    required this.username,
    required this.password,
    required this.role,
  });

  String id;
  String username;
  String password;
  String role;

  factory Freelancers.fromJson(Map<String, dynamic> json) => Freelancers(
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
