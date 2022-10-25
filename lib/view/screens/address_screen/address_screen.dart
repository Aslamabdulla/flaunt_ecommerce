import 'package:flaunt_ecommenrce/view/common/common.dart';
import 'package:flaunt_ecommenrce/view/common/widgets/add_address_button.dart';
import 'package:flaunt_ecommenrce/view/common/widgets/login_button_widget.dart';
import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flaunt_ecommenrce/view/screens/address_screen/widgets/widgets.dart';
import 'package:flaunt_ecommenrce/view/screens/home_screen/widgets/row_widget.dart';
import 'package:flaunt_ecommenrce/view/screens/home_screen/widgets/widgets.dart';
import 'package:flaunt_ecommenrce/view/screens/login/widgets/text_form_widget.dart';
import 'package:flaunt_ecommenrce/view/screens/login/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        foregroundColor: kBlack,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          ClipPath(
            clipper: ClipperPath(),
            child: Container(
              height: height / 3,
              decoration: customClipperBackground,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                RowWidget(
                    mainAxis: MainAxisAlignment.center,
                    text: "Edit Your Delivery Address",
                    top: height * .18,
                    left: 0,
                    fontSize: 22),
                kHeight50,
                kHeight40,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      6,
                      (index) => TextFormWidget(
                          forgotBtn: false,
                          controller: textFormController[index],
                          hint: hintListAddress[index],
                          prefixIcon: iconsAddress[index])),
                ),
                kHeight20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton.icon(
                        style: addressScreenButton(Colors.black),
                        onPressed: () {},
                        icon: Icon(Icons.home_filled),
                        label: Text("Home")),
                    kWidth15,
                    TextButton.icon(
                        style: addressScreenButton(kGrey.withOpacity(.3)),
                        onPressed: () {},
                        icon: Icon(Icons.location_city),
                        label: Text("Office")),
                  ],
                ),
                kHeight15,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.check_box),
                    kWidth5,
                    Text("Save to default address"),
                  ],
                ),
                kHeight15,
                AddAddressButtonWidget(
                    name: "Add Address",
                    height: height * .06,
                    width: width - 80,
                    fnctn: () => Get.back())
              ],
            ),
          ),
        ],
      ),
    );
  }
}
