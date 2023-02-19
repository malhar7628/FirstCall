import 'package:chewie/chewie.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:video_player/video_player.dart';

import '../common/constants_common.dart';
import '../common/utils_common.dart';
import '../model/transaction.model.dart';
import '../screen/play_video.screen.dart';
import '../screen/player.screen.dart';
import '../service/dashboard.service.dart';

class PlayVideoController extends GetxController {
  final DashBoardService _dashboardService = Get.find();
  late VideoPlayerController videoPlayerController;
  ChewieController? chewieController;
  ShowVideoModel video = ShowVideoModel();
  @override
  void onInit() {
    getVideoSample();
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

  getVideoSample(/*String unId*/) async {
    await  Get.offAll( MyApp(video: video,));
      showToast("Video is been Played");

  }

}