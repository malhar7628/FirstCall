import 'package:first_call_app/controller/showvideo.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/transaction.model.dart';

class AuditionIDDialogWidget extends StatelessWidget {
// final ShowVideoModel video;
// final UserAuditionVideoListData userAuditionVideo;
  const AuditionIDDialogWidget({Key? key /*, required this.userAuditionVideo*/})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ShowVideoController showVideoController = ShowVideoController();

    final _formKey = GlobalKey<FormState>();
    String auditionID = "";
    // String? cid = "";
    // cid=svc.category?.id;
    return Dialog(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Search using PreScreen ID",
                style: GoogleFonts.lato(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Get.theme.primaryColor)),
            const SizedBox(height: 12),
            TextFormField(
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Screen ID",
                labelText: "Enter PreScreen ID From Job Posts",
              ),
              onChanged: (value) {
                /*  onSaved: (value) {*/
                auditionID = value.trim();
                print("auditionIDvalue:-$auditionID");
              },
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text(
                      "CLOSE",
                      style: TextStyle(color: Colors.black),
                    )),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(0.0),
                    elevation: 5,
                  ),
                  onPressed: () {
                    print("auditionIDvalue23:-$auditionID");
                    print("check click:-");
                    showVideoController.verifyAuditonIDAndDeadline(
                        auditionID /*, "${userAuditionVideo?.auditionInfo?.auditionid}"*/);
                  },
                  child: Ink(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        const Color(0x001e96ca).withOpacity(0.9),
                        const Color(0x00007238).withOpacity(0.9),
                      ]),
                      //   borderRadius: BorderRadius.circular(90),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      constraints: const BoxConstraints(minWidth: 88.0),
                      child: const Text('OK', textAlign: TextAlign.center),
                    ),
                  ),
                ),
                // ElevatedButton(
                //     onPressed: () {
                //       print("auditionIDvalue23:-$auditionID");
                //       print("check click:-");
                //       showVideoController.verifyAuditonIDAndDeadline(auditionID/*, "${userAuditionVideo?.auditionInfo?.auditionid}"*/);
                //     },
                //     child: const Text("NEXT",style: TextStyle(color: Colors.black),)),
              ],
            ),
          ],
        ).paddingAll(12),
      ),
    );
  }
}
