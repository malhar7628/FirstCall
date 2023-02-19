import 'package:first_call_app/screen/dashboard_aftershowcase_screen.dart';
import 'package:first_call_app/screen/onboard_dope_screen.dart';
import 'package:first_call_app/service/network.service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:showcaseview/showcaseview.dart';

import '../common/enum_common.dart';
import '../common/utils_common.dart';
import '../data/sign_in.data.dart';
import '../screen/dashboard.screen.dart';
import '../screen/sign_in.screen.dart';
import '../service/auth.service.dart';

class SignInController extends GetxController {
  final NetworkService _networkService = Get.find();
  final AuthService _authService = Get.find();
  final formKey = GlobalKey<FormState>();

  final _autovalidateMode = AutovalidateMode.disabled.obs;
  AutovalidateMode get autovalidateMode => _autovalidateMode.value;
  set autovalidateMode(AutovalidateMode value) =>
      _autovalidateMode.value = value;

  final signInData = SignInData();

  void signIn() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
    } else {
      autovalidateMode = AutovalidateMode.onUserInteraction;
      return;
    }
    showLoadingDialog();
    final response = await _authService.signIn(signInData);
    removeDialog();
    if (response == ResponseStatus.success) {
      if (_networkService.firstLoginCheck == "Y" ||
          _networkService.auditionCountCheck == "0") {
        Get.offAll(() => const OnBoardDopeScreen());
      } else {
        Get.offAll(() => const DashboardScreenPostShowCase());
      }
/*      Get.offAll(()=>
      ShowCaseWidget(
          builder: Builder(
            builder: (context) => const DashboardScreen(),
          )));*/
    } else if (response == ResponseStatus.failure) {
      showToast("Invalid Credentials");
    } else {
      showToast("Something went wrong");
    }
  }
}
