
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../controller/dashboard.controller.dart';


class DashboardScreenPostShowCase extends StatelessWidget {
  static const name = "/dashboard";
  const DashboardScreenPostShowCase({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetX<DashboardController>(
        init: DashboardController(),
        builder:(_){
          return Scaffold(
            // appBar: AppBar(
            //   backgroundColor:Get.theme.primaryColor.withOpacity(.9),
            //   title: const Text("First Call"),centerTitle:true,),
            bottomNavigationBar: Stack(
              children:[
                // Container(
                //   decoration:  BoxDecoration(
                //     gradient: LinearGradient(
                //       begin: Alignment.topCenter,
                //       end: Alignment.bottomCenter,
                //       colors: [
                //         const Color(0x001e96ca).withOpacity(0.9),
                //         const Color(0x00007238).withOpacity(0.9),
                //       ],
                //     ),
                //   ),
                // ),
                BottomNavigationBar(
                  currentIndex: _.currentIndex,
                  type: BottomNavigationBarType.fixed,
                  items:    [
                    BottomNavigationBarItem(
                      icon: const Icon(FontAwesomeIcons.clipboardList).marginOnly(top: 1, left: 5, right: 1,bottom: 5),
                      label: "Application List",
                    ),
                    BottomNavigationBarItem(
                      icon: const Icon(FontAwesomeIcons.userAlt).marginOnly(top: 1, left: 5, right: 1,bottom: 5),
                      label: "Account",
                    ),
                    /* BottomNavigationBarItem(
                      icon: Icon(FontAwesomeIcons.video),
                      label: "Add Video",
                    ),*/
                  ],
                  onTap: (index) {
                    _.currentIndex = index;
                  },
                )],
            ),
            body: _.children2[_.currentIndex],
          );
        }
    );
    /*  return GetX<DashboardController>(
      init: DashboardController(),
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Dashboard"),
            centerTitle:true,
            elevation: 1,
          ),
          bottomNavigationBar: BottomNavigationBar(
            elevation: 1,
            currentIndex: _.currentIndex,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.video),
                label: "Video",
              ),
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.solidQuestionCircle),
                label: "FAQ",
              ),

              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.addressCard),
                label: "Contact Us",
              ),

            ],
            onTap: (index) {
              _.currentIndex = index;
            },
          ),
          body: _.children[_.currentIndex],
        );
      },
    );*/
  }
}
