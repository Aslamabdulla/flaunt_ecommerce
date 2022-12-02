import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flaunt_ecommenrce/dependency/dependency.dart';
import 'package:flaunt_ecommenrce/view/common/snack_bar_widget.dart';
import 'package:flaunt_ecommenrce/view/common/widgets/login_button_widget.dart';
import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flaunt_ecommenrce/view/screens/home_bottom_navigation/home_navigation.dart';
import 'package:flaunt_ecommenrce/view/screens/login/widgets/register_now.dart';
import 'package:flaunt_ecommenrce/view/screens/login/widgets/text_form_widget.dart';
import 'package:flaunt_ecommenrce/view/screens/signup/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class OtpScreenWidget extends StatelessWidget {
  const OtpScreenWidget({
    Key? key,
    required this.length,
    required this.otpController,
    required this.focusNode,
    required this.defaultPinTheme,
    required this.borderColor,
    required this.errorColor,
    required this.auth,
  }) : super(key: key);

  final int length;
  final TextEditingController otpController;
  final FocusNode focusNode;
  final PinTheme defaultPinTheme;
  final Color borderColor;
  final Color errorColor;
  final FirebaseAuth auth;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            "assets/images/phone.gif",
            height: 280.h,
          ),
          Text("PLEASE VERIFY YOUR PHONE NUMBER"),
          kHeight10,
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 50).r,
            child: TextFormField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 5),
                  prefixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(30)),
                  filled: true,
                  fillColor: Colors.grey.withOpacity(.15),
                  hintText: "Phone Number",
                  hintStyle: TextStyle(fontSize: 12.sp, height: 0)),
              onChanged: (value) {
                loginController.phoneNumber.value = value;
                loginController.update();
              },
            ),
          ),
          kHeight20,
          LoginButtonWidget(
            name: "SEND CODE",
            height: 45.h,
            width: 150.w,
            fnctn: () {
              if (loginController.phoneNumber.value.isEmpty ||
                  loginController.phoneNumber.value.length < 10 ||
                  loginController.phoneNumber.value.length > 10) {
                snackBarShowError("Error", "Please input correct number");
              } else {
                loginController
                    .firebaseOtp("+91 ${loginController.phoneNumber.value}");
              }

              print(loginController.phoneNumber.value);
            },
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            "ENTER OTP",
            style: TextStyle(fontSize: 20.sp),
          ),
          SizedBox(
            height: 68.h,
            child: Pinput(
              length: length,
              controller: otpController,
              focusNode: focusNode,
              defaultPinTheme: defaultPinTheme,
              onCompleted: (pin) {
                loginController.otpNumber.value = pin;
              },
              focusedPinTheme: defaultPinTheme.copyWith(
                height: 68.h,
                width: 64.w,
                decoration: defaultPinTheme.decoration!.copyWith(
                  border: Border.all(color: borderColor),
                ),
              ),
              errorPinTheme: defaultPinTheme.copyWith(
                decoration: BoxDecoration(
                  color: errorColor,
                  borderRadius: BorderRadius.circular(8).w,
                ),
              ),
            ),
          ),
          kHeight10,
          LoginButtonWidget(
            name: "Verify",
            height: 45.h,
            width: 150.w,
            fnctn: () async {
              if (loginController.otpNumber.value.isNotEmpty) {
                PhoneAuthCredential credential = PhoneAuthProvider.credential(
                    verificationId: loginController.verificationNumId.value,
                    smsCode: loginController.otpNumber.value);
                await auth.signInWithCredential(credential).then((value) {
                  if (value.user == null) {
                    snackBarShowError('Error', "Error occured");
                    return;
                  } else if (value.user!.uid != null) {
                    snackBarShowSuccess("Success", "Verified Successfully");
                    Get.offAll(() => HomeNavigationPage());
                    loginController.saveUserOtp();
                  }
                });
              }
            },
          ),
          kHeight20,
          SignUpWidget(
              text1: "Login Using ", text2: "Email", fnctn: () => Get.back()),
        ],
      ),
    );
  }
}
