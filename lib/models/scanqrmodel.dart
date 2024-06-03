// To parse this JSON data, do
//
//     final getMenueByScanQr = getMenueByScanQrFromJson(jsonString);

import 'dart:convert';

GetMenueByScanQr getMenueByScanQrFromJson(String str) => GetMenueByScanQr.fromJson(json.decode(str));

String getMenueByScanQrToJson(GetMenueByScanQr data) => json.encode(data.toJson());

class GetMenueByScanQr {
  Menu? menu;
  String? tableNumber;

  GetMenueByScanQr({
    this.menu,
    this.tableNumber,
  });

  factory GetMenueByScanQr.fromJson(Map<String, dynamic> json) => GetMenueByScanQr(
    menu: json["menu"] == null ? null : Menu.fromJson(json["menu"]),
    tableNumber: json["tableNumber"],
  );

  Map<String, dynamic> toJson() => {
    "menu": menu?.toJson(),
    "tableNumber": tableNumber,
  };
}

class Menu {
  List<Item>? items;
  String? id;

  Menu({
    this.items,
    this.id,
  });

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
    items: json["items"] == null ? [] : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
    "_id": id,
  };
}

class Item {
  String? image;
  String? name;
  double? price;
  String? category;
  List<dynamic>? frequentlyBoughtTogether;
  List<AddOn>? addOns;
  String? id;
  int? v;

  Item({
    this.image,
    this.name,
    this.price,
    this.category,
    this.frequentlyBoughtTogether,
    this.addOns,
    this.id,
    this.v,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    image: json["image"],
    name: json["name"],
    price: json["price"]?.toDouble(),
    category: json["category"],
    frequentlyBoughtTogether: json["frequentlyBoughtTogether"] == null ? [] : List<dynamic>.from(json["frequentlyBoughtTogether"]!.map((x) => x)),
    addOns: json["addOns"] == null ? [] : List<AddOn>.from(json["addOns"]!.map((x) => AddOn.fromJson(x))),
    id: json["_id"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "image": image,
    "name": name,
    "price": price,
    "category": category,
    "frequentlyBoughtTogether": frequentlyBoughtTogether == null ? [] : List<dynamic>.from(frequentlyBoughtTogether!.map((x) => x)),
    "addOns": addOns == null ? [] : List<dynamic>.from(addOns!.map((x) => x.toJson())),
    "_id": id,
    "__v": v,
  };
}

class AddOn {
  String? name;
  double? price;
  String? id;

  AddOn({
    this.name,
    this.price,
    this.id,
  });

  factory AddOn.fromJson(Map<String, dynamic> json) => AddOn(
    name: json["name"],
    price: json["price"]?.toDouble(),
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "price": price,
    "_id": id,
  };
}
