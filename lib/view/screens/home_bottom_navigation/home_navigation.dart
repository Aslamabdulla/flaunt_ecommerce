// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bottom_bar_with_sheet/bottom_bar_with_sheet.dart';
import 'package:flaunt_ecommenrce/view/screens/account/account.dart';
import 'package:flaunt_ecommenrce/view/screens/home_bottom_navigation/widgets/bottom_nav.dart';
import 'package:flaunt_ecommenrce/view/screens/wallet_screen/wallet_flaunt_pay.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flaunt_ecommenrce/controller/bottom_controller/bottom_controller.dart';

import 'package:flaunt_ecommenrce/view/screens/home_screen/home_screen.dart';
import 'package:flaunt_ecommenrce/view/screens/hot_and_new/hot_and_new.dart';

class HomeNavigationPage extends StatelessWidget {
  const HomeNavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List screens = [
      const HomeScreen(),
      const FlauntPayScreen(),
      const HotAndNewScreen(),
      const AccountPage(),
    ];
    return GetX(
        init: BottomController(),
        builder: (BottomController bottomController) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            bottomNavigationBar:
                BottomNavigationBarWidget(bottomController: bottomController),
            body: screens[bottomController.newIndex.value],
          );
        });
  }
}
