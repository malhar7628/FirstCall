import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

import '../common/api_common.dart';
import '../common/utils_common.dart';
import '../model/transaction.model.dart';
import '../screen/account_screen.dart';
import '../screen/play_video.screen.dart';
import '../service/dashboard.service.dart';
import '../service/network.service.dart';

class VideoController extends GetxController {
  final DashBoardService _dashboardService = Get.find();
  final NetworkService _networkService = Get.find();
  late VideoPlayerController videoPlayerController;
  ChewieController? chewieController;
  ShowVideoModel? video;

  final _loading = false.obs;

  set loading(value) => _loading.value = value;

  bool get loading => _loading.value;

  @override
  void onInit() {
    initPlayer("${video?.unid}");
    super.onInit();
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController?.dispose();
    super.dispose();
  }

  Future<void> initCamera(String aid /*, String id*/) async {
    /*print(id);*/
    loading = true;
    await _dashboardService.imagePicker
        .pickVideo(
            source: ImageSource.camera,
            maxDuration: const Duration(seconds: 60))
        .then((value) async {
      if (value != null) {
        await _dashboardService.previewVideo(value, aid /*,id*/);
      } else {
        Get.back();
      }
      loading = false;
    });
  }

  void initPlayer(String unId) async {
    String? phone = _networkService.userId;
    String url = previewVideoButtonUrl;
    //  url = "$url${phone.toString()}${"/"}${unId}";
//    url = "$url${phone.toString()}${"/"}";
    url = "$url${phone.toString()}${"/"}";
    videoPlayerController = VideoPlayerController.network(url);
    await videoPlayerController.initialize();
    Get.to(() => const PlayVideo());
    //Get.offNamed(PlayVideo.name);
    /*chewieController = ChewieController(
        videoPlayerController: videoPlayerController,
        autoPlay: true,
        looping: true,
        materialProgressColors: ChewieProgressColors(
            playedColor: Colors.red,
            handleColor: Colors.cyanAccent,
            backgroundColor: Colors.yellow,
            bufferedColor: Colors.lightGreen
        ),
        placeholder: Container(
          color: Colors.greenAccent,
        ),
        additionalOptions: (context) {
          return <OptionItem>[
            OptionItem(
              onTap: () => debugPrint('Option 1 pressed!'),
              iconData: Icons.chat,
              title: 'Option 1',
            ),
            OptionItem(
              onTap: () =>
                  debugPrint('Option 2 pressed!'),
              iconData: Icons.share,
              title: 'Option 2',
            ),
          ];
        },
      );*/
  }
}
