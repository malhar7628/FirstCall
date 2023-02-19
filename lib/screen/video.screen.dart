import 'package:first_call_app/widget/audition_id_dialog_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:showcaseview/showcaseview.dart';
import '../controller/showvideo.controller.dart';
import '../widget/show.video.widget.dart';

class VideoScreen extends StatefulWidget {
  static const name = "/video";
  const VideoScreen({Key? key}) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  final ShowVideoController showVideo = ShowVideoController();

  int currentIndex = 0;

  OverlayEntry? _overlayEntry;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey _firstKey = GlobalKey();

  void showCaseDisplay(BuildContext buildContext) async {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 400), () {
        ShowCaseWidget.of(buildContext).startShowCase([_firstKey]);
      });
    });
  }

  void hideOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  void initState() {
    if (kDebugMode) {
      print("Init State");
    }
    super.initState();
  }

  @override
  void dispose() {
    if (kDebugMode) {
      print("Disposing");
    }
    showVideo.dispose();
    if (kDebugMode) {
      print("Disposed Successfully");
    }
    super.dispose();
  }

  _storeOnBoardInfo() async {
    int isViewed = 0;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setInt('showCaseDisplay', isViewed);
  }

  @override
  Widget build(BuildContext context) {
    return GetX<ShowVideoController>(
        init: ShowVideoController(),
        initState: (_) {
          if (_.controller?.initialized ?? false) {
            try {
              if (_.controller!.video.isEmpty) {
                _storeOnBoardInfo();
                showCaseDisplay(context);
              } else {
                if (kDebugMode) {
                  print("Video not null");
                }
              }
            } catch (e) {
              //showLoadingDialog();
            }
          }
        },
        builder: (_) {
          return Scaffold(
            key: _scaffoldKey,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(
                        parent: NeverScrollableScrollPhysics()),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                const Color(0x001e96ca).withOpacity(0.9),
                                const Color(0x001e96ca).withOpacity(0.9),
                              ],
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Application List",
                                textAlign: TextAlign.start,
                                style: GoogleFonts.lato(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    color: Colors.white.withOpacity(.9)),
                              ).marginOnly(top: 25, left: 2, right: 150),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Below are the list of Applications",
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.lato(
                                        fontSize: 15,
                                        color: Colors.white.withOpacity(.9)),
                                  ).marginOnly(top: 5, left: 2, right: 100),
                                  Container(
                                    height: Get.height * 248 / 300,
                                    margin:
                                        const EdgeInsets.fromLTRB(2, 10, 2, 2),
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: Get.theme.cardColor
                                            .withOpacity(0.9),
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  Colors.black.withAlpha(100),
                                              blurRadius: 8.0)
                                        ],
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20))),
                                    child: Column(
                                      children: [
                                        if (_.loading)
                                          const Expanded(
                                              child: Center(
                                            child: CircularProgressIndicator(),
                                          ))
                                        else if (!_.loading && _.video.isEmpty)
                                          /* Expanded(child: Center(
                                          child: CircularProgressIndicator(),
                                          ))
                                        else if (_.video.isEmpty)*/
                                          Expanded(
                                            child: Container(
                                              height: Get.height * 30 / 100,
                                              alignment: Alignment.center,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  const Text("No Video found"),
                                                  TextButton(
                                                    onPressed: () {
                                                      _.getVideo();
                                                    },
                                                    child: Text(
                                                      "Try again",
                                                      style: TextStyle(
                                                          color: Get.theme
                                                              .primaryColor
                                                              .withOpacity(.9)),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          )
                                        else
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      5, 1, 5, 1),
                                              child: ListView.builder(
                                                itemCount: _.video.length,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  final transaction =
                                                      _.video[index];
                                                  return ShowVideoTile(
                                                      video: transaction,
                                                      svc: _);
                                                },
                                              ),
                                            ),
                                          ),

                                        //    Container(
                                        //      alignment: Alignment.bottomRight,
                                        //      child: FloatingActionButton.extended(
                                        //       onPressed: () {
                                        //           Get.dialog(const AuditionIDDialogWidget());
                                        //       },
                                        //       label: const Text('Record Video'),
                                        //     //  icon: const Icon(Icons.video_call),
                                        //       backgroundColor: const Color(0x1e9cca).withOpacity(0.9),
                                        // ),
                                        //    ),
                                        Builder(builder: (context) {
                                          return Container(
                                            decoration: BoxDecoration(
                                              /* boxShadow: [
                                                    */ /*BoxShadow(
                                                      color: Colors.black.withOpacity(0.2),
                                                      blurRadius: 6,
                                                    ),//
                                                  ],*/
                                              borderRadius:
                                                  BorderRadius.circular(90),
                                              gradient: LinearGradient(colors: [
                                                const Color(0x001e96ca)
                                                    .withOpacity(0.9),
                                                const Color(0x00007238)
                                                    .withOpacity(0.9),
                                              ]),
                                            ),
                                            child: Showcase(
                                              key: _firstKey,
                                              description:
                                                  'Click here to add your screening video.',
                                              tooltipBackgroundColor:
                                                  const Color(0x001e96ca)
                                                      .withOpacity(0.9),
                                              descTextStyle: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16.0,
                                              ),
                                              disposeOnTap: true,
                                              onTargetClick: () {
                                                Get.dialog(
                                                    const AuditionIDDialogWidget());
                                              },
                                              child:
                                                  FloatingActionButton.extended(
                                                isExtended: true,
                                                elevation: 0,
                                                onPressed: () {
                                                  _scaffoldKey.currentState!
                                                      .openDrawer();
                                                  _storeOnBoardInfo();
                                                  Get.dialog(
                                                      const AuditionIDDialogWidget());
                                                },
                                                label: Text(
                                                  'Record Video',
                                                  style: GoogleFonts.lato(
                                                      color: Colors.white
                                                          .withOpacity(.9)),
                                                ),
                                                icon: Icon(
                                                  Icons.video_call,
                                                  color: Colors.white
                                                      .withOpacity(.9),
                                                ),
                                                backgroundColor:
                                                    Colors.transparent,
                                              ),
                                            ),
                                          ).marginOnly(
                                              top: 10, left: 220, right: 1);
                                        }),
                                        //    const SizedBox(height: 60,)
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
