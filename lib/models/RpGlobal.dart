// To parse this JSON data, do
//
//     final rpGlobal = rpGlobalFromJson(jsonString);

import 'dart:convert';

RpGlobal rpGlobalFromJson(String str) => RpGlobal.fromJson(json.decode(str));

String rpGlobalToJson(RpGlobal data) => json.encode(data.toJson());

class RpGlobal {
  Latest latest;
  List<Location> locations;

  RpGlobal({
    this.latest,
    this.locations,
  });

  factory RpGlobal.fromJson(Map<String, dynamic> json) => RpGlobal(
    latest: Latest.fromJson(json["latest"]),
    locations: List<Location>.from(json["locations"].map((x) => Location.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "latest": latest.toJson(),
    "locations": List<dynamic>.from(locations.map((x) => x.toJson())),
  };
}

class Latest {
  int confirmed;
  int deaths;
  int recovered;

  Latest({
    this.confirmed,
    this.deaths,
    this.recovered,
  });

  factory Latest.fromJson(Map<String, dynamic> json) => Latest(
    confirmed: json["confirmed"],
    deaths: json["deaths"],
    recovered: json["recovered"],
  );

  Map<String, dynamic> toJson() => {
    "confirmed": confirmed,
    "deaths": deaths,
    "recovered": recovered,
  };
}

class Location {
  int id;
  String country;
  String countryCode;
  int countryPopulation;
  String province;
  DateTime lastUpdated;
  Coordinates coordinates;
  Latest latest;

  Location({
    this.id,
    this.country,
    this.countryCode,
    this.countryPopulation,
    this.province,
    this.lastUpdated,
    this.coordinates,
    this.latest,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    id: json["id"],
    country: json["country"],
    countryCode: json["country_code"],
    countryPopulation: json["country_population"] == null ? null : json["country_population"],
    province: json["province"],
    lastUpdated: DateTime.parse(json["last_updated"]),
    coordinates: Coordinates.fromJson(json["coordinates"]),
    latest: Latest.fromJson(json["latest"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "country": country,
    "country_code": countryCode,
    "country_population": countryPopulation == null ? null : countryPopulation,
    "province": province,
    "last_updated": lastUpdated.toIso8601String(),
    "coordinates": coordinates.toJson(),
    "latest": latest.toJson(),
  };
}

class Coordinates {
  String latitude;
  String longitude;

  Coordinates({
    this.latitude,
    this.longitude,
  });

  factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
    latitude: json["latitude"],
    longitude: json["longitude"],
  );

  Map<String, dynamic> toJson() => {
    "latitude": latitude,
    "longitude": longitude,
  };
}
