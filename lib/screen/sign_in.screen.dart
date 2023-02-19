import 'package:first_call_app/screen/sign_up.screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/sign_in.controller.dart';

class SignInScreen extends StatelessWidget {
  static const name = "/sign_in";
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GetX<SignInController>(
      init: SignInController(),
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
                              child: Text(
                                "Sign In",
                                style: TextStyle(
                                    fontSize: 32,
                                    color: Colors.white.withOpacity(.9)),
                              ),
                            ),
                            const SizedBox(height: 35),
                            Form(
                              key: _.formKey,
                              autovalidateMode: _.autovalidateMode,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextFormField(
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: const Color(0x3DC1E0)
                                                .withOpacity(0.9),
                                          ), //<-- SEE HERE
                                        ),
                                        hintText: 'Email ID',
                                        hintStyle: GoogleFonts.lato(
                                          color: const Color(0x8DDEF1)
                                              .withOpacity(0.9),
                                        )),
                                    validator: (value) {
                                      if (value!.trim().isEmpty) {
                                        return "Email ID is required";
                                      }
                                      // else if (value.trim().length != 10) {
                                      //   return "Enter valid phone number";
                                      // }
                                      return null;
                                    },
                                    onSaved: (value) {
                                      _.signInData.username = value!.trim();
                                    },
                                  ),
                                  TextFormField(
                                    textInputAction: TextInputAction.done,
                                    decoration: InputDecoration(
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: const Color(0x3DC1E0)
                                                .withOpacity(0.9),
                                          ), //<-- SEE HERE
                                        ),
                                        hintText: 'Password',
                                        hintStyle: GoogleFonts.lato(
                                          color: const Color(0x8DDEF1)
                                              .withOpacity(0.9),
                                        )),
                                    obscureText: true,
                                    validator: (value) {
                                      if (value!.trim().isEmpty) {
                                        return "Password is required";
                                      }
                                      return null;
                                    },
                                    onSaved: (value) {
                                      _.signInData.password = value!.trim();
                                    },
                                  ),
                                  const SizedBox(height: 24),
                                  // SizedBox(
                                  //   width: 100,
                                  //   height: 40,
                                  //   child: ElevatedButton(
                                  //       style: ElevatedButton.styleFrom(
                                  //           shape: RoundedRectangleBorder(
                                  //               borderRadius: BorderRadius.circular(30)
                                  //           ),
                                  //           backgroundColor: Colors.white.withOpacity(.9)
                                  //       ),
                                  //       onPressed: () {
                                  //         FocusScope.of(context).unfocus();
                                  //         _.signIn();
                                  //       },
                                  //       child:  Text("SignIn",style: TextStyle(
                                  //         color: Get.theme.primaryColor.withOpacity(.7),
                                  //       ),)),
                                  // ),
                                  // Row(
                                  //   mainAxisAlignment: MainAxisAlignment.center,
                                  //   children: [
                                  //     TextButton(
                                  //       onPressed: () {
                                  //         Get.offNamed(SignUpScreen.name);
                                  //       },
                                  //       child:  Text("Sign Up",style: TextStyle(
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
                                              _.signIn();
                                            },
                                            child: Text(
                                              "Submit",
                                              style: GoogleFonts.lato(
                                                  color:
                                                      Get.theme.primaryColor),
                                            )),
                                        const SizedBox(height: 12),
                                        TextButton(
                                          onPressed: () {
                                            Get.offNamed(SignUpScreen.name);
                                          },
                                          child: Text(
                                            "Sign Up",
                                            style: GoogleFonts.lato(
                                                color: Colors.white),
                                          ),
                                        )
                                      ]),
                                  /*Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Flexible(
                                          child: Text("Forget Password?")),
                                      TextButton(
                                        onPressed: () {
                                          */ /* Get.offNamed(ForgotPassword.name);*/ /*
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                const ForgotPassword()),
                                          );
                                        },
                                        child: const Text("ForgotPassword"),
                                      )
                                    ],
                                  ),*/
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
