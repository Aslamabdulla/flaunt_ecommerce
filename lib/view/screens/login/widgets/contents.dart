import 'package:firebase_auth/firebase_auth.dart';
import 'package:flaunt_ecommenrce/dependency/dependency.dart';
import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flaunt_ecommenrce/view/common/widgets/login_button_widget.dart';
import 'package:flaunt_ecommenrce/view/screens/home_bottom_navigation/home_navigation.dart';
import 'package:flaunt_ecommenrce/view/screens/home_screen/home_screen.dart';
import 'package:flaunt_ecommenrce/view/screens/login/login.dart';
import 'package:flaunt_ecommenrce/view/screens/login/widgets/login_buttons.dart';
import 'package:flaunt_ecommenrce/view/screens/login/widgets/otp.dart';
import 'package:flaunt_ecommenrce/view/screens/login/widgets/register_now.dart';
import 'package:flaunt_ecommenrce/view/screens/login/widgets/text_form_widget.dart';
import 'package:flaunt_ecommenrce/view/screens/signup/signup.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ColumnWidget extends StatelessWidget {
  const ColumnWidget({
    Key? key,
    required this.height,
    required this.width,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);

  final double height;
  final double width;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        kHeight35,
        Container(
          padding: EdgeInsets.only(top: height / 8),
          child: PhysicalModel(
            elevation: 10,
            borderRadius: BorderRadius.circular(width / 4),
            color: Colors.transparent,
            child: CircleAvatar(
              radius: width / 4,
              backgroundImage: const AssetImage("assets/images/user.jpg"),
            ),
          ),
        ),
        kHeight10,
        const Text(
          "Welcome Back Yo!",
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.w600),
        ),
        const Text(
          "Let's login to get started...",
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
        kHeight10,
        TextFormWidget(
            prefixIcon: Icons.email_outlined,
            controller: emailController,
            forgotBtn: false,
            hint: "Enter your email"),
        TextFormWidget(
          prefixIcon: Icons.password_outlined,
          hint: "Enter your password",
          controller: passwordController,
          forgotBtn: true,
        ),
        LoginButtonWidget(
          height: height * .05,
          width: width / 3,
          name: "LOGIN",
          fnctn: () => Get.offAll(() => const HomeNavigationPage()),
        ),
        kHeight10,
        const LoginMethodButtons(
          text: "Continue with Facebook",
          icon: Icons.facebook,
          color: Colors.blue,
        ),
        kHeight10,
        GestureDetector(
          onTap: () {
            loginController.googleLogin();
          },
          child: const LoginMethodButtons(
            text: "Continue with Google   ",
            icon: FontAwesomeIcons.google,
            color: Colors.redAccent,
          ),
        ),
        kHeight10,
        GestureDetector(
          onTap: () {
            Get.to(() => FilledRoundedPinPut());
          },
          child: const LoginMethodButtons(
            text: "Continue with Mobile   ",
            icon: FontAwesomeIcons.mobile,
            color: Colors.black,
          ),
        ),
        kHeight10,
        SignUpWidget(
            text1: "Don't have an account?",
            text2: " Register Now",
            fnctn: () => Get.to(() => const SignUpPage())),
      ],
    ));
  }
}
