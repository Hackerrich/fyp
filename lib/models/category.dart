import 'dart:convert';

List<Categories?>? productFromJson(String str) => json.decode(str) == null
    ? []
    : List<Categories?>.from(
        json.decode(str)!.map((x) => Categories.fromJson(x)));

String productToJson(List<Categories?>? data) => json.encode(
    data == null ? [] : List<dynamic>.from(data.map((x) => x!.toJson())));

class Categories {
  Categories({
    this.id,
    this.name,
    this.price,
  });

  String? id;
  String? name;
  String? price;

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        id: json["category_id"],
        name: json["name"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "category_id": id,
        "name": name,
        "price": price,
      };
}
