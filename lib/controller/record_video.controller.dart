import 'package:better_player/better_player.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

import '../common/api_common.dart';
import '../common/constants_common.dart';
import '../common/utils_common.dart';
import '../data/videolist.data.dart';
import '../model/transaction.model.dart';
import '../screen/play_video.screen.dart';
import '../screen/player.screen.dart';
import '../service/dashboard.service.dart';

class RecordVideoController extends GetxController {
  final DashBoardService _dashboardService = Get.find();
  ShowVideoModel? Video;
  late VideoPlayerController videoPlayerController;
  ChewieController? chewieController;
  late BetterPlayerController betterPlayerController;

  @override
  void onInit() {
    getVideoList();
    super.onInit();
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController?.dispose();
    super.dispose();
  }

  final _loading = false.obs;
  set loading(value) => _loading.value = value;
  bool get loading => _loading.value;

  final RxList<VideoList> list = RxList<VideoList>();

  getVideoList() async {
    loading = true;
    final response = await _dashboardService.getVideoListApi();
    if (response == null) {
      showToast(kErrorMessage);
    } else {
      list.value = response;
    }
    loading = false;
  }
/*

  getDelete(String id) async {
    loading = true;
    final response = await _dashboardService.DeleteVideoApi(id);

    if(response != null){
      Get.offAll( ()=>MyHomePage(video: Video,));
      Get.offNamed(DashboardScreen.name);
      showToast("Error");
    }
    else{
      Get.offAll( ()=>MyHomePage(video: Video,));
      Get.offNamed(DashboardScreen.name);
      showToast("Video is deleted");

    }
    return response;
  }
*/
/*
  getCopylink(String unId) async {
    loading = true;
    final response = await _dashboardService.CopylinkApi(unId);
    if (response != null) {
      showToast(kErrorMessage);
    } else {
      //Get.back(result: getVideo());
      showToast("VideoLink is Shared");
      //Get.offAll(() => const AccountScreen());
      Get.back();
      //Get.offAll(const AccountScreen());
      //
      //Get.to(()=>const AccountScreen());
    }
    loading = false;
  }*/
/* getVideoSample(String unId
) async {
    loading = true;
    final response = await _dashboardService.initPlayer(unId);
    print(response);
    if (response != null) {
      Get.offAll(const PlayVideo());
      showToast("Video is been Played");
    } else {
      showToast(kErrorMessage);
    }
    loading = false;
  }
  // Future<void> playVideo() async {
  //   String url = "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4" previewVideoButtonUrl;
  //   //final phone = _networkService.userId;
  //   //final data = {"unId": unId,};
  //   //  url ="D:/test";//url+data.toString()+phone!+"/494668122.2827653411M4128837TP";
  //   print(url);
  //   videoPlayerController = VideoPlayerController.network(url);
  //   videoPlayerController.initialize().then((_) =>
  //   chewieController = ChewieController(
  //     videoPlayerController: videoPlayerController,
  //       autoPlay: true,
  //     looping: true,
  //     materialProgressColors: ChewieProgressColors(
  //         playedColor: Colors.red,
  //         handleColor: Colors.cyanAccent,
  //         backgroundColor: Colors.yellow,
  //         bufferedColor: Colors.lightGreen
  //     ),
  //     placeholder: Container(
  //       color: Colors.greenAccent,
  //     ),
  //      autoInitialize: true,
  //   )
  //   );
  //   update();
  //   // await Future.wait([videoPlayerController.initialize()]);
  //
  // }

  betterplayer() async{
    String url = previewVideoButtonUrl;
    BetterPlayerConfiguration betterPlayerConfiguration = const BetterPlayerConfiguration(
        aspectRatio: 16/9,
        fit: BoxFit.contain
    );
    BetterPlayerDataSource dataSource = BetterPlayerDataSource(BetterPlayerDataSourceType.network, url);
  }*/
}
/*initPlayer() async {
    videoPlayerController = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');
    await videoPlayerController.initialize();

    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: true,
      looping: true,
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
    );
  }
}*/
