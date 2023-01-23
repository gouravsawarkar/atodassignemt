// To parse this JSON data, do
//
//     final smallForcastModel = smallForcastModelFromJson(jsonString);

import 'dart:convert';

SmallForcastModel smallForcastModelFromJson(String str) =>
    SmallForcastModel.fromJson(json.decode(str));

String smallForcastModelToJson(SmallForcastModel data) =>
    json.encode(data.toJson());

class SmallForcastModel {
  SmallForcastModel({
    required this.data,
  });

  List<Datum> data;

  factory SmallForcastModel.fromJson(Map<String, dynamic> json) =>
      SmallForcastModel(
        data: List<Datum>.from(json["DATA"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "DATA": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.time,
    required this.temperature,
    required this.condition,
    required this.cityId,
    required this.createdAt,
    required this.updatedAt,
  });

  String id;
  String time;
  int temperature;
  String condition;
  String cityId;
  DateTime createdAt;
  DateTime updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        time: json["time"],
        temperature: json["temperature"],
        condition: json["condition"],
        cityId: json["cityId"]!,
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "time": time,
        "temperature": temperature,
        "condition": condition,
        "cityId": cityId,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}



class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
