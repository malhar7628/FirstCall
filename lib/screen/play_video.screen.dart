import 'package:better_player/better_player.dart';
import 'package:chewie/chewie.dart';
import 'package:first_call_app/screen/dashboard.screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';

import '../controller/showvideo.controller.dart';
import '../controller/video.controller.dart';

class PlayVideo extends StatefulWidget {
  static const name = "/playvideo";
  const PlayVideo({Key? key}) : super(key: key);

  @override
  State<PlayVideo> createState() => _PlayVideoState();
}

class _PlayVideoState extends State<PlayVideo> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<VideoController>(
        init: VideoController(),
        builder: (_) {
          return Scaffold(
              appBar: AppBar(
                backgroundColor: Get.theme.primaryColor.withOpacity(.9),
                title: const Text("PreviewVideo"),
                leading: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.orange),
                    onPressed: () {
                      Get.toNamed(DashboardScreen.name);
                    }),
                elevation: 1,
              ),
              body: _.chewieController != null
                  ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Chewie(
                        controller: _.chewieController!,
                      ),
                    )
                  : const Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.black26,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.black,
                        ),
                      ),
                    ));
        });
  }
}
