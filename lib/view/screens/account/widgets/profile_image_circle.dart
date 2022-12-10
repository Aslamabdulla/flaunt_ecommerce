import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      padding: EdgeInsets.only(top: height * .12.h).r,
      child: PhysicalModel(
        elevation: 10,
        borderRadius: BorderRadius.circular(width / 4).w,
        color: Colors.transparent,
        child: CircleAvatar(
          radius: width / 4.w,
          backgroundImage: user?.photoURL == null
              ? const AssetImage("assets/images/user.jpg")
              : NetworkImage(profileImage) as ImageProvider,
        ),
      ),
    );
  }
}
