// To parse this JSON data, do
//
//     final signUpData = signUpDataFromJson(jsonString);

import 'dart:convert';

SignUpData signUpDataFromJson(String str) =>
    SignUpData.fromJson(json.decode(str));

String signUpDataToJson(SignUpData data) => json.encode(data.toJson());

class SignUpData {
  SignUpData({
    this.userfname,
    this.userlname,
    this.password,
    this.email,
    this.mobilenumber,
    this.role = "MU",
    this.status = "ACTIVE",
  });

  String? userfname;
  String? userlname;
  String? password;
  String? email;
  String? mobilenumber;
  String role = "MU";
  String status = "ACTIVE";

  factory SignUpData.fromJson(Map<String, dynamic> json) => SignUpData(
    userfname: json["userfname"],
    userlname: json["userlname"],
    password: json["password"],
    email: json["email"],
    mobilenumber: json["mobilenumber"],
  );

  Map<String, dynamic> toJson() => {
    "userfname": userfname,
    "userlname":userlname,
    "password": password,
    "email": email,
    "mobilenumber": mobilenumber,
    "role": role,
    "status": status,
  };
}

EditProfileDataModel editProfileDataModelFromJson(String str) => EditProfileDataModel.fromJson(json.decode(str));

String editProfileDataModelToJson(EditProfileDataModel? data) => json.encode(data!.toJson());

class EditProfileDataModel {
  EditProfileDataModel({
    this.userfname,
    this.userlname,
    this.email,
    this.mobilenumber,
    this.status="ACTIVE",
    this.image1,
    this.image2,
  });

  String? userfname;
  String? userlname;
  String? email;
  String? mobilenumber;
  String? status="ACTIVE";
  String? image1;
  String? image2;

  factory EditProfileDataModel.fromJson(Map<String, dynamic> json) => EditProfileDataModel(
    userfname: json["userfname"],
    userlname: json["userlname"],
    email: json["email"],
    mobilenumber: json["mobilenumber"],
    status: json["status"],
    image1: json["image1"],
    image2: json["image2"],
  );

  Map<String, dynamic> toJson() => {
    "userfname": userfname,
    "userlname": userlname,
    "email": email,
    "status": status,
    "mobilenumber": mobilenumber,
    "image1": image1,
    "image2": image2,
  };
}
