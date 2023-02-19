import 'dart:io';
import 'dart:math';

import 'package:file_picker/file_picker.dart';
import 'package:first_call_app/common/utils_common.dart';
import 'package:first_call_app/model/edit_profile_model.dart';
import 'package:first_call_app/screen/dashboard_aftershowcase_screen.dart';
import 'package:first_call_app/screen/edit_user_profile_screen.dart';
import 'package:first_call_app/service/dashboard.service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../common/api_common.dart';
import '../service/network.service.dart';

class EditController extends GetxController {
  final DashBoardService _dashBoardService = Get.find();
  final NetworkService networkService = Get.find();
  final formKey = GlobalKey<FormState>();

  final _autovalidateMode = AutovalidateMode.disabled.obs;

  AutovalidateMode get autovalidateMode => _autovalidateMode.value;
  set autovalidateMode(AutovalidateMode value) =>
      _autovalidateMode.value = value;

  File? uploadedImage;
  File? secondImage;
  String? imagePath1 = "";
  String? imagePath2 = "";
  String url = "";

  @override
  void onInit() {
    super.onInit();
  }

  Future uploadFirstPicture(ImageSource source) async {
    await _dashBoardService.imagePicker
        .pickImage(source: source)
        .then((value) async {
      if (value != null) {
        uploadedImage = File(value.path);
        //   image.getUserInfoDetailsForEditProfileByUserID();
        final response =
            await _dashBoardService.uploadUserProfilePicByUserID(value);
        if (response != null) {
          imagePath1 = response;
        }
      }
    });
  }

  getUserInfoDetailsForEditProfileByUserID() async {
//    showLoadingDialog();
    final response = await _dashBoardService.getUserInfoByUserID();
    if (response != null) {
      //    removeDialog();
      print("Response Data :--- " + response.toJson().toString());
      Get.dialog(EditUserProfileScreen(userInfoDataModel: response));
    } else {
      return null;
    }
  }

  EditProfileModel editProfileDataModel = EditProfileModel();

  editUserProfile(String? imagePath1, String? imagePath2, String? firstImgName,
      String? secondImgName, String? resume) async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
    } else {
      autovalidateMode = AutovalidateMode.onUserInteraction;
      return;
    }

    if (imagePath1 != null) {
      print("Hiii");
      editProfileDataModel.image1 = imagePath1;
    } else {
      editProfileDataModel.image1 = firstImgName;
    }

    if (imagePath2 != null) {
      print("Hiii Edit");
      editProfileDataModel.image2 = imagePath2;
    } else {
      editProfileDataModel.image2 = secondImgName;
    }

    print(" firstImgName ==== 1111=====" + firstImgName.toString());
    print("imagePath1==== 1111=====" + imagePath1.toString());
    print("imagePath2==== 1111=====" + imagePath2.toString());

    if (firstImgName != null && imagePath1.toString().isEmpty) {
      print("Hiii 2");
      editProfileDataModel.image1 = firstImgName;
    } else {
      editProfileDataModel.image2 = imagePath2;
    }

    print("editProfileDataModel==== 111=====" +
        editProfileDataModel.toJson().toString());

    print(" firstImgName ==== 222=====" + secondImgName.toString());
    print("imagePath1==== 222=====" + imagePath1.toString());
    print("imagePath2==== 222=====" + imagePath2.toString());

    if (secondImgName != null && imagePath2.toString().isEmpty) {
      print("Hiii 3");
      editProfileDataModel.image2 = secondImgName;
    } else {
      editProfileDataModel.image1 = imagePath1;
    }
    print(" CV ==== 222=====" + resume.toString());

    //   print( " CV ==== 222=====" + CV.toString());
    editProfileDataModel.cv = resume;

    print("editProfileDataModel==== 222=====" +
        editProfileDataModel.toJson().toString());

    showLoadingDialog();
    final response =
        await _dashBoardService.editUserProfileByUserID(editProfileDataModel);
    if (response != false) {
      removeDialog();
      showToast("Profile Edited Successfully");
      print(networkService.auditionCountCheck);
      /*if(networkService.auditionCountCheck==0) {
        Get.offAll(() => const DashboardScreen());
      }*/
      Get.offAll(() => const DashboardScreenPostShowCase());
      return true;
    }
    return true;
  }

  Future getSelectedFile() async {
    final response = await _dashBoardService.pickFile();
    showLoadingDialog();
    if (response != false) {
      removeDialog();
      showToast("File is ready Please upload");
      return true;
    }
    return true;
  }

  String? resume = "";
  Future uploadSeletcedFile() async {
    showLoadingDialog();
    final response = await _dashBoardService.uploadFile();
    if (response != null) {
      removeDialog();
      //  showLoadingDialog();
      showToast(response + "File is Uploaded Please submit");
      //   showToast("If Completed with the Edit Profile Screen Please proceed to press Submit to Complete the process");
      resume = response;
    } else {
      removeDialog();
      showToast("No File Present");
    }
  }
}
