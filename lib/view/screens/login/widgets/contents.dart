import 'package:firebase_auth/firebase_auth.dart';
import 'package:flaunt_ecommenrce/controller/login_controller/login_controller.dart';
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
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ColumnWidget extends StatelessWidget {
  ColumnWidget({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;
  TextEditingController emailController = TextEditingController();
  TextEditingController passWordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GetBuilder<LoginController>(
            init: LoginController(),
            builder: (loginCtrl) {
              return Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  kHeight35,
                  Container(
                    padding: EdgeInsets.only(top: height / 8).r,
                    child: PhysicalModel(
                      elevation: 10,
                      borderRadius: BorderRadius.circular(width / 4).w,
                      color: Colors.transparent,
                      child: CircleAvatar(
                        radius: width / 4.w,
                        backgroundImage:
                            const AssetImage("assets/images/user.jpg"),
                      ),
                    ),
                  ),
                  kHeight10,
                  Text(
                    "Welcome Back Yo!",
                    style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "Let's login to get started...",
                    style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                  ),
                  kHeight10,
                  TextFormWidget(
                      isObscure: false,
                      prefixIcon: Icons.email_outlined,
                      controller: loginCtrl.emailController,
                      forgotBtn: false,
                      hint: "Enter your email"),
                  TextFormWidget(
                    isObscure: true,
                    prefixIcon: Icons.password_outlined,
                    hint: "Enter your password",
                    controller: loginCtrl.loginPasswodController,
                    forgotBtn: true,
                  ),
                  LoginButtonWidget(
                      height: height * .05.h,
                      width: width / 3.w,
                      name: "LOGIN",
                      fnctn: () => loginCtrl.signIn()),
                  kHeight10,
                  const LoginMethodButtons(
                    text: "Continue with Facebook",
                    icon: Icons.facebook,
                    color: Colors.blue,
                  ),
                  kHeight10,
                  GestureDetector(
                    onTap: () {
                      loginCtrl.googleLogin();
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
                      Get.to(() => FilledRoundedPinPut(),
                          transition: Transition.rightToLeft,
                          duration: Duration(milliseconds: 400));
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
                      fnctn: () => Get.to(
                          transition: Transition.rightToLeft,
                          duration: const Duration(milliseconds: 400),
                          () => SignUpPage(
                                loginCtrl: loginCtrl,
                              ))),
                ],
              );
            }));
  }
}
