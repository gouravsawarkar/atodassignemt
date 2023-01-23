// To parse this JSON data, do
//
//     final cityListModel = cityListModelFromJson(jsonString);

import 'dart:convert';

CityListModel cityListModelFromJson(String str) => CityListModel.fromJson(json.decode(str));

String cityListModelToJson(CityListModel data) => json.encode(data.toJson());

class CityListModel {
    CityListModel({
        required this.msg,
        required this.list,
    });

    String msg;
    List<ListElement> list;

    factory CityListModel.fromJson(Map<String, dynamic> json) => CityListModel(
        msg: json["msg"],
        list: List<ListElement>.from(json["list"].map((x) => ListElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "msg": msg,
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
    };
}

class ListElement {
    ListElement({
        required this.id,
        required this.name,
        required this.state,
        required this.country,
        required this.maxTemperature,
        this.minTemperature,
    });

    String id;
    String name;
    String state;
    String country;
    int maxTemperature;
    int? minTemperature;

    factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["_id"],
        name: json["name"],
        state: json["state"],
        country: json["country"],
        maxTemperature: json["maxTemperature"],
        minTemperature: json["minTemperature"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "state": state,
        "country": country,
        "maxTemperature": maxTemperature,
        "minTemperature": minTemperature,
    };
}
