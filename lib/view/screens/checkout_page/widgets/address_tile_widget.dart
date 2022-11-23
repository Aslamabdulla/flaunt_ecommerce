import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flaunt_ecommenrce/dependency/dependency.dart';
import 'package:flaunt_ecommenrce/model/addres_model/address_model.dart';
import 'package:flaunt_ecommenrce/services/firebase_services.dart';
import 'package:flaunt_ecommenrce/view/common/common.dart';
import 'package:flaunt_ecommenrce/view/constants/constants.dart';
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
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      width: width,
      height: height * .2,
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
                child: Container(
                  width: width * .25,
                  height: height * .05,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: Container(
                      width: width * .25,
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(15)),
                      child: const Center(
                        child: Text(
                          "Add Address",
                          style: TextStyle(
                              color: kDarkBlue, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            } else {
              final addressMAp = snapshot.data!.data() as Map<String, dynamic>;
              cartController.address.value = addressMAp;
              return Container(
                margin: const EdgeInsets.all(20),
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
                          width: width * .25,
                          height: height * .05,
                          decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(15)),
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
