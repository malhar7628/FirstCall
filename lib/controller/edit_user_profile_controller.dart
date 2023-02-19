import 'dart:async';
import 'dart:io';
import 'package:first_call_app/common/utils_common.dart';
import 'package:first_call_app/model/edit_profile_model.dart';
import 'package:first_call_app/screen/dashboard.screen.dart';
import 'package:first_call_app/screen/edit_user_profile_screen.dart';
import 'package:first_call_app/service/dashboard.service.dart';
import 'package:first_call_app/service/network.service.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditUserProfileController extends GetxController {
  final DashBoardService _dashBoardService = Get.find();
  final NetworkService _networkService = Get.find();

  final formKey = GlobalKey<FormState>();

  final _autovalidateMode = AutovalidateMode.disabled.obs;

  AutovalidateMode get autovalidateMode => _autovalidateMode.value;
  set autovalidateMode(AutovalidateMode value) =>
      _autovalidateMode.value = value;

  late Timer _timer;
  bool pauseLoad = false;

  @override
  void onInit() {
    getUserInfoDetailsForEditProfileByUserID();
    super.onInit();
  }

  getUserInfoDetailsForEditProfileByUserID() async {
    final response = await _dashBoardService.getUserInfoByUserID();
    showLoadingDialog();
    if (response != null) {
      removeDialog();
      print("Response Data :--- " + response.toJson().toString());
      Get.dialog(EditUserProfileScreen(userInfoDataModel: response));
    } else {
      return null;
    }
  }

  final EditProfileModel editProfileDataModel = EditProfileModel();

  Future<bool?> editUserProfile(String? imagePath1, String? imagePath2) async {
    editProfileDataModel.image1 = imagePath1;
    editProfileDataModel.image2 = imagePath2;
    final response =
        await _dashBoardService.editUserProfileByUserID(editProfileDataModel);

    if (response != false) {
      showToast("Profile Edited Successfully !!!");
      getUserInfoDetailsForEditProfileByUserID();
      Get.back(result: getUserInfoDetailsForEditProfileByUserID());
      Get.offAll(const DashboardScreen());
      return true;
    }
    return true;
  }

  File? uploadedImage;

  Future uploadUserProfilePic(ImageSource source) async {
    await _dashBoardService.imagePicker
        .pickImage(source: source)
        .then((value) async {
      if (value != null) {
        showLoadingDialog();
        uploadedImage = File(value.path);
        final response =
            await _dashBoardService.uploadUserProfilePicByUserID(value);
        if (response != null) {
          removeDialog();
        }
      }
      return null;
    });
  }

  Future<File?> getUploadedProfileImage() async {
    final response =
        await _dashBoardService.getUploadedProfileImageByUserIDAndImageID();
    print("Image here" + response!.path.toString());
    if (response != null) {
      print("Image exists");
      print(response.path);
      print(File(response.path).absolute);
      return response;
    } else {
      showToast("No Profile Picture Uploaded");
    }
    return null;
  }
}
