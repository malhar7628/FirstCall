import 'dart:convert';
import 'dart:developer';
import 'dart:io' as io;
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../common/api_common.dart';
import '../common/enum_common.dart';
import '../model/jobRole.data.dart';
import '../data/sign_in.data.dart';
import '../data/sign_up.data.dart';
import 'network.service.dart';

class AuthService extends GetxService {
  final NetworkService _networkService = Get.find();

  Future<ResponseStatus> signIn(SignInData input) async {
    final data = input.toJson();
    /*const url = "http://localhost:8080/ELVTR_Api/api/v1/auth/signin";*/
    log("$data");
    //   log("$signInUrl");
    String? ab = _networkService.accessToken;
    //  final fcmToken = await FirebaseMessaging.instance.getToken();
    /* if (fcmToken != null) {
      log("FCM Token => $fcmToken");
      log("Access Token => $ab");
      data["fcmToken"] = fcmToken;
    }*/
    try {
      print(ab.toString());
      final response = await _networkService.dio.post(signInUrl,
          data: data,
          options: Options(
            headers: {
              "Content-Type": "application/json",
              //     HttpHeaders.authorizationHeader: "Bearer $ab"
            },
          ));
      //  log("$signInUrl");
      if (response.statusCode == 200) {
        print(response);
        final data = response.data["payload"];
        _networkService.accessToken = data["accessToken"];
        _networkService.refreshToken = data["refreshToken"];
        _networkService.userPhone = input.username;
        _networkService.userName = data["username"];
        _networkService.userId = data["userId"];
        _networkService.userEmail = data["email"];
        _networkService.firstLoginCheck = data["firstlogin"];
        _networkService.auditionCountCheck = data["auditioncount"].toString();
        return ResponseStatus.success;
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 401 || e.response?.statusCode == 404) {
        return ResponseStatus.failure;
      } else if (e.response?.data["errors"] != null) {
        final error = e.response?.data["errors"];
        if (error["message"].toString().toLowerCase() == "bad credentials") {
          return ResponseStatus.failure;
        }
      }
      return ResponseStatus.error;
    } catch (_) {
      return ResponseStatus.error;
    }
    return ResponseStatus.failure;
  }

  Future<int> signUp(SignUpData input) async {
    final data = input.toJson();
    log("$data");
    String? ab = _networkService.accessToken;
    try {
      final response = await _networkService.dio.post(signUpUrl,
          data: data,
          options: Options(
            headers: {
              "Content-Type": "application/json",
              HttpHeaders.authorizationHeader: "Bearer $ab"
            },
          ));
      return response.statusCode ?? 500;
    } on DioError catch (e) {
      return e.response?.statusCode ?? 500;
    } catch (e) {
      log("$e");
      return 500;
    }
  }

  Future<bool?> verifyOtp({required String email, required String otp}) async {
    try {
      String? ab = _networkService.accessToken;
      String url = emailOtpVerificationUrl;
      final data = {"email": email, "otp": otp};
      print("otp data:-" + data.toString());
      final response = await _networkService.dio.post(url,
          data: data,
          options: Options(
            headers: {
              "Content-Type": "application/json",
              HttpHeaders.authorizationHeader: "Bearer $ab"
            },
          ));
      print("otp response:-" + response.statusCode.toString());
      //    print("check verification:-"+emailOtpVerificationUrl);
      //    print("check payload:-"+response.data);
      if (response.statusCode == 200) {
        return true;
      }
      return null;
    } catch (e) {
      e.printInfo();
      return null;
    }
  }
  /*Future<List<JobRoleUserModel>?> getJobRole() async {
    String? ab = _networkService.accessToken;
    try {
      print("111"+InterviewQuestionCategorgyUrl);
      //final phone = _networkService.userPhone;
      final response = await _networkService.dio.get(InterviewQuestionCategorgyUrl,options: Options(*/ /*contentType: Headers.jsonContentType*/ /*
        headers: {
          "Content-Type": "application/json"
        },
      ));
      print(response.data['payload']);
      print(jobRoleFromJson(jsonEncode(response.data['payload'])));
      return jobRoleFromJson(jsonEncode(response.data['payload']));
    } catch (e) {
      print("121");
      return null;
    }
  }*/

  Future<bool> signOut() async {
    try {
      // final phone = _networkService.userPhone;
      // final data = {"username": phone};
      // final response = await _networkService.dio.post(signOutUrl, data: data);
      //    if (response.statusCode == 200) {
      clearUser();
      return true;
//      }
      return false;
    } catch (e) {
      return false;
    }
  }

  clearUser() {
    _networkService.accessToken = null;
    _networkService.refreshToken = null;
    _networkService.userName = null;
    /*_networkService.userPhone = null;*/
    _networkService.id = null;
    _networkService.userId = null;
    _networkService.bookingId = null;
    _networkService.firstLoginCheck = null;
  }

// S-Cube code starts
  /* ForgotPasswordData fpd = ForgotPasswordData();

  Future<bool?> resetPassword(ResetPasswordData input) async {
    try {
      final String? userUpdate = _networkService.userPhone;
      input.mobileUser_Id = userUpdate;
      */ /*fpd.mobileNo = userUpdate;*/ /*
      final _data = input.toJson();
      String link = resetpasswordUrl;
      final response = await _networkService.dio.post(link, data: _data,options: Options(
        headers: {
          "Content-Type": "application/json", HttpHeaders.authorizationHeader:  "Bearer ${_networkService.accessToken}"
        },
      ));
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } on DioError catch (e) {
      if (e.response?.data != null) {
        showToast("${e.response?.data["errors"]?["message"]}");
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<int> forgotPassword(ForgotPasswordData input) async {
    */ /*final String? userUpdate = _networkService.userPhone;
    input.mobileNo = userUpdate;*/ /*
    final data = input;
    log("$data");
    print(data);
    String s = generateOtpUrl;
    print(s);
    try {
      final response = await _networkService.dio.post(s, data: input,options: Options(
        headers: {
          "Content-Type": "application/json", HttpHeaders.authorizationHeader:  "Bearer ${_networkService.accessToken}"
        },
      ));
      print(response);
      return response.statusCode ?? 200;
    } on DioError catch (e) {
      return e.response?.statusCode ?? 500;
    } catch (e) {
      log("$e");
      return 500;
    }
  }

  Future<bool?> MobileverifyOtp(
      {required String mobileNo, required String otp, String? mobileUser_Id}) async {
    try {
      final data = {
        "mobileNo": mobileNo,
        "otp": otp,
      };
      print(data);
      final response =
      await _networkService.dio.post(validateOtpUrl, data: data,options: Options(
        headers: {
          "Content-Type": "application/json", HttpHeaders.authorizationHeader:  "Bearer ${_networkService.accessToken}"
        },
      ));
      print(response);
      if (response.statusCode == 200) {
        return response.data["payload"] as bool;
      }
      return null;
    } catch (e) {
      return null;
    }
  }*/
// S-Cube code ends
}
