// To parse this JSON data, do
//
//     final userModle = userModleFromJson(jsonString);

import 'dart:convert';

UserModle userModleFromJson(String str) => UserModle.fromJson(json.decode(str));

String userModleToJson(UserModle data) => json.encode(data.toJson());

class UserModle {
  String? status;
  Data? data;
  String? message;

  UserModle({
    this.status,
    this.data,
    this.message,
  });

  factory UserModle.fromJson(Map<String, dynamic> json) => UserModle(
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
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? mobilePhone;
  String? roleName;
  String? userTypeName;
  String? username;
  List<String>? permissions;
  bool? isActive;
  Branch? branch;
  bool? isAdmin;
  bool? isRegional;
  bool? isTwoFactorAuthenticationEnabled;
  dynamic otpTypeId;
  dynamic googleTwoFactorAuthentication;
  bool? isSenderAddInfoAvailable;
  bool? isSenderDocInfoAvailable;
  dynamic nationalityId;
  dynamic residentialStatusId;

  Data({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.mobilePhone,
    this.roleName,
    this.userTypeName,
    this.username,
    this.permissions,
    this.isActive,
    this.branch,
    this.isAdmin,
    this.isRegional,
    this.isTwoFactorAuthenticationEnabled,
    this.otpTypeId,
    this.googleTwoFactorAuthentication,
    this.isSenderAddInfoAvailable,
    this.isSenderDocInfoAvailable,
    this.nationalityId,
    this.residentialStatusId,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        mobilePhone: json["mobilePhone"],
        roleName: json["roleName"],
        userTypeName: json["userTypeName"],
        username: json["username"],
        permissions: json["permissions"] == null
            ? []
            : List<String>.from(json["permissions"]!.map((x) => x)),
        isActive: json["isActive"],
        branch: json["branch"] == null ? null : Branch.fromJson(json["branch"]),
        isAdmin: json["isAdmin"],
        isRegional: json["isRegional"],
        isTwoFactorAuthenticationEnabled:
            json["isTwoFactorAuthenticationEnabled"],
        otpTypeId: json["otpTypeId"],
        googleTwoFactorAuthentication: json["googleTwoFactorAuthentication"],
        isSenderAddInfoAvailable: json["isSenderAddInfoAvailable"],
        isSenderDocInfoAvailable: json["isSenderDocInfoAvailable"],
        nationalityId: json["nationalityId"],
        residentialStatusId: json["residentialStatusId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "mobilePhone": mobilePhone,
        "roleName": roleName,
        "userTypeName": userTypeName,
        "username": username,
        "permissions": permissions == null
            ? []
            : List<dynamic>.from(permissions!.map((x) => x)),
        "isActive": isActive,
        "branch": branch?.toJson(),
        "isAdmin": isAdmin,
        "isRegional": isRegional,
        "isTwoFactorAuthenticationEnabled": isTwoFactorAuthenticationEnabled,
        "otpTypeId": otpTypeId,
        "googleTwoFactorAuthentication": googleTwoFactorAuthentication,
        "isSenderAddInfoAvailable": isSenderAddInfoAvailable,
        "isSenderDocInfoAvailable": isSenderDocInfoAvailable,
        "nationalityId": nationalityId,
        "residentialStatusId": residentialStatusId,
      };
}

class Branch {
  int? id;
  String? code;
  int? typeId;
  String? title;
  int? cityId;
  int? countryId;
  String? phone;
  dynamic branchIp;
  int? limit;
  int? parentId;
  bool? isVisible;
  int? sendCashCommission;
  int? payCashCommission;
  int? commissionPolicyId;
  int? baseCurrencyId;
  bool? branchStatus;
  int? cpoAccountId;
  int? createdBy;
  DateTime? createdDate;
  DateTime? lastModifiedDate;

  Branch({
    this.id,
    this.code,
    this.typeId,
    this.title,
    this.cityId,
    this.countryId,
    this.phone,
    this.branchIp,
    this.limit,
    this.parentId,
    this.isVisible,
    this.sendCashCommission,
    this.payCashCommission,
    this.commissionPolicyId,
    this.baseCurrencyId,
    this.branchStatus,
    this.cpoAccountId,
    this.createdBy,
    this.createdDate,
    this.lastModifiedDate,
  });

  factory Branch.fromJson(Map<String, dynamic> json) => Branch(
        id: json["id"],
        code: json["code"],
        typeId: json["typeId"],
        title: json["title"],
        cityId: json["cityId"],
        countryId: json["countryId"],
        phone: json["phone"],
        branchIp: json["branchIp"],
        limit: json["limit"],
        parentId: json["parentId"],
        isVisible: json["isVisible"],
        sendCashCommission: json["sendCashCommission"],
        payCashCommission: json["payCashCommission"],
        commissionPolicyId: json["commissionPolicyId"],
        baseCurrencyId: json["baseCurrencyId"],
        branchStatus: json["branchStatus"],
        cpoAccountId: json["cpoAccountId"],
        createdBy: json["createdBy"],
        createdDate: json["createdDate"] == null
            ? null
            : DateTime.parse(json["createdDate"]),
        lastModifiedDate: json["lastModifiedDate"] == null
            ? null
            : DateTime.parse(json["lastModifiedDate"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "typeId": typeId,
        "title": title,
        "cityId": cityId,
        "countryId": countryId,
        "phone": phone,
        "branchIp": branchIp,
        "limit": limit,
        "parentId": parentId,
        "isVisible": isVisible,
        "sendCashCommission": sendCashCommission,
        "payCashCommission": payCashCommission,
        "commissionPolicyId": commissionPolicyId,
        "baseCurrencyId": baseCurrencyId,
        "branchStatus": branchStatus,
        "cpoAccountId": cpoAccountId,
        "createdBy": createdBy,
        "createdDate": createdDate?.toIso8601String(),
        "lastModifiedDate": lastModifiedDate?.toIso8601String(),
      };
}
