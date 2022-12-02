import 'package:firebase_auth/firebase_auth.dart';
import 'package:flaunt_ecommenrce/dependency/dependency.dart';
import 'package:flaunt_ecommenrce/services/firebase_services.dart';
import 'package:flaunt_ecommenrce/view/common/widgets/login_button_widget.dart';
import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flaunt_ecommenrce/view/screens/home_bottom_navigation/home_navigation.dart';
import 'package:flaunt_ecommenrce/view/screens/login/widgets/otp_screen_widget.dart';
import 'package:flaunt_ecommenrce/view/screens/login/widgets/text_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:pinput/pinput.dart';

class FilledRoundedPinPut extends StatelessWidget {
  FilledRoundedPinPut({Key? key}) : super(key: key);
  FirebaseAuth auth = FirebaseAuth.instance;
  final otpController = TextEditingController();
  final focusNode = FocusNode();

  // @override
  // void dispose() {

  //   super.dispose();
  // }

  bool showError = false;

  @override
  Widget build(BuildContext context) {
    const length = 6;
    const borderColor = Color.fromRGBO(114, 178, 238, 1);
    const errorColor = Color.fromRGBO(255, 234, 238, 1);
    const fillColor = Color.fromRGBO(222, 231, 240, .57);
    final defaultPinTheme = PinTheme(
      width: 40.w,
      height: 40.h,
      textStyle: TextStyle(color: const Color.fromRGBO(30, 60, 87, 1)),
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.transparent),
      ),
    );

    return Scaffold(
      backgroundColor: kWhite,
      body: SafeArea(
        child: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text("Error Occured"),
                );
              } else if (snapshot.data == null || snapshot.data!.uid == null) {
                return OtpScreenWidget(
                    length: length,
                    otpController: otpController,
                    focusNode: focusNode,
                    defaultPinTheme: defaultPinTheme,
                    borderColor: borderColor,
                    errorColor: errorColor,
                    auth: auth);
              } else if (snapshot.data != null || snapshot.data!.uid != null) {
                return HomeNavigationPage();
              } else {
                return OtpScreenWidget(
                    length: length,
                    otpController: otpController,
                    focusNode: focusNode,
                    defaultPinTheme: defaultPinTheme,
                    borderColor: borderColor,
                    errorColor: errorColor,
                    auth: auth);
              }
            }),
      ),
    );
  }
}
