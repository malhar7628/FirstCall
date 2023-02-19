import 'package:first_call_app/common/api_common.dart';
import 'package:first_call_app/screen/sign_in.screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/sign_up.controller.dart';
import '../data/videolist.data.dart';
import '../model/jobRole.data.dart';

class SignUpScreen extends StatelessWidget {
  static const name = "/sign_up";
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final VideoList list = VideoList();
    final size = MediaQuery.of(context).size;
    return GetX<SignUpController>(
      init: SignUpController(),
      builder: (_) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          body: Stack(
            children: [
              Container(
                height: size.height,
                width: size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      const Color(0x001e96ca).withOpacity(0.9),
                      const Color(0x00007238).withOpacity(0.9),
                    ],
                  ),
                ),
              ),
              ListView(
                children: [
                  Center(
                    child: Container(
                      // width: size.width * 80 / 100,
                      // margin: EdgeInsets.only(
                      //   top: size.height * 20 / 100,
                      // ),
                      // alignment: Alignment.center,
                      padding: const EdgeInsets.fromLTRB(24, 24, 24, 6),
                      // decoration: BoxDecoration(
                      //     color: Colors.white.withOpacity(.9),
                      //     borderRadius: BorderRadius.circular(12)),
                      child: Align(
                        alignment: Alignment.center,
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          // mainAxisAlignment: MainAxisAlignment.center,
                          // mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              height: Get.height * 15 / 100,
                              alignment: Alignment.center,
                              //   padding: const EdgeInsets.all(12),
                              child: Text("Sign Up",
                                  style: GoogleFonts.lato(
                                    fontSize: 32,
                                    color: Colors.white,
                                  )
                                  /*GoogleTextStyle(
                                  fontSize: 32,
                                  color: Colors.white.withOpacity(.9),
                                ),*/
                                  ),
                            ),
                            const SizedBox(height: 15),
                            Form(
                              key: _.formKey,
                              autovalidateMode: _.autovalidateMode,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextFormField(
                                    textInputAction: TextInputAction.next,
                                    decoration: InputDecoration(
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: const Color(0x3DC1E0)
                                                .withOpacity(0.9),
                                          ), //<-- SEE HERE
                                        ),
                                        hintText: 'First Name',
                                        hintStyle: GoogleFonts.lato(
                                          color: const Color(0x8DDEF1)
                                              .withOpacity(.9),
                                        )),
                                    validator: (value) {
                                      if (value!.trim().isEmpty) {
                                        return "Username is required";
                                      }
                                      return null;
                                    },
                                    onSaved: (value) {
                                      _.signUpData.userfname = value!.trim();
                                    },
                                  ),
                                  const SizedBox(height: 20),
                                  TextFormField(
                                    textInputAction: TextInputAction.next,
                                    decoration: InputDecoration(
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: const Color(0x3DC1E0)
                                                    .withOpacity(0.9))),
                                        hintText: 'Last Name',
                                        hintStyle: GoogleFonts.lato(
                                          color: const Color(0x8DDEF1)
                                              .withOpacity(.9),
                                        )),
                                    validator: (value) {
                                      if (value!.trim().isEmpty) {
                                        return "Username is required";
                                      }
                                      return null;
                                    },
                                    onSaved: (value) {
                                      _.signUpData.userlname = value!.trim();
                                    },
                                  ),
                                  const SizedBox(height: 20),
                                  TextFormField(
                                    textInputAction: TextInputAction.next,
                                    decoration: InputDecoration(
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x3DC1E0)
                                                .withOpacity(0.9),
                                          ), //<-- SEE HERE
                                        ),
                                        hintText: 'Email ID',
                                        hintStyle: GoogleFonts.lato(
                                          color: const Color(0x8DDEF1)
                                              .withOpacity(.9),
                                        )),
                                    validator: (value) {
                                      if (value!.trim().isEmpty) {
                                        return "Email is required";
                                      } else if (!value.trim().isEmail) {
                                        return "Enter a valid Email";
                                      }
                                      return null;
                                    },
                                    onSaved: (value) {
                                      _.signUpData.email = value!.trim();
                                    },
                                  ),
                                  const SizedBox(height: 20),
                                  TextFormField(
                                    textInputAction: TextInputAction.next,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x3DC1E0)
                                                .withOpacity(0.9),
                                          ), //<-- SEE HERE
                                        ),
                                        hintText: 'Password',
                                        hintStyle: GoogleFonts.lato(
                                          color: const Color(0x8DDEF1)
                                              .withOpacity(.9),
                                        )),
                                    validator: (value) {
                                      if (value!.trim().isEmpty) {
                                        return "Password is required";
                                      }
                                      return null;
                                    },
                                    onSaved: (value) {
                                      _.signUpData.password = value!.trim();
                                    },
                                  ),
                                  const SizedBox(height: 20),
                                  TextFormField(
                                    textInputAction: TextInputAction.done,
                                    decoration: InputDecoration(
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: const Color(0x3DC1E0)
                                                .withOpacity(0.9),
                                          ), //<-- SEE HERE
                                        ),
                                        hintText: 'Mobile Number',
                                        hintStyle: GoogleFonts.lato(
                                          color: const Color(0x8DDEF1)
                                              .withOpacity(.9),
                                        )),
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      LengthLimitingTextInputFormatter(10),
                                    ],
                                    validator: (value) {
                                      if (value!.trim().isEmpty) {
                                        return "Phone is required";
                                      } else if (value.trim().length != 10) {
                                        return "Enter a valid phone number";
                                      }
                                      return null;
                                    },
                                    onSaved: (value) {
                                      _.signUpData.mobilenumber = value!.trim();
                                    },
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 40,
                                        child: Checkbox(
                                          side: MaterialStateBorderSide
                                              .resolveWith(
                                            (Set<MaterialState> states) {
                                              if (states.contains(
                                                  MaterialState.selected)) {
                                                return const BorderSide(
                                                    color: Colors.white);
                                              }
                                              return const BorderSide(
                                                  color: Colors.white);
                                            },
                                          ),
                                          activeColor: const Color(0x8DDEF1)
                                              .withOpacity(.9),
                                          value: _.termsAccept,
                                          onChanged: (value) {
                                            _.termsAccept = value;
                                          },
                                        ),
                                      ),
                                      Expanded(
                                        child: RichText(
                                          text: TextSpan(
                                            text: "I agree to the ",
                                            style: GoogleFonts.lato(
                                              color: const Color(0x8DDEF1)
                                                  .withOpacity(.9),
                                            ),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                _.termsAccept = !_.termsAccept;
                                              },
                                            children: [
                                              TextSpan(
                                                text: "Terms & Conditions.",
                                                style: const TextStyle(
                                                  color: Colors.blueAccent,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                recognizer:
                                                    TapGestureRecognizer()
                                                      ..onTap = () {
                                                        FlutterWebBrowser
                                                            .openWebPage(
                                                                url:
                                                                    termsAndConditionsUrl);
                                                      },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 15),
                                  // Container(
                                  //   alignment: Alignment.centerLeft,
                                  //   child: SizedBox(
                                  //     width: 100,
                                  //     height: 40,
                                  //     child: ElevatedButton(
                                  //         style: ElevatedButton.styleFrom(
                                  //             shape: RoundedRectangleBorder( //to set border radius to button
                                  //             borderRadius: BorderRadius.circular(30)
                                  //         ),
                                  //           backgroundColor: Colors.white.withOpacity(.9)
                                  //         ),
                                  //         onPressed: () {
                                  //           FocusScope.of(context).unfocus();
                                  //           // Get.offAllNamed(DashboardScreen.name);
                                  //           _.signUp();
                                  //         },
                                  //         child:  Text("Register",style: TextStyle(
                                  //           color: Get.theme.primaryColor.withOpacity(.9),
                                  //         ),)),
                                  //   ),
                                  // ),
                                  // Row(
                                  //   mainAxisAlignment: MainAxisAlignment.center,
                                  //   children: [
                                  //     const Flexible(
                                  //         child:
                                  //         Text("Already Have an account?")),
                                  //     TextButton(
                                  //       onPressed: () {
                                  //         Get.offNamed(SignInScreen.name);
                                  //       },
                                  //       child:  Text("Sign In",style: TextStyle(
                                  //         color: Colors.white.withOpacity(.9)
                                  //       ),),
                                  //     )
                                  //   ],
                                  // ),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30)),
                                                backgroundColor: Colors.white
                                                    .withOpacity(.9)),
                                            onPressed: () {
                                              FocusScope.of(context).unfocus();
                                              // Get.offAllNamed(DashboardScreen.name);
                                              _.signUp();
                                            },
                                            child: Text(
                                              "Register",
                                              style: GoogleFonts.lato(
                                                  color:
                                                      Get.theme.primaryColor),
                                            )),
                                        const SizedBox(height: 12),
                                        TextButton(
                                          onPressed: () {
                                            Get.offNamed(SignInScreen.name);
                                          },
                                          child: Text(
                                            "Sign In",
                                            style: GoogleFonts.lato(
                                                color: Colors.white),
                                          ),
                                        )
                                      ]),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
