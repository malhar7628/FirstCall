import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/record_video.controller.dart';
import '../controller/showvideo.controller.dart';
import '../controller/sign_up.controller.dart';
import '../model/jobRole.data.dart';
import '../widget/interview_question.widget.dart';
import '../widget/show.video.widget.dart';

class VideoQuestionListScreen extends StatelessWidget {
  static const name = "/video";
  SignUpController suc = SignUpController();
  VideoQuestionListScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetX<RecordVideoController>(
        init: RecordVideoController(),
        builder: (_) {
          return Scaffold(
            body: Column(
              children: [
                if (_.loading)
                  const Expanded(
                      child: Center(
                    child: CircularProgressIndicator(),
                  ))
                else if (!_.loading && _.list.isEmpty)
                  Expanded(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("No Question's found"),
                          TextButton(
                            onPressed: _.getVideoList,
                            child: Text(
                              "Try again",
                              style: TextStyle(
                                  color:
                                      Get.theme.primaryColor.withOpacity(.9)),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                else
                  Expanded(
                    child: ListView.builder(
                      itemCount: _.list.length,
                      itemBuilder: (BuildContext context, int index) {
                        final record = _.list[index];
                        return RecordVideoQuestionTile(video: record);
                      },
                    ),
                  ),
                /* Align(
                  alignment: Alignment.topLeft,
                  child: SafeArea(
                    child: Container(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 12),
                      margin: const EdgeInsets.all(12),
                      width: 175,
                      decoration: BoxDecoration(
                        color: Get.theme.cardColor.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DropdownButtonFormField<JobRole>(
                        isExpanded: true,
                        items: suc.userJobRole
                            .map((element) =>
                            DropdownMenuItem<JobRole>(
                              value: element,
                              child: Text(
                                element.name.toString(),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ))
                            .toList(),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                        value: suc.selectedRole,
                        onChanged: suc.selectRole,
                      ),
                    ),
                  ),
                ),*/
                /* Container(
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton.extended(
                    onPressed: () {_.initCamera();},
                    label: const Text('Add Video'),
                    icon: const Icon(Icons.video_call_rounded),
                    backgroundColor:  Get.theme.primaryColor.withOpacity(.9),
                  ),
                ),*/
              ],
            ),
          );
        });
  }
}
