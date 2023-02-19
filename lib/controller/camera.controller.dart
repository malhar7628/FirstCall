
import 'dart:async';
import 'dart:io' as io;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../common/utils_common.dart';
import '../screen/sign_in.screen.dart';
import '../service/auth.service.dart';
import '../service/dashboard.service.dart';



class CameraController extends GetxController {
  final AuthService _authService = Get.find();
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
//  CameraController? _controller;
 // CameraDescription? cameraDescription;

  /* void uploadImage(ImageSource imageSource) async {
    try {
      final pickedFile = await ImagePicker().getVideo(source: ImageSource.gallery);*/
  /*getImage(source: imageSource);*/
  /*
      print(pickedFile);
      //isLoading(true);
      if (pickedFile != null) {
        var response = await ImageService.getHttp()*/
  /*uploadFile(pickedFile.path);*/
/*
        print(pickedFile);
        if (response.statusCode == 200) {
          //get image url from api response
          print("MMMM");
          print(response.statusCode);
          response.data["respData"];
          //Get.back();
          Get.snackbar('Success', 'Video uploaded successfully',
              margin: const EdgeInsets.only(top: 5,left: 10,right: 10));
        } else if (response.statusCode == 401) {
          //Get.offAllNamed('/sign_up');

        } else {
          Get.snackbar('Failed', 'Error Code: ${response.statusCode}',
              margin: const EdgeInsets.only(top: 5,left: 10,right: 10));
        //  Get.back();
        }
      } else {
        Get.snackbar('Failed', 'Image not selected',
            margin: const EdgeInsets.only(top: 5,left: 10,right: 10));

      }
    } finally {
      //isLoading(false);
    }
  }*/


  signOut() async {
    final confirm = await showConfirmationDialog(
        title: "Sign Out", content: "Are you sure?");
    if (!(confirm ?? false)) {
      return;
    }
   // showLoadingDialog();
    final response = await _authService.signOut();
   // removeDialog();
    if (response) {
      Get.offAllNamed(SignInScreen.name);
    } else {
      showToast("Something went wrong");
    }
  }
/*Future<void> stopCameraRecording()async{
    videofile= await cameraController!.stopVideoRecording();
    print(videofile!.path);
    //await GallerySaver.saveVideo(videofile.path);
    fileForSend = File(videofile!.path);

    print("용량 : ${await fileForSend!.length()}");
  }*/
/* Future<void> previewVideo(XFile video) async {

    videoFile = io.File(video.path);
    path.value = video.path;
    print(path);

    */
/*isInit.value = false;
    final parameter = <String, String>{
      'source': VideoSource.local.asString()!,
      'filePath': video.path,
    };
    await Get.to((screen: ROUTER_REPLAY_VIDEO, parameter: parameter));
    unawaited(initCamera());
  }*/
/*
}*/
/*
class CameraManager {
  List<CameraDescription>? cameras;
  CameraController? _controller;
  CameraDescription? cameraDescription;

  Future<CameraController?> load() async {
    print("CameraControl");
    cameras = await availableCameras();
    //Set front camera if available or back if not available
    int position = cameras!.length > 1 ? 1 : 0;
    _controller = CameraController(
      cameras![position],
      ResolutionPreset.high,
      enableAudio: true,
    );
    cameraDescription = _controller?.description;
    await _controller?.initialize();
    return _controller;
  }

  Future<CameraController?> changeCamera() async {
    cameras = await availableCameras();
    final lensDirection =  _controller?.description.lensDirection;
    CameraDescription newDescription;
    if(lensDirection == CameraLensDirection.front){
      newDescription = cameras!.firstWhere((description) => description.lensDirection == CameraLensDirection.back);
    }
    else{
      newDescription = cameras!.firstWhere((description) => description.lensDirection == CameraLensDirection.front);
    }

    _controller = CameraController(
      newDescription,
      ResolutionPreset.medium,
      enableAudio: true,
    );

    cameraDescription = _controller?.description;
    await _controller?.initialize();
    return _controller;
  }

  CameraController? get controller => _controller;
}*/
}
