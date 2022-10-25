import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flaunt_ecommenrce/view/screens/login/login.dart';
import 'package:flaunt_ecommenrce/view/screens/onboarding/on_boarding_second.dart';
import 'package:flaunt_ecommenrce/view/screens/onboarding/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingFinalScreen extends StatelessWidget {
  const OnboardingFinalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      body: Container(
          height: height,
          width: width,
          decoration: onBoardFinalImage,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "DRESS LIKE A\nBOSS",
                            style: TextStyle(
                                fontSize: 30,
                                color: kWhite,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "A Premium Online Store For Men & Women\nFind Their Stylish Choice",
                            style: TextStyle(fontSize: 12, color: kWhite),
                          )
                        ],
                      ),
                      CircleAvatar(
                        backgroundColor: kWhite,
                        radius: 30,
                        child: Center(
                          child: IconButton(
                            onPressed: () => Get.offAll(() => const LoginPage(),
                                transition: Transition.rightToLeft,
                                duration: const Duration(milliseconds: 400)),
                            icon: const Icon(
                              Icons.chevron_right,
                              color: kBlack,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
