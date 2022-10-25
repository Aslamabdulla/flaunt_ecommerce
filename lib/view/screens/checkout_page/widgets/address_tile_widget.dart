import 'package:flaunt_ecommenrce/view/common/common.dart';
import 'package:flaunt_ecommenrce/view/screens/address_screen/address_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressTileWidget extends StatelessWidget {
  const AddressTileWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      width: width,
      height: height * .12,
      decoration: decorationCartTile,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              height: height * .06,
              width: width / 2.6,
              child: Text(
                "Main Street,Town Hall, Gandi Road, Kochi,Kerala",
                style: textStyleSize(13, FontWeight.normal),
              )),
          GestureDetector(
            onTap: () => Get.to(() => AddressScreen()),
            child: Text(
              "Change Address",
              style: textStyleSize(14, FontWeight.normal),
            ),
          )
        ],
      ),
    );
  }
}
