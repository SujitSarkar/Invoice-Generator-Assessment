import 'dart:convert';

List<VehicleModel> vehicleModelFromJson(String str) => List<VehicleModel>.from(
    json.decode(str).map((x) => VehicleModel.fromJson(x)));

class VehicleModel {
  final String? id;
  final String? make;
  final String? model;
  final int? year;
  final String? type;
  final int? seats;
  final int? bags;
  final List<String>? features;
  final Rates? rates;
  final String? imageUrl;

  VehicleModel({
    this.id,
    this.make,
    this.model,
    this.year,
    this.type,
    this.seats,
    this.bags,
    this.features,
    this.rates,
    this.imageUrl,
  });

  factory VehicleModel.fromJson(Map<String, dynamic> json) => VehicleModel(
        id: json["id"],
        make: json["make"],
        model: json["model"],
        year: json["year"],
        type: json["type"],
        seats: json["seats"],
        bags: json["bags"],
        features: json["features"] == null
            ? []
            : List<String>.from(json["features"]!.map((x) => x)),
        rates: json["rates"] == null ? null : Rates.fromJson(json["rates"]),
        imageUrl: json["imageURL"],
      );
}

class Rates {
  final int? hourly;
  final int? daily;
  final int? weekly;

  Rates({
    this.hourly,
    this.daily,
    this.weekly,
  });

  factory Rates.fromJson(Map<String, dynamic> json) => Rates(
        hourly: json["hourly"],
        daily: json["daily"],
        weekly: json["weekly"],
      );
}
