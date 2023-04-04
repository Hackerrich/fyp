// To parse this JSON data, do
//
//     final Freelancer = FreelancerFromJson(jsonString);

import 'dart:convert';

List<Freelancer> freelancerFromJson(String str) =>
    List<Freelancer>.from(json.decode(str).map((x) => Freelancer.fromJson(x)));

String freelancerToJson(List<Freelancer> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Freelancer {
  Freelancer(
      {this.freelancer_id,
      this.user_id,
      this.description,
      this.booking_date_start,
      this.booking_date_end,
      this.category_id,
      this.approved});

  String? freelancer_id;
  String? user_id;
  String? description;
  String? booking_date_start;
  String? booking_date_end;
  String? category_id;
  String? approved;

  factory Freelancer.fromJson(Map<String, dynamic> json) => Freelancer(
        freelancer_id: json["freelancer_Id"],
        user_id: json["user_Id"],
        description: json["description"],
        booking_date_start: json["booking_date_start"],
        booking_date_end: json["booking_date_start"],
        category_id: json["category_id"],
        approved: json["approved"],
      );

  Map<String, dynamic> toJson() => {
        "freelancer_id": freelancer_id,
        "user_id": user_id,
        "description": description,
        "booking_date_start": booking_date_start,
        "booking_date_end": booking_date_end,
        "category_id": category_id,
        "approved": approved,
      };
}
