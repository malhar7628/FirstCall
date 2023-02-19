import 'package:better_player/better_player.dart';
import 'package:chewie/chewie.dart';
import 'package:clipboard/clipboard.dart';
import 'package:first_call_app/screen/dashboard.screen.dart';
import 'package:first_call_app/service/network.service.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../common/constants_common.dart';
import '../common/utils_common.dart';
import '../model/transaction.model.dart';
import '../screen/dashboard_aftershowcase_screen.dart';
import '../service/dashboard.service.dart';
import '../widget/show.video.widget.dart';

class VideoListController extends GetxController {
  final DashBoardService _dashboardService = Get.find();
  final NetworkService _networkService = Get.find();
  ChewieController? chewieController;
  late BetterPlayerController betterPlayerController;
  XFile? viideo;
  late final ShowVideoModel ideo;

  ShowVideoTile? as;

  final RxList<ShowVideoModel> video = RxList<ShowVideoModel>();

  Future getVideo() async {
    //loading = true;
    final response = await _dashboardService.getUserAuditionVideo();
    print("Hii Check ${response}");
    if (response == null) {
      showLoadingDialog();
      Get.offAll(() => const DashboardScreenPostShowCase());
      removeDialog();
      // showToast(kErrorMessage);
    }
    showLoadingDialog();
    if (response != null) {
      showLoadingDialog();
      video.value = response;
      removeDialog();
      /*showLoadingDialog();
      showLoadingDialog();
      removeDialog();*/
      Get.offAll(() => const DashboardScreenPostShowCase());
      removeDialog();
    }
    removeDialog();
    // loading = false;
  }

  @override
  void onInit() {
    getVideo();
    super.onInit();
  }

  @override
  void dispose() {
    //  videoPlayerController.dispose();
    chewieController?.dispose();
    super.dispose();
  }

  final _loading = false.obs;
  set loading(value) => _loading.value = value;
  bool get loading => _loading.value;

  Future<void> initCamera(String auditionID /*, String cid*/) async {
    await _dashboardService.imagePicker
        .pickVideo(
            source: ImageSource.camera,
            maxDuration: const Duration(seconds: 60))
        .then((value) async {
      if (value != null) {
        print("Value not null");
        loading = true;
        await _dashboardService.previewVideo(value, auditionID /*,cid*/);
        //await _dashboardService.getCompress(value);
        //buildVideoCompress();
        //Get.offAll(()=>DashBoardService());
        String count = "1";
        _networkService.auditionCountCheck =
            _networkService.auditionCountCheck! + int.parse(count).toString();
        print("Check Counter");
        print(_networkService.auditionCountCheck);
        Get.offAll(() => const DashboardScreenPostShowCase());
        loading = false;
      } else {
        print("Value Null");
//        showLoadingDialog();
        Get.offAll(() => const DashboardScreenPostShowCase());
        Get.back();
      }
    });
  }

  verifyAuditonIDAndDeadline(String auditionID /*, String cid*/) async {
    print("Audition ID :---" + auditionID.toString());
    /* print("cid:-"+cid);*/
    final response = await _dashboardService.verifyAuditionID(auditionID);
    if (response == null) {
      showToast(kErrorMessage);
    }
    if (response != null) {
      showToast("Please Record your Audition Video");
      await initCamera(auditionID /*, cid*/);
    }
  }

  getDelete(String id) async {
    loading = true;
    final response = await _dashboardService.deleteVideoApi(id);
    if (response ?? false) {
      showLoadingDialog();
      Get.offNamed(DashboardScreen.name);
      //getVideoList();
      showToast("Video is deleted");
      removeDialog();
    } else {
      showToast(kErrorMessage);
    }
    loading = false;
    return response;
  }

  getCopylink(String copyUrl, String unId) async {
    final tt = "${_dashboardService.CopylinkApi(copyUrl, unId)}";
    //final gg = Link(tt);
    //final response = await LinkText(tt);
    //final response =  await Link(tt);
    final response = await FlutterClipboard.copy(tt);
    print("11111111" + tt.toString());
    //showToast("✓Copied to Clipboard");
    return response;
  }

  getshareStatus(String id) async {
    showLoadingDialog();
    final response = await _dashboardService.shareStatusApi(id);
    if (response ?? false) {
      // showLoadingDialog();
      // Get.offAll(() => const AccountScreen());
      // removeDialog();
      // //showToast("Status Changed ");
      showLoadingDialog();
      Get.offAll(() => const DashboardScreen());
      removeDialog();

      removeDialog();
    } else {
      showToast("Please record a video");
    }
    return response;
  }
}
