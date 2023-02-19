import 'dart:convert';

UserInfoDataModel userInfoDataModelFromJson(String str) => UserInfoDataModel.fromJson(json.decode(str));

String userInfoDataModelToJson(UserInfoDataModel data) => json.encode(data.toJson());

class UserInfoDataModel {
  UserInfoDataModel({
    this.userfname,
    this.userlname,
    this.id,
    this.mobilenumber,
    this.status="ACTIVE",
    this.email,
    this.image1,
    this.image2,
    this.image1name,
    this.image2name,
    this.cv
  });

  String? userfname;
  String? userlname;
  String? id;
  String? mobilenumber;
  String? status="ACTIVE";
  String? email;
  String? image1;
  String? image2;
  String? image1name;
  String? image2name;
  String? cv;

  factory UserInfoDataModel.fromJson(Map<String, dynamic> json) => UserInfoDataModel(
    userfname: json["userfname"],
    userlname: json["userlname"],
    id: json["id"],
    mobilenumber: json["mobilenumber"],
    status: json["status"],
    email: json["email"],
    image1: json["image1"],
    image2: json["image2"],
    image1name: json["image1name"],
    image2name: json["image2name"],
    cv: json["cv"],
  );

  Map<String, dynamic> toJson() => {
    "userfname": userfname,
    "userlname": userlname,
    "id": id,
    "mobilenumber": mobilenumber,
    "status": status,
    "email": email,
    "image1": image1,
    "image2": image2,
    "image1name": image1name,
    "image2name": image2name,
    "cv": cv,
  };
}
