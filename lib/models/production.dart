import 'dart:convert';

List<Production?>? productFromJson(String str) => json.decode(str) == null
    ? []
    : List<Production?>.from(
        json.decode(str)!.map((x) => Production.fromJson(x)));

String productToJson(List<Production?>? data) => json.encode(
    data == null ? [] : List<dynamic>.from(data.map((x) => x!.toJson())));

class Production {
  Production({
    this.id,
    this.name,
    this.description,
    this.price,
    this.category,
    this.approved,
    this.image,
    this.merchant,
  });

  String? id;
  String? name;
  String? image;
  String? description;
  String? price;
  String? quantity;
  String? approved;
  String? category;
  String? merchant;

  factory Production.fromJson(Map<String, dynamic> json) => Production(
        id: json["Id"],
        name: json["name"],
        image: json["image"],
        description: json["description"],
        price: json["price"],
        approved: json["approved"],
        merchant: json["Merchant_Id"],
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "name": name,
        "image": image,
        "description": description,
        "price": price,
        "quantity": quantity,
        "approved": approved,
        "Merchant_ID": merchant,
        "category": category,
      };
}
