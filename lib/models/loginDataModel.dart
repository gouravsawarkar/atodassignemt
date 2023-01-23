// To parse this JSON data, do
//
//     final loginDataModel = loginDataModelFromJson(jsonString);

import 'dart:convert';

LoginDataModel loginDataModelFromJson(String str) => LoginDataModel.fromJson(json.decode(str));

String loginDataModelToJson(LoginDataModel data) => json.encode(data.toJson());

class LoginDataModel {
    LoginDataModel({
        required this.msg,
        required this.email,
        required this.token,
        required this.liveWeather,
    });

    String msg;
    String email;
    String token;
    LiveWeather liveWeather;

    factory LoginDataModel.fromJson(Map<String, dynamic> json) => LoginDataModel(
        msg: json["msg"],
        email: json["email"],
        token: json["token"],
        liveWeather: LiveWeather.fromJson(json["liveWeather"]),
    );

    Map<String, dynamic> toJson() => {
        "msg": msg,
        "email": email,
        "token": token,
        "liveWeather": liveWeather.toJson(),
    };
}

class LiveWeather {
    LiveWeather({
        required this.id,
        required this.date,
        required this.minTemperature,
        required this.maxTemperature,
        required this.temperature,
        required this.condition,
        required this.windSpeed,
        required this.humidity,
        required this.cityId,
        required this.createdAt,
        required this.updatedAt,
    });

    String id;
    String date;
    int minTemperature;
    int maxTemperature;
    int temperature;
    String condition;
    int windSpeed;
    int humidity;
    String cityId;
    DateTime createdAt;
    DateTime updatedAt;

    factory LiveWeather.fromJson(Map<String, dynamic> json) => LiveWeather(
        id: json["_id"],
        date: json["date"],
        minTemperature: json["minTemperature"],
        maxTemperature: json["maxTemperature"],
        temperature: json["temperature"],
        condition: json["condition"],
        windSpeed: json["windSpeed"],
        humidity: json["humidity"],
        cityId: json["cityId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "date": date,
        "minTemperature": minTemperature,
        "maxTemperature": maxTemperature,
        "temperature": temperature,
        "condition": condition,
        "windSpeed": windSpeed,
        "humidity": humidity,
        "cityId": cityId,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}
