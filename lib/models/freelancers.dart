// To parse this JSON data, do
//
//     final freelancers = freelancersFromJson(jsonString);

import 'dart:convert';

Freelancers freelancersFromJson(String str) =>
    Freelancers.fromJson(json.decode(str));

String freelancersToJson(Freelancers data) => json.encode(data.toJson());

class Freelancers {
  Freelancers({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  List<Freelancer> data;
  String message;

  factory Freelancers.fromJson(Map<String, dynamic> json) => Freelancers(
        success: json["success"],
        data: List<Freelancer>.from(
            json["data"].map((x) => Freelancer.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class Freelancer {
  Freelancer({
    required this.freelancerId,
    required this.FreelancerUserId,
    required this.description,
    this.bookingDateStart,
    this.bookingDateEnd,
    required this.categoryId,
    required this.image,
    required this.approved,
    required this.userId,
    required this.username,
    required this.password,
    required this.role,
  });

  String freelancerId;
  String FreelancerUserId;
  String description;
  dynamic bookingDateStart;
  dynamic bookingDateEnd;
  String categoryId;
  String image;
  String approved;
  String userId;
  String username;
  String password;
  String role;

  factory Freelancer.fromJson(Map<String, dynamic> json) => Freelancer(
        freelancerId: json["freelancer_id"],
        FreelancerUserId: json["user_id"],
        description: json["description"],
        bookingDateStart: json["booking_date_start"],
        bookingDateEnd: json["booking_date_end"],
        categoryId: json["category_id"],
        image: json["image"],
        approved: json["approved"],
        userId: json["User_Id"],
        username: json["username"],
        password: json["password"],
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "freelancer_id": freelancerId,
        "user_id": FreelancerUserId,
        "description": description,
        "booking_date_start": bookingDateStart,
        "booking_date_end": bookingDateEnd,
        "category_id": categoryId,
        "image": image,
        "approved": approved,
        "User_Id": userId,
        "username": username,
        "password": password,
        "role": role,
      };
}
