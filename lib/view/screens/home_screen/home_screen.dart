// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flaunt_ecommenrce/dependency/dependency.dart';
import 'package:flaunt_ecommenrce/view/screens/credit_card/credit_card.dart';
import 'package:flaunt_ecommenrce/view/screens/home_screen/widgets/icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flaunt_ecommenrce/view/screens/home_screen/widgets/animated_widget.dart';
import 'package:flaunt_ecommenrce/view/screens/home_screen/widgets/widgets.dart';
import 'package:flaunt_ecommenrce/view/screens/login/widgets/widgets.dart';
import 'package:flaunt_ecommenrce/view/screens/my_cart/my_cart.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    final height = ScreenUtil().screenHeight;
    final width = ScreenUtil().screenWidth;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: [
          kWidth10,
          IconButtonWidget(
              fnctn: () => Get.to(() => MyCartScreen(
                    totalBill: cartController.priceCartListenable.value,
                  )),
              icon: Icons.shopping_basket),
          IconButtonWidget(fnctn: () {}, icon: Icons.mic),
        ],
        title: AnimatedSearchWidget(
            width: width.w, textEditingController: textEditingController),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          ClipPath(
            clipper: ClipperPath(),
            child: Container(
              height: height / 1.7,
              decoration: customClipperBackground,
            ),
          ),
          SafeArea(
              child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children:
                    List.generate(widgets.length, (index) => widgets[index])),
          ))
        ],
      ),
    );
  }
}
