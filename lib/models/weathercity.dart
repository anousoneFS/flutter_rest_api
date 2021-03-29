// To parse this JSON data, do
//
//     final weatherCity = weatherCityFromJson(jsonString);

import 'dart:convert';

WeatherCity weatherCityFromJson(String str) => WeatherCity.fromJson(json.decode(str));

String weatherCityToJson(WeatherCity data) => json.encode(data.toJson());

class WeatherCity {
  WeatherCity({
    this.id,
    this.name,
    this.temp,
    this.weather,
    this.people,
  });

  int id;
  String name;
  String temp;
  String weather;
  String people;

  factory WeatherCity.fromJson(Map<String, dynamic> json) => WeatherCity(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    temp: json["temp"] == null ? null : json["temp"],
    weather: json["weather"] == null ? null : json["weather"],
    people: json["people"] == null ? null : json["people"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "temp": temp == null ? null : temp,
    "weather": weather == null ? null : weather,
    "people": people == null ? null : people,
  };
}
