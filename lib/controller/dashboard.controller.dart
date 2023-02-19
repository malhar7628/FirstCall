/*

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io' as io;
import '../common/utils_common.dart';
import '../screen/sign_in.screen.dart';
import '../screen/video.screen.dart';
import '../screen/video_list.screen.dart';
import '../service/auth.service.dart';
import '../service/dashboard.service.dart';

class DashboardController extends GetxController {
  final DashboardService _dashboardService = Get.find();
  List cameras = [];
  RxInt currentCameraId = 0.obs;
  //CameraController? cameraController;
  RxBool isInit = false.obs;
  RxBool isRecordingVideo = false.obs;
  RxInt counter = 0.obs;
  BuildContext? context = Get.context;
  late AnimationController animationController;

  io.File? videoFile;
  RxString path = "".obs;
  ImagePicker imagePicker = ImagePicker();

  int _countdownTimer = 0;
  RxInt countdownCounter = 0.obs;

  int get countdownTimer => _countdownTimer;

  set countdownTimer(int value) {
    _countdownTimer = value;
  }
  var isLoading = false.obs;
  var imageURL = '';

  */
/*final _firebaseMessaging = FirebaseMessaging.instance;
  int _notificationId = 0;
  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  @override
  void onInit() async {
    super.onInit();
    await flutterLocalNotificationsPlugin.initialize(
        const InitializationSettings(
            android: AndroidInitializationSettings("logo"),
            iOS: IOSInitializationSettings()));
    _firebaseMessaging.requestPermission().then((value) async {});
    FirebaseMessaging.onMessage.listen((message) {
      if (message.notification != null) {
        showNotification(
            id: _notificationId++,
            title: message.notification!.title!,
            body: message.notification!.body!);
      }
    });
  }*/ /*


  */
/*Future<void> initCamera() async {
    await imagePicker
        .pickVideo(
        source: ImageSource.camera, maxDuration: const Duration(seconds: 60))
        .then((value) async {
      if (value == null) {
        Get.back();
      } else {
        await previewVideo(value);
      }
    });
  }*/ /*

  */
/*signOut() async {
    final confirm = await showConfirmationDialog(
        title: "Sign Out", content: "Are you sure?");
    if (!(confirm ?? false)) {
      return;
    }
    showLoadingDialog();
    final response = await _authService.signOut();
    removeDialog();
    if (response) {
      Get.offAllNamed(SignInScreen.name);
    } else {
      showToast("Something went wrong");
    }
  }*/ /*

  final children =  [
    const VideoScreen(),
    const SignInScreen(),
  ];
  final _currentIndex = 0.obs;

  int get currentIndex => _currentIndex.value;
  set currentIndex(int value) => _currentIndex.value = value;
}


*/

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:first_call_app/screen/video_screen_postshowcase.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

import '../common/utils_common.dart';
import '../screen/account_screen.dart';
import '../screen/sign_in.screen.dart';
import '../screen/video.screen.dart';
import '../screen/video_list.screen.dart';

class DashboardController extends GetxController {
  /* final _firebaseMessaging = FirebaseMessaging.instance;
  int _notificationId = 0;
  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  @override
  void onInit() async {
    super.onInit();
    await flutterLocalNotificationsPlugin.initialize(
        const InitializationSettings(
            android: AndroidInitializationSettings("logo"),
            iOS: IOSInitializationSettings()));
    _firebaseMessaging.requestPermission().then((value) async {});
    FirebaseMessaging.onMessage.listen((message) {
      if (message.notification != null) {
        showNotification(
            id: _notificationId++,
            title: message.notification!.title!,
            body: message.notification!.body!);
      }
    });
  }
*/
  final children = [
    const VideoScreen(),
    const AccountScreen(),
    //const VideoQuestionListScreen(),

    // SizedBox(),
  ];

  final children2 = [
    const VideoScreenPostShowCase(),
    const AccountScreen(),
    //const VideoQuestionListScreen(),

    // SizedBox(),
  ];

  final _currentIndex = 0.obs;

  int get currentIndex => _currentIndex.value;
  set currentIndex(int value) => _currentIndex.value = value;
}
