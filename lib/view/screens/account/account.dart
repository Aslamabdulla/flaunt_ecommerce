// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flaunt_ecommenrce/dependency/dependency.dart';
import 'package:flaunt_ecommenrce/view/screens/account/widgets/my_orders.dart';
import 'package:flaunt_ecommenrce/view/screens/home_screen/home_screen.dart';
import 'package:flaunt_ecommenrce/view/screens/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import 'package:flaunt_ecommenrce/view/constants/constants.dart';

import 'package:flaunt_ecommenrce/view/screens/login/widgets/custom_paint.dart';

import 'package:flaunt_ecommenrce/view/screens/login/widgets/widgets.dart';

import 'package:google_sign_in/google_sign_in.dart';

import 'widgets/account_list_tile_widget.dart';
import 'widgets/profile_image_circle.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = ScreenUtil().screenHeight;
    final width = ScreenUtil().screenWidth;
    final user = FirebaseAuth.instance.currentUser;
    final String username = user?.displayName ?? "USER";
    final String email = user?.email ?? user?.phoneNumber ?? "EMAIL";
    final String profileImage = user?.photoURL ?? "";

    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          ClipPath(
            clipper: BackgroundClipper(),
            child: Container(
              height: height.h,
              width: width.w,
              decoration: customClipperBackground,
            ),
          ),
          SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                kHeight20,
                ProfileImageCircleAvatar(
                    height: height.h,
                    width: width.w,
                    user: user,
                    profileImage: profileImage),
                kHeight10,
                Text(
                  username,
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
                ),
                Text(
                  email,
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                ),
                kHeight15,
                Container(
                    width: 300.w,
                    height: 280.h,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(.1),
                        borderRadius: BorderRadius.circular(20).w),
                    child: SingleChildScrollView(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AccountListTile(
                              onTap: () => Get.to(() => const MyOrdersScreen()),
                              text: "My Orders",
                              leading: Icons.local_mall,
                              trailing: Icons.chevron_right,
                            ),
                            AccountListTile(
                              onTap: () {},
                              text: "Address book",
                              leading: Icons.badge,
                              trailing: Icons.chevron_right,
                            ),
                            AccountListTile(
                              onTap: () {},
                              text: "Giftcard & Vouchers",
                              leading: Icons.redeem,
                              trailing: Icons.chevron_right,
                            ),
                            AccountListTile(
                              onTap: () {},
                              text: "Help & Support",
                              leading: Icons.help,
                              trailing: Icons.chevron_right,
                            ),
                            AccountListTile(
                              onTap: () {
                                final googleSignin = GoogleSignIn();
                                FirebaseAuth.instance.signOut();
                                loginController.signout();
                                Get.offAll(() => const LoginPage(),
                                    transition: Transition.leftToRight);
                              },
                              text: "Logout",
                              leading: Icons.logout_outlined,
                              trailing: Icons.chevron_right,
                            ),
                          ]),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
