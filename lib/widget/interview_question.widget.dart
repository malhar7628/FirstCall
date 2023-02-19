import 'package:first_call_app/data/videolist.data.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../common/utils_common.dart';
import '../controller/play_video.controller.dart';
import '../controller/showvideo.controller.dart';
import '../controller/video.controller.dart';
import '../model/transaction.model.dart';
import '../screen/player.screen.dart';

class RecordVideoQuestionTile extends StatelessWidget {
  final VideoList video;
  //final ShowVideoController svc;
  final PlayVideoController pvc = PlayVideoController();
  final ShowVideoController svc = ShowVideoController();
  final VideoController vc = VideoController();
  RecordVideoQuestionTile({
    Key? key,
    required this.video,
    /*required this.svc*/
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(12, 0, 12, 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(color: Get.theme.cardColor),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Center(
                    child: GestureDetector(
                      //      onTap: () {  svc.initCamera("${video.aid}");},
                      onTap: () {
                        null;
                      },
                      child: Text("${video.name}",
                          style: TextStyle(
                            color: Get.theme.primaryColor.withOpacity(.9),
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          )),
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
