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

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
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
              height: height,
              width: width,
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
                    height: height,
                    width: width,
                    user: user,
                    profileImage: profileImage),
                kHeight10,
                Text(
                  username,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                Text(
                  email,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
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
                              onTap: () => Get.to(() => MyOrdersScreen()),
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

class ProfileImageCircleAvatar extends StatelessWidget {
  const ProfileImageCircleAvatar({
    Key? key,
    required this.height,
    required this.width,
    required this.user,
    required this.profileImage,
  }) : super(key: key);

  final double height;
  final double width;
  final User? user;
  final String profileImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: height * .12),
      child: PhysicalModel(
        elevation: 10,
        borderRadius: BorderRadius.circular(width / 4),
        color: Colors.transparent,
        child: CircleAvatar(
          radius: width / 4,
          backgroundImage: user?.photoURL == null
              ? AssetImage("assets/images/user.jpg")
              : NetworkImage(profileImage) as ImageProvider,
        ),
      ),
    );
  }
}

class AccountListTile extends StatelessWidget {
  final String text;
  final IconData leading;
  final IconData trailing;
  final Function() onTap;
  const AccountListTile({
    Key? key,
    required this.text,
    required this.leading,
    required this.trailing,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
            color: kWhite, borderRadius: BorderRadius.circular(20)),
        width: 250,
        height: 45,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          kWidth10,
          Icon(leading),
          Spacer(),
          Text(text),
          Spacer(),
          Icon(trailing),
          kWidth10
        ]),
      ),
    );
  }
}
