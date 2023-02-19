import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common/utils_common.dart';
import '../data/videolist.data.dart';
import '../model/jobRole.data.dart';
import '../data/sign_up.data.dart';
import '../screen/sign_in.screen.dart';
import '../service/auth.service.dart';
import '../service/dashboard.service.dart';
import '../service/network.service.dart';

class SignUpController extends GetxController {
  final AuthService _authService = Get.find();
  final formKey = GlobalKey<FormState>();
  //final NetworkService _networkService = Get.find();
  final DashBoardService _dashboardService = Get.find();

  final _autovalidateMode = AutovalidateMode.disabled.obs;

  AutovalidateMode get autovalidateMode => _autovalidateMode.value;

  set autovalidateMode(AutovalidateMode value) =>
      _autovalidateMode.value = value;

  final _termsAccept = false.obs;

  set termsAccept(value) => _termsAccept.value = value;

  bool get termsAccept => _termsAccept.value;

  RxList<JobRoleUserModel> userJobRole = <JobRoleUserModel>[].obs;
  //final RxList<VideoList> list = RxList<VideoList>();
  JobRoleUserModel? selectedRole;

  final signUpData = SignUpData();

  //final lobRole = JobRoleUser();

  @override
  void onInit() {
 //   getUserRole();
    super.onInit();
  }

  selectRole(JobRoleUserModel? value) async {
    /*  print("response");
    final response = await _dashboardService.getJobRole();
    print(response);
    if (response == null) {
      return;
    }else {
      userJobRole.value = response;
      print(userJobRole.value);
    }
    //_networkService.jobrole = value?.name;
  //  selectedRole = value;
    Get.back(result:signUp());*/
    //print(userCars);
  }
  getUserRole() async {
    print("response");
    final response = await _dashboardService.getJobRole();
    print(response);
    if (response != null) {
      /*  _dashboardService.vehicleNumber = response[0].id;
      selectedRole ??= response[0];*/
      userJobRole.value = response;
      return;
    }
    /*else {
      _dashboardService.vehicleNumber = response[0].id;
      selectedRole ??= response[0];
      userJobRole.value = response;
      print(userJobRole.value);
    }*/
    /*_dashboardService.jobrole = response![0].name;
      selectedRole ??= response![0];
      userJobRole.value = response!;
    } else {
      _dashboardService.jobrole = response[0].name;
      selectedRole ??= response[0];
      userJobRole.value = response;
    }
    if (response.isEmpty) {
      Get.toNamed(AddVehicleScreen.name, arguments: {
        "showSkip": true,
      });
    } else {
      _dashboardService.vehicleNumber = response[0].vehicleNo;
      selectedCar ??= response[0];
      userCars.value = response;
    }*/
  }

  signUp() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
    } else {
      autovalidateMode = AutovalidateMode.onUserInteraction;
      return;
    }
    if (termsAccept == false) {
      showToast("Please accept Terms & Conditions");
      //print(lobRole.name);
      return;
    }
    showLoadingDialog();
    final response = await _authService.signUp(signUpData);
    print("Sign UP Response:- "+ response.toString());
    removeDialog();
   if (response == 200) {
      final otpVerified = await showOtpDialogSignUp((value) async {
        showLoadingDialog();
        final otpVerified = await _authService.verifyOtp(email:signUpData.email!, otp: value);
        print("otp verified23:-$otpVerified");
        removeDialog();
        if (otpVerified ?? false) {
          Get.back(result: otpVerified);
        } else {
          print("check nNNN");
          showToast("OTP verification failed!");
        }
      }
      );
      if (otpVerified ?? false) {
        print("check if sucess:-$otpVerified");
        await showAlertDialog(
            title: "Success",
            content: "Registration Successful. Please Sign-In.");
        Get.offAllNamed(SignInScreen.name);
      } else {
        print("hello");
        showToast("OTP verification failed!");
      }
    } else if (response == 409) {
      showToast("User already exists");
    } else {
      showToast("Something went wrong");
    }
  }
}
// if (userCars.isEmpty) {
// await _getUserCars();
// }
//
// final _chargingPointodel = NearbyPointsData(
//   latitude: position!.latitude.toString(),
//   longitude: position!.longitude.toString(),
// );
//
// if (selectedCar != null) {
// _chargingPointodel.carModelId = selectedCar?.modelId;
// }
