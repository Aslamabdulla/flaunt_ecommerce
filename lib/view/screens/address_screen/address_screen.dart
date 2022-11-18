import 'package:flaunt_ecommenrce/controller/address_contrller/address_controller.dart';
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

import 'package:get/get.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

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
          GetX<AddressController>(
              init: AddressController(),
              builder: (addressCtrl) {
                final List<Rx<TextEditingController>> textFormController = [
                  addressCtrl.nameController,
                  addressCtrl.phoneController,
                  addressCtrl.addressController,
                  addressCtrl.cityController,
                  addressCtrl.stateController,
                  addressCtrl.pinCodeController,
                ];
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
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
                                  controller: textFormController[index].value,
                                  hint: hintListAddress[index],
                                  prefixIcon: iconsAddress[index])),
                        ),
                        kHeight20,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton.icon(
                                style: addressScreenButton(
                                    kLightBlue.withOpacity(.8)),
                                onPressed: () async {
                                  await addressCtrl.addAddressToFirebase();
                                  print(
                                      addressCtrl.pinCodeController.value.text);
                                  bool validate = addressCtrl.validator();
                                  if (validate) {
                                    await addressCtrl.updateAddress();
                                    Navigator.of(context).pop();
                                  }
                                },
                                icon: Icon(
                                  Icons.location_city,
                                  size: 20,
                                ),
                                label: Text(
                                  "ADD ADDRESS",
                                  style: textStyleSize(18, FontWeight.w800),
                                )),
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
                      ],
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
