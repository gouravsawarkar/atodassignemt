// To parse this JSON data, do
//
//     final userDataModel = userDataModelFromJson(jsonString);

import 'dart:convert';

UserDataModel userDataModelFromJson(String str) => UserDataModel.fromJson(json.decode(str));

String userDataModelToJson(UserDataModel data) => json.encode(data.toJson());

class UserDataModel {
    UserDataModel({
        required this.status,
        required this.msg,
        required this.data,
    });

    bool status;
    String msg;
    Data data;

    factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
        status: json["status"],
        msg: json["msg"],
        data: Data.fromJson(json["DATA"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "DATA": data.toJson(),
    };
}

class Data {
    Data({
        required this.name,
        required this.email,
        required this.phone,
        required this.password,
        required this.country,
        required this.id,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    String name;
    String email;
    String phone;
    String password;
    String country;
    String id;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        password: json["password"],
        country: json["country"],
        id: json["_id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "phone": phone,
        "password": password,
        "country": country,
        "_id": id,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}
