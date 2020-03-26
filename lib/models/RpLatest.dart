import 'dart:convert';

RpLatest rpLatestFromJson(String str) => RpLatest.fromJson(json.decode(str));

String rpLatestToJson(RpLatest data) => json.encode(data.toJson());

class RpLatest {
  Latest latest;

  RpLatest({
    this.latest,
  });

  factory RpLatest.fromJson(Map<String, dynamic> json) => RpLatest(
    latest: Latest.fromJson(json["latest"]),
  );

  Map<String, dynamic> toJson() => {
    "latest": latest.toJson(),
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
