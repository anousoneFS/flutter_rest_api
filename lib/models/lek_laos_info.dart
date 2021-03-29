// To parse this JSON data, do
//
//     final lekLaos = lekLaosFromJson(jsonString);

import 'dart:convert';

LekLaos lekLaosFromJson(String str) => LekLaos.fromJson(json.decode(str));

String lekLaosToJson(LekLaos data) => json.encode(data.toJson());

class LekLaos {
  LekLaos({
    this.date,
    this.sixdigit,
    this.fiveDigit,
    this.fourDigit,
    this.threeDigit,
    this.twoDigit,
    this.name,
  });

  String date;
  String sixdigit;
  String fiveDigit;
  String fourDigit;
  String threeDigit;
  String twoDigit;
  String name;

  factory LekLaos.fromJson(Map<String, dynamic> json) => LekLaos(
    date: json["date"],
    sixdigit: json["sixdigit"],
    fiveDigit: json["fiveDigit"],
    fourDigit: json["fourDigit"],
    threeDigit: json["threeDigit"],
    twoDigit: json["twoDigit"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "date": date,
    "sixdigit": sixdigit,
    "fiveDigit": fiveDigit,
    "fourDigit": fourDigit,
    "threeDigit": threeDigit,
    "twoDigit": twoDigit,
    "name": name,
  };
}
