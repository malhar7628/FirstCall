import 'package:first_call_app/controller/video_list_controller.dart';
import 'package:first_call_app/service/dashboard.service.dart';
import 'package:first_call_app/widget/audition_id_dialog_widget.dart';
import 'package:first_call_app/widget/video_applied_date_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';

class VideoScreenPostShowCase extends StatelessWidget {
  static const name = "/video";
  const VideoScreenPostShowCase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DashBoardService dashBoardService = Get.find();

    final formatter = DateFormat('yyyy-MM-dd');

    var currentDate = DateTime.now();
    if (kDebugMode) {
      print("Current Date$currentDate");
    }

    String formattedCurrentDate = formatter.format(currentDate);
    if (kDebugMode) {
      print("Current Date formatedd $formattedCurrentDate");
    }

    var subtractDate = currentDate.subtract(const Duration(days: 1));
    if (kDebugMode) {
      print("Subtracted Current Date :-- $subtractDate");
    }

    var formattedSubtractDate = formatter.format(subtractDate);
    if (kDebugMode) {
      print("Formatted Subtracted Date :-- $formattedSubtractDate");
    }
    return GetX<VideoListController>(
        init: VideoListController(),
        builder: (_) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
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
                              const SizedBox(
                                height: 17,
                              ),
                              Text(
                                "Application List",
                                textAlign: TextAlign.start,
                                style: GoogleFonts.lato(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    color: Colors.white.withOpacity(.9)),
                              ).marginOnly(top: 25, left: 2, right: 30),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Below are the list of applications",
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.lato(
                                        fontSize: 15,
                                        color: Colors.white.withOpacity(.9)),
                                  ).marginOnly(top: 5, left: 2, right: 30),
                                  Container(
                                    height: Get.height * 170 / 200,
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
                                          const Expanded(
                                              child: Center(
                                            child: CircularProgressIndicator(),
                                          ))
                                        else if (_.video.isEmpty)
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
                                                    onPressed: _.getVideo,
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
                                              child: /*Padding(
                                                padding: const EdgeInsets.fromLTRB(5, 1, 5, 1),
                                                child:*/
                                                  GroupedListView<dynamic,
                                                      String>(
                                            useStickyGroupSeparators: true,
                                            elements: dashBoardService.elements,
                                            groupBy: (element) =>
                                                element['applicationdate'],
                                            groupSeparatorBuilder: (value) =>
                                                Container(
                                              alignment: Alignment.topCenter,
                                              height: Get.height * 5 / 150,
                                              //  width: Get.width * 50/150,
                                              margin: const EdgeInsets.fromLTRB(
                                                  100, 5, 120, 12),
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      7, 1, 5, 1),
                                              decoration: BoxDecoration(
                                                  color: const Color(0x00d3e0e4)
                                                      .withOpacity(.9),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.black
                                                            .withAlpha(100),
                                                        blurRadius: 3.0)
                                                  ],
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  20),
                                                          topRight:
                                                              Radius.circular(
                                                                  20),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  20),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  20))),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    alignment: Alignment.center,
                                                    padding: const EdgeInsets
                                                        .fromLTRB(45, 1, 1, 1),
                                                    //    height: Get.height * 23 / 105,
                                                    //   margin: EdgeInsets.all(1),
                                                    child: Stack(
                                                      children: [
                                                        Positioned(
                                                            child: Text(
                                                                value ==
                                                                        formattedCurrentDate
                                                                    ? "Today"
                                                                    : value ==
                                                                            formattedSubtractDate
                                                                        ? "Yesterday"
                                                                        : DateFormat('dd-MMM-yyyy').format(DateTime.parse(
                                                                            value)),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style:
                                                                    GoogleFonts
                                                                        .lato(
                                                                  color: const Color(
                                                                          0x005c7d8a)
                                                                      .withOpacity(
                                                                          .9),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                )))
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            indexedItemBuilder:
                                                (BuildContext context, element,
                                                    int index) {
                                              final transaction =
                                                  _.video[index];
                                              return VideoAppliedDateTile(
                                                  video: transaction, svc: _);
                                            },
                                            order: GroupedListOrder.DESC,
                                          )
                                              /* ),*/
                                              ),
                                        /*                                        else
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.fromLTRB(5, 1, 5, 1),
                                              child: ListView.builder(
                                                itemCount: _.video.length,
                                                itemBuilder: (BuildContext context, int index) {
                                                  final transaction = _.video[index];
                                                  return VideoAppliedDateTile(video: transaction, svc: _);
                                                },
                                              ),
                                            ),
                                          ),*/
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
                                        /*Indexed(
                                          index: 1, //less the value, below the order
                                          child: Positioned(
                                            top: 100, left: 100,
                                            child: Container(
                                              height: 100, width: 100,
                                    //          color: Colors.blueAccent,
                                             */ /* decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black.withOpacity(0.2),
                                                    blurRadius: 6,
                                                  ),//
                                                ],
                                                borderRadius: BorderRadius.circular(120),
                                                gradient: LinearGradient(colors:
                                                [
                                                  const Color(0x001e96ca).withOpacity(0.9),
                                                  const Color(0x00007238).withOpacity(0.9),
                                                ]),
                                              ),*/
                                        /*
                                              child: FloatingActionButton.extended(
                                                isExtended: true,
                                                elevation: 0,
                                                onPressed: () {
                                                  Get.dialog(const AuditionIDDialogWidget());
                                                },
                                                label:  Text('Record Video', style: GoogleFonts.lato(
                                                    color: Colors.white.withOpacity(.9)
                                                ),),
                                                icon:  Icon(Icons.video_call,color: Colors.white.withOpacity(.9),),
                                                backgroundColor: Colors.transparent,
                                              ),
                                            ).marginOnly(top: 1, left: 220, right: 1),
                                          ),
                                        ),*/
                                        /*   new Container(
                                          color: new Color(0xFF736AB7),
                                          child: new CustomScrollView(
                                            scrollDirection: Axis.vertical,
                                           */ /* slivers: <Widget>[
                                              new SliverPadding(
                                                padding: const EdgeInsets.symmetric(vertical: 24.0),
                                                sliver: new SliverFixedExtentList(
                                                  itemExtent: 152.0,
                                                  delegate: new SliverChildBuilderDelegate(
                                                        (context, index) => Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: new Container(
                                                        color: Colors.red,
                                                        child: Center(
                                                          child: Text('$index'),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],*/
                                        /*
                                          ),
                                        ),*/
                                        /* Positioned(

                                          child: Align(
                                            alignment: Alignment.bottomRight,
                                            child: FloatingActionButton.extended(
                                              isExtended: true,
                                              elevation: 0,
                                              onPressed: () {
                                                Get.dialog(const AuditionIDDialogWidget());
                                              },
                                              label:  Text('Record Video', style: GoogleFonts.lato(
                                                  color: Colors.white.withOpacity(.9)
                                              ),),
                                              icon:  Icon(Icons.video_call,color: Colors.white.withOpacity(.9),),
                                              backgroundColor: Colors.transparent,
                                            ),
                                          ),
                                        ),*/
                                        Container(
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.2),
                                                blurRadius: 6,
                                              ), //
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(120),
                                            gradient: LinearGradient(colors: [
                                              const Color(0x001e96ca)
                                                  .withOpacity(0.9),
                                              const Color(0x00007238)
                                                  .withOpacity(0.9),
                                            ]),
                                          ),
                                          child: FloatingActionButton.extended(
                                            isExtended: true,
                                            elevation: 0,
                                            onPressed: () {
                                              Get.dialog(
                                                  const AuditionIDDialogWidget());
                                            },
                                            label: Text(
                                              'Apply',
                                              style: GoogleFonts.lato(
                                                  color: Colors.white
                                                      .withOpacity(.9)),
                                            ),
                                            icon: Icon(
                                              Icons.video_call,
                                              color:
                                                  Colors.white.withOpacity(.9),
                                            ),
                                            backgroundColor: Colors.transparent,
                                          ),
                                        ).marginOnly(
                                            top: 1, left: 220, right: 1),
                                        const SizedBox(
                                          height: 80,
                                        )
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
