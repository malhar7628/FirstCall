import 'dart:io';

import 'package:first_call_app/controller/video_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../common/utils_common.dart';
import '../controller/record_video.controller.dart';
import '../controller/showvideo.controller.dart';
import '../model/transaction.model.dart';
import '../screen/account_screen.dart';
import '../screen/dashboard.screen.dart';
import '../screen/player.screen.dart';

import '../screen/tooglebuttoon.screen.dart';
import '../service/dashboard.service.dart';
import 'Progress_Dialog_widget.dart';

class VideoListTile extends StatefulWidget {
  final ShowVideoModel video;
  final VoidCallback? onShareTap;
  final VideoListController svc;
  final VoidCallback? toogle;

  const VideoListTile({
    Key? key,
    required this.video,
    this.onShareTap,
    required this.svc,
    this.toogle,
  }) : super(key: key);

  @override
  State<VideoListTile> createState() => _VideoListTileState();
}

class _VideoListTileState extends State<VideoListTile> {
  final RecordVideoController rvc = RecordVideoController();
  final DashBoardService _dashboardService = Get.find();

  @override
  Widget build(BuildContext context) {
    //  final quote = "${widget.video.copyUrl}";
    //   final samplelink = "https://scubetechserv.com/#service-sec";
//    String aid="";
    return Center(
      child: Container(
        height: Get.height * 18 / 105,
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
        /*decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(20.0)),
          color: Colors.white,boxShadow: [
          BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 8.0)]
         color: Get.theme.cardColor,
            image: const DecorationImage(
              image: AssetImage("assets/bg.jpeg"),
              fit: BoxFit.cover,
            ),*/
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
                                    text: "SCREEN ID #   ",
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
                                    color:
                                        const Color(0x005c7d8a).withOpacity(.9),
                                    fontWeight: FontWeight.normal,
                                  )),
                              TextSpan(
                                text: "Deadline  ",
                                style: GoogleFonts.lato(
                                  color: Get.theme.primaryColor.withOpacity(.9),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text:
                                    "${widget.video.auditionInfo?.deadlinedate} ",
                                style: GoogleFonts.lato(
                                  color:
                                      const Color(0x005c7d8a).withOpacity(.9),
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ])).marginOnly(top: 1, left: 10, right: 1)),
                      ]),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
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

                /*Expanded(
                  child: ListTile(
                    title: Text("${widget.video.auditionInfo?.instruction}", style: GoogleFonts.lato(
                        color: const Color(0xAEBBC0).withOpacity(.9),
                    )),
                  ),
                ),*/
                // Container(
                //   margin: const EdgeInsets.fromLTRB(2, 0, 5, 5),
                //   child: GestureDetector(
                //     onTap: () {
                //  //     widget.svc.initCamera("${widget.video.category?.id}","AUD002");
                //       showAuditionIDDialog();
                //       //compressVideo();
                //     },
                //     // child: Text("${widget.video.category?.name}",
                //     //     style: const TextStyle(
                //     //       color: Colors.black,
                //     //       //fontWeight: FontWeight.bold,
                //     //       fontSize: 18,
                //     //     )),
                //   ),
                // ),
                // else
                //   Column(
                //     children: [
                //       buildThumbnail(),
                //       buildVideoInfo(),
                //       const SizedBox(height: 8),
                //       buildVideoCompress(),
                //       const SizedBox(height: 8),
                //       ElevatedButton(
                //         onPressed: compressVideo,
                //         child: const Text(
                //           'Compress Video',
                //         ),
                //       ),
                //     ],
                //   ),
                const SizedBox(height: 4),
