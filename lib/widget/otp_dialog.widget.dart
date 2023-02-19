import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class OtpDialog extends StatelessWidget {
  final Function(String) onOtpVerification;
  const OtpDialog({Key? key, required this.onOtpVerification})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    String otp = "";
    return Dialog(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "OTP",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 12),
            TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(6)
              ],
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "OTP ",
                labelText: "OTP will be sent to the email address ",
              ),
              validator: (value) {
                if (value!.length != 6) {
                  return "Enter valid OTP";
                }
                return null;
              },
              onSaved: (value) {
                otp = value!;
                print("check otp Text-flied:-$otp");
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
                    child: const Text("Close",style: TextStyle(
                      color: Colors.black
                    ),)),
                ElevatedButton(
                  style: const ButtonStyle(
                      //backgroundColor:Get.theme.primaryColor.withOpacity(.9)
                  ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        onOtpVerification(otp);
                      }
                    },
                    child: const Text("Confirm",style: TextStyle(
                        color: Colors.black
                    ),)),
              ],
            ),
          ],
        ).paddingAll(12),
      ),
    );
  }
}
