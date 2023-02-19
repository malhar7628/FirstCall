import 'package:first_call_app/controller/camera.controller.dart';
import 'package:first_call_app/controller/edit_controller.dart';
import 'package:first_call_app/controller/edit_user_profile_controller.dart';
import 'package:first_call_app/controller/image_upload_controller.dart';
import 'package:first_call_app/data/user_info_model_data.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountScreen extends StatelessWidget {
  static const name = "/account";
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserInfoDataModel userInfoDataModel = UserInfoDataModel();
    CameraController _cameraController = CameraController();
    ImageUploadController image = ImageUploadController();
    EditUserProfileController _editProfileController =
        EditUserProfileController();
    EditController edit = EditController();
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(
                  parent: NeverScrollableScrollPhysics()),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Account",
                            textAlign: TextAlign.start,
                            style: GoogleFonts.lato(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Colors.white.withOpacity(.9)),
                          ).marginOnly(top: 55, left: 2, right: 50),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: Get.height * 170 / 200,
                              margin: const EdgeInsets.fromLTRB(2, 20, 2, 2),
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Get.theme.cardColor.withOpacity(0.9),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withAlpha(100),
                                        blurRadius: 8.0)
                                  ],
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20))),
                              child: Column(
                                children: [
                                  ListTile(
                                    leading: const Icon(FontAwesomeIcons.edit),
                                    iconColor: Get.theme.primaryColor,
                                    title: Text("Edit Profile",
                                        style: GoogleFonts.lato(
                                          color: const Color(0x005c7d8a)
                                              .withOpacity(.9),
                                        )),
                                    onTap: () {
                                      image
                                          .getUserInfoDetailsForEditProfileByUserID();
                                    },
                                  ),
                                  const SizedBox(height: 10),
                                  ListTile(
                                    leading:
                                        const Icon(FontAwesomeIcons.signOutAlt),
                                    iconColor: Get.theme.primaryColor,
                                    title: Text("Sign Out",
                                        style: GoogleFonts.lato(
                                          color: const Color(0x5C7D8A)
                                              .withOpacity(.9),
                                        )),
                                    onTap: () {
                                      _cameraController.signOut();
                                    },
                                  ),
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
  }
}
