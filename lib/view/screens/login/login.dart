import 'package:firebase_auth/firebase_auth.dart';
import 'package:flaunt_ecommenrce/view/screens/home_bottom_navigation/home_navigation.dart';
import 'package:flaunt_ecommenrce/view/screens/home_screen/home_screen.dart';
import 'package:flaunt_ecommenrce/view/screens/login/widgets/contents.dart';
import 'package:flaunt_ecommenrce/view/screens/login/widgets/custom_paint.dart';

import 'package:flaunt_ecommenrce/view/screens/login/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(
                child: CupertinoActivityIndicator(),
              ),
            );
          }
          if (snapshot.data == null) {
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
                    ColumnWidget(
                        height: height,
                        width: width,
                        emailController: emailController,
                        passwordController: passwordController)
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return const Scaffold(
              body: Center(
                child: Text("Error Occured"),
              ),
            );
          } else if (snapshot.data!.emailVerified) {
            return const HomeNavigationPage();
          } else {
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
                    ColumnWidget(
                        height: height,
                        width: width,
                        emailController: emailController,
                        passwordController: passwordController)
                  ],
                ),
              ),
            );
          }
        });
  }
}
