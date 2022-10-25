// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flaunt_ecommenrce/view/screens/home_bottom_navigation/home_navigation.dart';
import 'package:flaunt_ecommenrce/view/screens/signup/widgets/sign_up_methods.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flaunt_ecommenrce/view/screens/login/widgets/contents.dart';
import 'package:flaunt_ecommenrce/view/screens/login/widgets/custom_paint.dart';
import 'package:flaunt_ecommenrce/view/common/widgets/login_button_widget.dart';
import 'package:flaunt_ecommenrce/view/screens/login/widgets/login_buttons.dart';
import 'package:flaunt_ecommenrce/view/screens/login/widgets/register_now.dart';
import 'package:flaunt_ecommenrce/view/screens/login/widgets/text_form_widget.dart';
import 'package:flaunt_ecommenrce/view/screens/login/widgets/widgets.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            ClipPath(
              clipper: BackgroundClipper(),
              child: Container(
                height: height,
                width: width,
                decoration: customClipperBackground,
              ),
            ),
            SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  kHeight20,
                  Container(
                    padding: EdgeInsets.only(top: height * .12),
                    child: PhysicalModel(
                      elevation: 10,
                      borderRadius: BorderRadius.circular(width / 4),
                      color: Colors.transparent,
                      child: CircleAvatar(
                        radius: width / 4,
                        backgroundImage:
                            const AssetImage("assets/images/user.jpg"),
                      ),
                    ),
                  ),
                  kHeight10,
                  const Text(
                    "Sign up",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  kHeight10,
                  TextFormWidget(
                      prefixIcon: Icons.account_circle_outlined,
                      controller: emailController,
                      forgotBtn: false,
                      hint: "Username"),
                  TextFormWidget(
                    prefixIcon: Icons.email_outlined,
                    hint: "Enter your email",
                    controller: passwordController,
                    forgotBtn: false,
                  ),
                  TextFormWidget(
                      prefixIcon: Icons.password_outlined,
                      controller: emailController,
                      forgotBtn: false,
                      hint: "Enter your password"),
                  TextFormWidget(
                      prefixIcon: Icons.password_outlined,
                      controller: emailController,
                      forgotBtn: false,
                      hint: "Confirm your password"),
                  TextFormWidget(
                      prefixIcon: Icons.man_outlined,
                      controller: emailController,
                      forgotBtn: false,
                      hint: "Enter your gender"),
                  LoginButtonWidget(
                      height: height * .05,
                      width: width / 3,
                      name: "Sign up",
                      fnctn: () => Get.offAll(() => HomeNavigationPage())),
                  kHeight10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SignUpMethodWidget(
                          height: height,
                          width: width,
                          icon: FontAwesomeIcons.facebook,
                          color: Colors.blueAccent),
                      kWidth20,
                      SignUpMethodWidget(
                        height: height,
                        width: width,
                        icon: FontAwesomeIcons.google,
                        color: Colors.red,
                      ),
                      kWidth20,
                      SignUpMethodWidget(
                          color: Colors.black,
                          height: height,
                          width: width,
                          icon: FontAwesomeIcons.phone),
                      kWidth20,
                    ],
                  ),
                  kHeight5,
                  SignUpWidget(
                      text1: "Already have an account?",
                      text2: " Login Now",
                      fnctn: () => Get.to(() => HomeNavigationPage())),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
