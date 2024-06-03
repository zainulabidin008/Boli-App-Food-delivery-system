// To parse this JSON data, do
//
//     final getReviewModel = getReviewModelFromJson(jsonString);

import 'dart:convert';

GetReviewModel getReviewModelFromJson(String str) => GetReviewModel.fromJson(json.decode(str));

String getReviewModelToJson(GetReviewModel data) => json.encode(data.toJson());

class GetReviewModel {
  String? message;
  List<Datum>? data;

  GetReviewModel({
    this.message,
    this.data,
  });

  factory GetReviewModel.fromJson(Map<String, dynamic> json) => GetReviewModel(
    message: json["message"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  Customer? customer;
  String? text;
  int? stars;
  DateTime? createdAt;
  String? timeAgo;

  Datum({
    this.customer,
    this.text,
    this.stars,
    this.createdAt,
    this.timeAgo,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    customer: json["customer"] == null ? null : Customer.fromJson(json["customer"]),
    text: json["text"],
    stars: json["stars"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    timeAgo: json["timeAgo"],
  );

  Map<String, dynamic> toJson() => {
    "customer": customer?.toJson(),
    "text": text,
    "stars": stars,
    "createdAt": createdAt?.toIso8601String(),
    "timeAgo": timeAgo,
  };
}

class Customer {
  String? id;
  String? name;

  Customer({
    this.id,
    this.name,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
    id: json["_id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
  };
}