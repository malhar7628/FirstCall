import 'dart:io';
import 'dart:math';
import 'package:first_call_app/common/api_common.dart';
import 'package:first_call_app/controller/edit_user_profile_controller.dart';
import 'package:first_call_app/data/user_info_model_data.dart';
import 'package:first_call_app/screen/dashboard.screen.dart';
import 'package:first_call_app/service/dashboard.service.dart';
import 'package:first_call_app/service/network.service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditUserProfileScreen extends StatefulWidget {
  static const name = "/editProfile";
  final UserInfoDataModel userInfoDataModel;
  const EditUserProfileScreen({Key? key, required this.userInfoDataModel})
      : super(key: key);

  @override
  State<EditUserProfileScreen> createState() => _EditUserProfileScreenState();
}

class _EditUserProfileScreenState extends State<EditUserProfileScreen> {
  final DashBoardService _dashBoardService = DashBoardService();
  final NetworkService networkService = Get.find();
  EditUserProfileController edit = EditUserProfileController();

  File? uploadedImage;
  File? secondImage;
  String? imagePath1 = "";
  String? imagePath2 = "";
  String url = "";

  Future uploadUserProfilePic(ImageSource source) async {
    await _dashBoardService.imagePicker
        .pickImage(source: source)
        .then((value) async {
      if (value != null) {
        uploadedImage = File(value.path);
        setState(() {});
        edit.getUserInfoDetailsForEditProfileByUserID();
        final response =
            await _dashBoardService.uploadUserProfilePicByUserID(value);
        if (response != null) {
          imagePath1 = response;
        }
      }
    });
  }

  Future uploadSecondImage(ImageSource source) async {
    await _dashBoardService.imagePicker
        .pickImage(source: source)
        .then((value) async {
      if (value != null) {
        secondImage = File(value.path);
        setState(() {});
        edit.getUserInfoDetailsForEditProfileByUserID();
        final response =
            await _dashBoardService.uploadUserProfilePicByUserID(value);
        if (response != null) {
          imagePath2 = response;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditUserProfileController>(
      init: EditUserProfileController(),
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Get.offAll(() => const DashboardScreen());
                },
                icon: const Icon(FontAwesomeIcons.arrowLeft)),
            title: const Text("EDIT PROFILE",
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          body: Column(
            children: [
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Image 1
                      Stack(
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                width: 100,
                                height: 100,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(80),
                                  child: uploadedImage != null
                                      ? Image(
                                          image: Image.file(
                                                  File("${uploadedImage?.path}")
                                                      .absolute)
                                              .image)
                                      : Image(
                                          image: Image.network(
                                                  getProfilePicUrl +
                                                      networkService.userId!
                                                          .toString() +
                                                      "/1?" +
                                                      Random()
                                                          .nextInt(100)
                                                          .toString())
                                              .image),
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                              bottom: 0,
                              right: 0,
                              child: GestureDetector(
                                child: Container(
                                  width: 35,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Colors.grey,
                                  ),
                                  child: const Icon(Icons.add_a_photo),
                                ),
                                onTap: () {
                                  uploadUserProfilePic(ImageSource.gallery);
                                },
                              )),
                          const SizedBox(width: 30),
                        ],
                      ),
                      // Image 2
                      const SizedBox(width: 70),
                      Stack(
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                width: 100,
                                height: 100,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(80),
                                  child: secondImage != null
                                      ? Image(
                                          image: Image.file(
                                                  File("${secondImage?.path}")
                                                      .absolute)
                                              .image)
                                      : Image(
                                          image: Image.network(
                                                  getProfilePicUrl +
                                                      networkService.userId!
                                                          .toString() +
                                                      "/2?" +
                                                      Random()
                                                          .nextInt(100)
                                                          .toString())
                                              .image),
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                              bottom: 0,
                              right: 0,
                              child: GestureDetector(
                                child: Container(
                                  width: 35,
                                  height: 35,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: Colors.grey),
                                  child: const Icon(Icons.add_a_photo),
                                ),
                                onTap: () {
                                  uploadSecondImage(ImageSource.gallery);
                                },
                              )),
                          const SizedBox(width: 30),
                        ],
                      ),
                    ]),
              ),
              const SizedBox(height: 30),
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      initialValue: widget.userInfoDataModel.userfname,
                      onChanged: (value) {
                        if (value != null) {
                          _.editProfileDataModel.userfname = value.trim();
                        }
                      },
                      onSaved: (value) {
                        print("Value " + "${value}");
                        _.editProfileDataModel.userfname =
                            widget.userInfoDataModel.userfname;
                      },
                      decoration: const InputDecoration(
                        label: const Text("First Name"),
                        prefixIcon: Icon(Icons.person_outline_rounded),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      initialValue: widget.userInfoDataModel.userlname,
                      onChanged: (value) {
                        value != null
                            ? _.editProfileDataModel.userlname = value.trim()
                            : _.editProfileDataModel.userlname =
                                widget.userInfoDataModel.userlname;
                      },
                      onSaved: (value) {
                        print("Value " + "${value}");
                        _.editProfileDataModel.userlname =
                            widget.userInfoDataModel.userlname;
                      },
                      decoration: const InputDecoration(
                        label: const Text("Last Name"),
                        prefixIcon: Icon(Icons.person_outline_rounded),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      initialValue: widget.userInfoDataModel.email,
                      enabled: false,
                      onChanged: (value) {
                        if (value != null) {
                          value = widget.userInfoDataModel.email.toString();
                          _.editProfileDataModel.email =
                              widget.userInfoDataModel.email;
                        }
                      },
                      decoration: const InputDecoration(
                        label: const Text("Email ID"),
                        prefixIcon: Icon(Icons.email_rounded),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      initialValue: widget.userInfoDataModel.mobilenumber,
                      onChanged: (value) {
                        if (value != null) {
                          _.editProfileDataModel.mobilenumber = value.trim();
                        }
                      },
                      decoration: const InputDecoration(
                        label: const Text("Mobile Number"),
                        prefixIcon: Icon(Icons.phone_android),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text("CANCEL")),
                    ElevatedButton(
                        onPressed: () {
                          _.editUserProfile(imagePath1, imagePath2);
                          //     _.clearVal();
                        },
                        child: const Text("SAVE")),
                  ]),
            ],
          ),
        );
      },
    );
  }
}
