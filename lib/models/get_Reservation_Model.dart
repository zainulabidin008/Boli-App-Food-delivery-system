import 'dart:convert';

GetReservationModel getReservationModelFromJson(String str) => GetReservationModel.fromJson(json.decode(str));

String getReservationModelToJson(GetReservationModel data) => json.encode(data.toJson());

class GetReservationModel {
  String? message;
  List<Datum>? data;

  GetReservationModel({
    this.message,
    this.data,
  });

  factory GetReservationModel.fromJson(Map<String, dynamic> json) => GetReservationModel(
    message: json["message"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  String? id;
  String? customer;
  Restaurant? restaurant;
  int? tableFor;
  DateTime? date;
  String? time;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Datum({
    this.id,
    this.customer,
    this.restaurant,
    this.tableFor,
    this.date,
    this.time,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"],
    customer: json["customer"],
    restaurant: json["restaurant"] == null ? null : Restaurant.fromJson(json["restaurant"]),
    tableFor: json["tableFor"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    time: json["time"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "customer": customer,
    "restaurant": restaurant?.toJson(),
    "tableFor": tableFor,
    "date": date?.toIso8601String(),
    "time": time,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}

class Restaurant {
  String? id;
  String? name;
  String? location;

  Restaurant({
    this.id,
    this.name,
    this.location,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
    id: json["_id"],
    name: json["name"],
    location: json["location"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "location": location,
  };
}
