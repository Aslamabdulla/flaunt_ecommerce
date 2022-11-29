import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flaunt_ecommenrce/model/cart_model.dart';
import 'package:flaunt_ecommenrce/services/firebase_services.dart';
import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flaunt_ecommenrce/view/screens/home_screen/widgets/widgets.dart';
import 'package:flaunt_ecommenrce/view/screens/product_view/product_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewWallWidget extends StatelessWidget {
  const NewWallWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: 150,
      child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: FirebaseDatabase.readHotsales("newarrivals"),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("ERROR WHILE FETCHING DATA");
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return CupertinoActivityIndicator();
            } else if (snapshot.data == null) {
              return Text("NO DATA");
            } else {
              return ListView.separated(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.docs.length,
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                        width: 10,
                      ),
                  itemBuilder: (context, index) {
                    var newProducts = CartModel.fromJson(
                        json: snapshot.data!.docs[index].data());
                    String id = snapshot.data!.docs[index].id;
                    return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          image: const DecorationImage(
                              image: AssetImage(
                                  "assets/images/backgroundnewarrival.png"),
                              fit: BoxFit.cover)),
                      height: height / 4,
                      width: width / 1.4,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              kHeight5,
                              const Text(
                                "NEW\nARRIVALS",
                                style: TextStyle(fontSize: 20, color: kWhite),
                              ),
                              const Text(
                                "Fashion Nova",
                                style: TextStyle(fontSize: 10, color: kWhite),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Get.to(() => ProductViewScreen(
                                      itemIndex: index,
                                      category: "newarrivals",
                                      subCategory: "flaunt",
                                      isMainCollection: false,
                                      docId: id));
                                },
                                child: const Text("Shop Now"),
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20))),
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.purple),
                                ),
                              )
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 10),
                            height: height * .17,
                            width: width * .3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              image: DecorationImage(
                                  image: NetworkImage(newProducts.imageUrl[0]),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ],
                      ),
                    );
                  });
            }
          }),
    );
  }
}
