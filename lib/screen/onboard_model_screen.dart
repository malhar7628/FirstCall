import 'package:first_call_app/service/network.service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardScreenModel {
  String image;
  String text;
  String desc;
  String description1;
  String description2;
  Color bgColor;
  Color button;

  OnBoardScreenModel({
    required this.image,
    required this.text,
    required this.desc,
    required this.bgColor,
    required this.button,
    required this.description1,
    required this.description2,
  });
}

final NetworkService _networkService = Get.find();

const colorizeColors = [
  Colors.purple,
  Colors.blue,
  Colors.yellow,
  Colors.red,
];

const colorizeTextStyle = TextStyle(
  fontSize: 28.0,
  fontFamily: 'Horizon',
);

List<OnBoardScreenModel> onBoardScreen = <OnBoardScreenModel>[
  OnBoardScreenModel(
    image: 'assets/images/welcome.jpg',
    text: "Welcome,  " + _networkService.userName.toString(),
    desc:
        "Welcome to PreScreen Desk. You can apply for the pre screen in simple steps using this App.",
    bgColor: Colors.white,
    button: const Color(0xFF4756DF),
    description1: ' ',
    description2: ' ',
  ),
  OnBoardScreenModel(
    image: 'assets/images/informationicon.jpg',
    text: "HOW TO APPLY ?",
    desc: "STEP 1 :- Enter the SCREEN ID ",
    description1: "STEP 2 :- Record your Video ",
    description2: "STEP 3 :- Submit your Video ",
    bgColor: Colors.white,
    button: const Color(0xFF4756DF),
  ),
];
