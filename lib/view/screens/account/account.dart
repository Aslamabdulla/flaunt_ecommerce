// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flaunt_ecommenrce/view/screens/account/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flaunt_ecommenrce/view/screens/home_bottom_navigation/home_navigation.dart';
import 'package:flaunt_ecommenrce/view/screens/login/widgets/contents.dart';
import 'package:flaunt_ecommenrce/view/screens/login/widgets/custom_paint.dart';
import 'package:flaunt_ecommenrce/view/common/widgets/login_button_widget.dart';
import 'package:flaunt_ecommenrce/view/screens/login/widgets/login_buttons.dart';
import 'package:flaunt_ecommenrce/view/screens/login/widgets/register_now.dart';
import 'package:flaunt_ecommenrce/view/screens/login/widgets/text_form_widget.dart';
import 'package:flaunt_ecommenrce/view/screens/login/widgets/widgets.dart';
import 'package:flaunt_ecommenrce/view/screens/signup/signup.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
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
                Text(
                  "STENY JOSEPH",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                kHeight10,
                Container(
                  width: 300,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(.1),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: List.generate(
                        tileName.length,
                        (index) => AccountListTile(
                          text: tileName[index],
                          leading: iconsAccount[index],
                          trailing: Icons.chevron_right,
                        ),
                      )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class AccountListTile extends StatelessWidget {
  final String text;
  final IconData leading;
  final IconData trailing;
  const AccountListTile({
    Key? key,
    required this.text,
    required this.leading,
    required this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration:
          BoxDecoration(color: kWhite, borderRadius: BorderRadius.circular(20)),
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
    );
  }
}
