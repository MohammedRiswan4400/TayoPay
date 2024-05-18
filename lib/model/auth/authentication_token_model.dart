// To parse this JSON data, do
//
//     final userTokenModel = userTokenModelFromJson(jsonString);

import 'dart:convert';

UserTokenModel userTokenModelFromJson(String str) =>
    UserTokenModel.fromJson(json.decode(str));

String userTokenModelToJson(UserTokenModel data) => json.encode(data.toJson());

class UserTokenModel {
  String? status;
  Data? data;
  String? message;

  UserTokenModel({
    this.status,
    this.data,
    this.message,
  });

  factory UserTokenModel.fromJson(Map<String, dynamic> json) => UserTokenModel(
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
        "message": message,
      };
}

class Data {
  String? authToken;
  String? refreshToken;

  Data({
    this.authToken,
    this.refreshToken,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        authToken: json["authToken"],
        refreshToken: json["refreshToken"],
      );

  Map<String, dynamic> toJson() => {
        "authToken": authToken,
        "refreshToken": refreshToken,
      };
}
