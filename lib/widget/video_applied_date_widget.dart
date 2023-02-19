import 'package:first_call_app/controller/video_list_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:intl/intl.dart';

import '../controller/record_video.controller.dart';
import '../model/transaction.model.dart';

class VideoAppliedDateTile extends StatefulWidget {
  final ShowVideoModel video;
  final VoidCallback? onShareTap;
  final VideoListController svc;
  final VoidCallback? toogle;

  const VideoAppliedDateTile({
    Key? key,
    required this.video,
    this.onShareTap,
    required this.svc,
    this.toogle,
  }) : super(key: key);

  @override
  State<VideoAppliedDateTile> createState() => _VideoAppliedDateTileState();
}

class _VideoAppliedDateTileState extends State<VideoAppliedDateTile> {
  final RecordVideoController rvc = RecordVideoController();

  String oldDate = "";

  int count = 0;

  @override
  Widget build(BuildContext context) {
    /*final formatter = DateFormat('yyyy-MMM-dd');
 //   final monthName = DateFormat("MM").format(DateTime.now());
    var currentDate = DateTime.now();
    if (kDebugMode) {
      print("Current Date$currentDate");
    }
    var subtractDate = currentDate.subtract(const Duration(days: 1));
    if (kDebugMode) {
      print("Subtracted Current Date :-- $subtractDate");
    }

    var formattedSubtractDate = formatter.format(subtractDate);
    if (kDebugMode) {
      print("Formatted Subtracted Date :-- " + formattedSubtractDate.toString());
    }

    String formattedCurrentDate = formatter.format(currentDate);
    print("Current Date formatedd " + formattedCurrentDate);

    var applicationDate = widget.video.applicationdate;
    print("Application Date$applicationDate");

    var applyDate = DateTime.parse(applicationDate!);
    print("Apply Date in Date :--- " + applyDate.toString());

    var formattedApplyDate = formatter.format(applyDate);
    print("Formatted Apply Date :-- " + formattedApplyDate.toString());

    String displayDate = "";

    print("Count check");
    print(count);

    if(formattedCurrentDate == applicationDate) {
      print("Check IF ");
      print("formattedCurrentDate :---- " + formattedCurrentDate.toString() + " "
          + "applicationDate :---- " + applicationDate.toString());
      displayDate = "Today";
      count++;
      print("count add");
      print(count);
      if(count > 0) {
        print("Videos uploaded on same day");
      }
      print("Display Date in If  "+ displayDate);
    }
    else if(formattedApplyDate == formattedSubtractDate){
      print("Check Else If for Yesterday Date");
      print("formattedCurrentDate :---- " + formattedCurrentDate.toString() + " "
          + "applicationDate :---- " + applicationDate.toString());
      displayDate = "Yesterday";
      print("Display Date in Else If "+ displayDate);
    }*/
    /* else {
      displayDate = widget.video.applicationdate.toString();
      var formattedTemporaryDate = DateTime.parse(displayDate);
      final dateString = DateFormat('yyyy-MMM-dd').format(formattedTemporaryDate);
      if (kDebugMode) {
        print("Display Date in Else :--- $dateString");
      }
    }*/

    return Column(
      children: [
        /*        if(count == 0)
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                alignment: Alignment.topCenter,
                height: Get.height * 5/150,
                width: Get.width * 50/150,
                margin: const EdgeInsets.fromLTRB(2, 5, 2, 15),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: const Color(0x00d3e0e4).withOpacity(.9),
                    boxShadow: [
                      BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 3.0)
                    ],
                    borderRadius:  const BorderRadius.only(
                        topLeft:Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)
                    )),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Stack(
                        children: [
                          Positioned(
                              child: Text("             $displayDate",
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.lato(
                                  color: const Color(0x005c7d8a).withOpacity(.9),
                                  fontWeight: FontWeight.bold,
                                )
                              )
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),*/

        const SizedBox(height: 10),
        Container(
          height: Get.height * 23 / 105,
          margin: const EdgeInsets.fromLTRB(2, 5, 2, 15),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Get.theme.cardColor.withOpacity(0.9),
              boxShadow: [
                BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 3.0)
              ],
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Stack(children: [
                          Positioned(
                              child: RichText(
                                  text: TextSpan(
                                      text: "PRESCREEN ID# ",
                                      style: GoogleFonts.lato(
                                        color: Get.theme.primaryColor
                                            .withOpacity(.9),
                                        fontWeight: FontWeight.bold,
                                      ),
                                      children: [
                                TextSpan(
                                    text:
                                        "${widget.video.auditionInfo?.auditionid}                          ",
                                    style: GoogleFonts.lato(
                                      color: const Color(0x005c7d8a)
                                          .withOpacity(.9),
                                      fontWeight: FontWeight.normal,
                                    )),
                              ])).marginOnly(top: 1, left: 10, right: 1)),
                        ]),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                      text: "Deadline",
                      style: GoogleFonts.lato(
                        color: Get.theme.primaryColor.withOpacity(.9),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: "${widget.video.auditionInfo?.deadlinedate} ",
                      style: GoogleFonts.lato(
                        color: const Color(0x005c7d8a).withOpacity(.9),
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ])).marginOnly(top: 1, left: 10, right: 1),

                  RichText(
                    text: TextSpan(
                        text: "Location   ",
                        style: GoogleFonts.lato(
                          color: Get.theme.primaryColor.withOpacity(.9),
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                              text: "${widget.video.auditionInfo?.location}",
                              style: GoogleFonts.lato(
                                color: const Color(0x005c7d8a).withOpacity(.9),
                                fontWeight: FontWeight.normal,
                              )),
                        ]),
                  ).marginOnly(top: 4, left: 10, right: 1),

                  const SizedBox(height: 3),
                  RichText(
                    text: TextSpan(
                        text: "Title   ",
                        style: GoogleFonts.lato(
                          color: Get.theme.primaryColor.withOpacity(.9),
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                              text: "${widget.video.auditionInfo?.name}",
                              style: GoogleFonts.lato(
                                color: const Color(0x005c7d8a).withOpacity(.9),
                                fontWeight: FontWeight.normal,
                              )),
                        ]),
                  ).marginOnly(top: 4, left: 10, right: 1),

                  const SizedBox(height: 4),
                  Text(
                    "Description ",
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.lato(
                      color: Get.theme.primaryColor.withOpacity(.9),
                      fontWeight: FontWeight.bold,
                    ),
                  ).marginOnly(top: 4, left: 10, right: 1),

                  //    const SizedBox(height: 1),
                  Expanded(
                    child: Text("${widget.video.auditionInfo?.description}",
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.lato(
                          color: const Color(0x005c7d8a).withOpacity(.9),
                          fontWeight: FontWeight.normal,
                        )).marginOnly(top: 4, left: 10, right: 1, bottom: 4),
                  ),
                  const SizedBox(height: 4),
                ],
              ),
            ),
          ]),
        ),
      ],
    );
  }
}
