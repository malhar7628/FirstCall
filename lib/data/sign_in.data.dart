// To parse this JSON data, do
//
//     final signInData = signInDataFromJson(jsonString);

import 'dart:convert';

SignInData signInDataFromJson(String str) =>
    SignInData.fromJson(json.decode(str));

String signInDataToJson(SignInData data) => json.encode(data.toJson());

class SignInData {
  SignInData({
    this.username,
    this.password,
  });

  String? username;
  String? password;

  factory SignInData.fromJson(Map<String, dynamic> json) => SignInData(
    username: json["username"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "password": password,
  };
}
