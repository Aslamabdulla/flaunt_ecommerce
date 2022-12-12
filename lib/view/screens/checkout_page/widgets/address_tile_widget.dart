import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flaunt_ecommenrce/dependency/dependency.dart';
import 'package:flaunt_ecommenrce/model/adress_model/address_model.dart';
import 'package:flaunt_ecommenrce/services/firebase_services.dart';
import 'package:flaunt_ecommenrce/view/common/common.dart';
import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flaunt_ecommenrce/view/screens/address_screen/address_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddressTileWidget extends StatelessWidget {
  const AddressTileWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = ScreenUtil().screenHeight;
    final width = ScreenUtil().screenWidth;
    print(width * .25);
    return Container(
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.symmetric(horizontal: 15).w,
      width: width.w,
      height: 161.h,
      decoration: decorationCartTile,
      child: StreamBuilder<DocumentSnapshot<Object?>>(
          stream: FirebaseDatabase.addressGet(),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return const Text("NO ADDRESS ADDED");
            } else if (snapshot.data.isBlank == true) {
              return const Text("Please add address");
            } else if (snapshot.data!.data() == null) {
              return GestureDetector(
                onTap: () => Get.to(() => const AddressScreen()),
                child: Center(
                  child: Container(
                    width: 110.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(15).r),
                    child: const Center(
                      child: Text(
                        "Add Address",
                        style: TextStyle(
                            color: kDarkBlue, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
              );
            } else {
              final addressMAp = snapshot.data!.data() as Map<String, dynamic>;
              cartController.address.value = addressMAp;
              return Container(
                margin: const EdgeInsets.all(20).r,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${addressMAp["name"]},",
                            style: textStyleSize(13, FontWeight.normal),
                          ),
                          Text(
                            "${addressMAp["address"]},",
                            style: textStyleSize(13, FontWeight.normal),
                          ),
                          Text(
                            "${addressMAp["city"]},",
                            style: textStyleSize(13, FontWeight.normal),
                          ),
                          Text(
                            "${addressMAp["state"]},",
                            style: textStyleSize(13, FontWeight.normal),
                          ),
                          Text(
                            "${addressMAp["pincode"]},",
                            style: textStyleSize(13, FontWeight.normal),
                          ),
                          Text(
                            "${addressMAp["phone"]},",
                            style: textStyleSize(13, FontWeight.normal),
                          ),
                        ],
                      ),
                      kWidth20,
                      GestureDetector(
                        onTap: () => Get.to(() => const AddressScreen()),
                        child: Container(
                          width: width * .25.w,
                          height: height * .05.h,
                          decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(15).w),
                          child: const Center(
                            child: Text(
                              "Change Address",
                              style: TextStyle(color: kDarkBlue),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }
          }),
    );
  }
}