/*                if (widget.video.id != null)
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        margin: const EdgeInsets.fromLTRB(2, 0, 10, 5),
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Get.offAll(() => MyHomePage(video: widget.video));
                          },
                          style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            primary: Get.theme.primaryColor
                                .withOpacity(.9), // Background color
                          ),
                          icon: const Icon(
                            FontAwesomeIcons.video,
                            size: 15,
                          ),
                          label: const Text("Preview Video"),
                        ),
                      ),
                      const SizedBox(height: 4),
                      ToggleSwitch(
                        minWidth: 80.0,
                        minHeight: 35.0,
                        cornerRadius: 10.0,
                        activeBgColors: [
                          [Colors.red[800]!],
                          [Colors.green[800]!]
                        ],
                        activeFgColor: Colors.white,
                        inactiveBgColor: Colors.grey,
                        inactiveFgColor: Colors.white,
                        initialLabelIndex:widget.video.sharestatusflag,
                        totalSwitches: 2,
                        labels: const ['PRIVATE', 'PUBLIC'],
                        radiusStyle: true,
                        onToggle: (index) {

                          widget.svc.getshareStatus("${widget.video.unid}");
                          showToast('Status to: '"${widget.video.sharestatusflag}");
                        },
                      ),
                    ],
                  ),*/
                /*Transform.scale(
                    scale: 2,
                    child: Switch(
                      onChanged: widget.svc.getshareStatus("${widget.video.id}"),
                      value: widget.video.shareStatusFlag as bool,
                      activeColor: Colors.blue,
                      activeTrackColor: Colors.yellow,
                      inactiveThumbColor: Colors.redAccent,
                      inactiveTrackColor: Colors.orange,
                    )
                ),*/
                const SizedBox(height: 4),
/*                if (widget.video.id != null)
                  Row(
                    children: [
                      if("${widget.video.sharestatus}" != 'PUBLIC')
                      */
                /*Container(
                        alignment: Alignment.bottomLeft,
                        child: TextButton.icon(
                          onPressed: () async {
                     //       if (quote != null) {
                             */
                /**/
                /* if("${widget.video.category?.id}" == "${widget.video.category?.id}"){
                                // final confirm = await showConfirmationDialog(
                                //     title: "The video status is ""${widget.video.shareStatus}" "", content: "Are you sure?");
                                // if (!(confirm ?? false)) {
                                //   return;
                                // }
                              }*/ /**/
                /*
                           //   showToast("✓ Copied to Clipboard");
                        //    }
                            //LinkText(quote);
                           //Clipboard.setData(ClipboardData(text: Link( "${widget.video.copyUrl}")));
                            // Link(quote);
                        //    Clipboard.setData(ClipboardData(text: quote));
                           // Clipboard.setData(ClipboardData(text: samplelink));
                          },
                          icon: Icon(FontAwesomeIcons.copy,
                              color: const Color(0x8E6BED).withOpacity(0.9)),
                          label: Text(
                            "Copy Link",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Get.theme.primaryColor.withOpacity(.9),
                            ),
                          ),
                        ),
                      ),*/
                /*
                      const SizedBox(height: 2, width: 60),
                      if("${widget.video.sharestatus}" != 'PRIVATE')
                      Container(
                        //margin: EdgeInsets.only(left: 30, right: 2, top: 0.50),
                        alignment: Alignment.bottomRight,
                        child: Center(
                          child: TextButton.icon(
                            onPressed: () async {
                              final confirm = await showConfirmationDialog(
                                  title: "Delete Video", content: "Are you sure?");
                              if (!(confirm ?? false)) {
                                return;
                              }
                              widget.svc.getDelete("${widget.video.unid}");
                            },
                            icon: Icon(FontAwesomeIcons.trashAlt,
                                color: Get.theme.primaryColor.withOpacity(.9)),
                            label: Text(
                              "Delete Video",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Get.theme.primaryColor.withOpacity(.9),
                              ),
                            ),
                          ),
                        ),
                      )
                      else
                        Container(
                          margin: const EdgeInsets.only(left: 30, right: 2, top: 0.50),
                          alignment: Alignment.bottomRight,
                            child: TextButton.icon(
                              onPressed: () async {
                                final confirm = await showConfirmationDialog(
                                    title: "Delete Video", content: "Are you sure?");
                                if (!(confirm ?? false)) {
                                  return;
                                }
                                widget.svc.getDelete("${widget.video.unid}");
                              },
                              icon: Icon(FontAwesomeIcons.trashAlt,
                                  color: Get.theme.primaryColor.withOpacity(.9)),
                              label: Text(
                                "Delete Video",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Get.theme.primaryColor.withOpacity(.9),
                                ),
                              ),
                            ),
                        ),
                    ],
                  ),*/
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
