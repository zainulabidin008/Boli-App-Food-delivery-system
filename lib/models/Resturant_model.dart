// To parse this JSON data, do
//
//     final resturantModel = resturantModelFromJson(jsonString);

import 'dart:convert';

ResturantModel resturantModelFromJson(String str) => ResturantModel.fromJson(json.decode(str));

String resturantModelToJson(ResturantModel data) => json.encode(data.toJson());

class ResturantModel {
  bool? success;
  List<Datum>? data;

  ResturantModel({
    this.success,
    this.data,
  });

  factory ResturantModel.fromJson(Map<String, dynamic> json) => ResturantModel(
    success: json["success"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  String? id;
  String? name;
  String? location;
  dynamic averageRating;
  String? ownerId;
  List<dynamic>? images;

  Datum({
    this.id,
    this.name,
    this.location,
    this.averageRating,
    this.ownerId,
    this.images,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"],
    name: json["name"],
    location: json["location"],
    averageRating: json["averageRating"],
    ownerId: json["ownerId"],
    images: json["images"] == null ? [] : List<dynamic>.from(json["images"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "location": location,
    "averageRating": averageRating,
    "ownerId": ownerId,
    "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
  };
}