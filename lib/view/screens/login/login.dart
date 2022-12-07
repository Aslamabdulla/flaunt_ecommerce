import 'package:firebase_auth/firebase_auth.dart';
import 'package:flaunt_ecommenrce/view/screens/home_bottom_navigation/home_navigation.dart';
import 'package:flaunt_ecommenrce/view/screens/home_screen/home_screen.dart';
import 'package:flaunt_ecommenrce/view/screens/login/widgets/contents.dart';
import 'package:flaunt_ecommenrce/view/screens/login/widgets/custom_paint.dart';

import 'package:flaunt_ecommenrce/view/screens/login/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = ScreenUtil().screenHeight;
    final width = ScreenUtil().screenWidth;

    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            // if (snapshot.connectionState == ConnectionState.waiting) {
            //   return Center(
            //     child: CupertinoActivityIndicator(),
            //   );
            // }
            if (snapshot.data == null) {
              return SingleChildScrollView(
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
                    ColumnWidget(height: height, width: width)
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text("Error Occured"),
              );
            } else if (snapshot.data != null || snapshot.data!.uid != null) {
              return const HomeNavigationPage();
            } else {
              return SingleChildScrollView(
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
                    ColumnWidget(height: height, width: width)
                  ],
                ),
              );
            }
          }),
    );
  }
}
