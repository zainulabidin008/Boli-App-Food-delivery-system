import 'dart:convert';

GetMenueOfRestaurantModel getMenueOfRestaurantModelFromJson(String str) => GetMenueOfRestaurantModel.fromJson(json.decode(str));

String getMenueOfRestaurantModelToJson(GetMenueOfRestaurantModel data) => json.encode(data.toJson());

class GetMenueOfRestaurantModel {
  List<Category>? categories;

  GetMenueOfRestaurantModel({
    this.categories,
  });

  factory GetMenueOfRestaurantModel.fromJson(Map<String, dynamic> json) => GetMenueOfRestaurantModel(
    categories: json["categories"] == null ? [] : List<Category>.from(json["categories"]!.map((x) => Category.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "categories": categories == null ? [] : List<dynamic>.from(categories!.map((x) => x.toJson())),
  };
}

class Category {
  String? id;
  String? name;
  int? v;

  Category({
    this.id,
    this.name,
    this.v,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["_id"],
    name: json["name"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "__v": v,
  };
}
