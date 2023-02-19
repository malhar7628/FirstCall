import 'dart:convert';

EditProfileModel editProfileDataModelFromJson(String str) => EditProfileModel.fromJson(json.decode(str));

String editProfileDataModelToJson(EditProfileModel? data) => json.encode(data!.toJson());

class EditProfileModel {
  EditProfileModel({
    this.userfname,
    this.userlname,
    this.email,
    this.mobilenumber,
    this.status="ACTIVE",
    this.image1,
    this.image2,
    this.cv,
  });

  String? userfname;
  String? userlname;
  String? email;
  String? mobilenumber;
  String? status="ACTIVE";
  String? image1;
  String? image2;
  String? cv;

  factory EditProfileModel.fromJson(Map<String, dynamic> json) => EditProfileModel(
    userfname: json["userfname"],
    userlname: json["userlname"],
    email: json["email"],
    mobilenumber: json["mobilenumber"],
    status: json["status"],
    image1: json["image1"],
    image2: json["image2"],
    cv:json["cv"],
  );

  Map<String, dynamic> toJson() => {
    "userfname": userfname,
    "userlname": userlname,
    "email": email,
    "status": status,
    "mobilenumber": mobilenumber,
    "image1": image1,
    "image2": image2,
    "cv":cv,
  };
}