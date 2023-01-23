// To parse this JSON data, do
//
//     final liveWeatherModel = liveWeatherModelFromJson(jsonString);

import 'dart:convert';

LiveWeatherModel liveWeatherModelFromJson(String str) => LiveWeatherModel.fromJson(json.decode(str));

String liveWeatherModelToJson(LiveWeatherModel data) => json.encode(data.toJson());

class LiveWeatherModel {
    LiveWeatherModel({
        required this.status,
        required this.msg,
        required this.data,
    });

    bool status;
    String msg;
    Data data;

    factory LiveWeatherModel.fromJson(Map<String, dynamic> json) => LiveWeatherModel(
        status: json["status"],
        msg: json["msg"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": data.toJson(),
    };
}

class Data {
    Data({
        required this.date,
        required this.temperature,
        required this.maxTemperature,
        required this.minTemperature,
        required this.condition,
        required this.windSpeed,
        required this.humidity,
        required this.cityId,
    });

    String date;
    int temperature;
    int maxTemperature;
    int minTemperature;
    String condition;
    int windSpeed;
    int humidity;
    String cityId;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        date: json["date"],
        temperature: json["temperature"],
        maxTemperature: json["maxTemperature"],
        minTemperature: json["minTemperature"],
        condition: json["condition"],
        windSpeed: json["windSpeed"],
        humidity: json["humidity"],
        cityId: json["cityId"],
    );

    Map<String, dynamic> toJson() => {
        "date": date,
        "temperature": temperature,
        "maxTemperature": maxTemperature,
        "minTemperature": minTemperature,
        "condition": condition,
        "windSpeed": windSpeed,
        "humidity": humidity,
        "cityId": cityId,
    };
}
