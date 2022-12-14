import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flaunt_ecommenrce/dependency/dependency.dart';
import 'package:flaunt_ecommenrce/model/order_model/order_model.dart';
import 'package:flaunt_ecommenrce/model/product_model/product_model.dart';
import 'package:flaunt_ecommenrce/services/firebase_services.dart';
import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:flaunt_ecommenrce/model/cart_model/cart_model.dart';

class CartController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    // totalPriceCartOnStart();
  }

  @override
  void onReady() {
    super.onReady();
  }

  RxString orderNumber = "".obs;
  var address = {}.obs;
  RxBool checkBool = true.obs;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  RxDouble totalPriceCart = 0.0.obs;
  RxInt productCountCart = 1.obs;
  RxList cartItems = [].obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxList<OrderModel> productList = RxList<OrderModel>([]);
  RxList<OrderModel> orderList = RxList<OrderModel>([]);
  RxDouble itemPrice = 0.0.obs;
  RxDouble totalPrice = 0.0.obs;
  RxInt quantity = 0.obs;
  RxDouble sum = 0.0.obs;
  ValueNotifier<double> priceCartListenable = ValueNotifier(0);
  RxDouble cartSum = 0.0.obs;
  final user = FirebaseAuth.instance.currentUser!;
  String addressUser = "";
  increaseQuantity(int quantity) {
    if (productCountCart.value < quantity) {
      productCountCart.value++;
    } else {
      Get.snackbar("ERROR", "MAXIMUM QTY REACHED", colorText: kRedAccent);
    }
    update();
  }

  addOrdersToDb() async {
    if (address.isNotEmpty) {
      for (var element in orderList.value) {
        await FirebaseDatabase.addOrder(element);
      }
      orderList.value.forEach((element) {
        deleteItem(docId: element.productId);
      });
      // for (var element in orderList) {
      //   await deleteItem(docId: element.productId);
      //   orderList.remove(element);
      // }
      checkBool.value = true;
    } else {
      Get.snackbar("ERROR", "Please Add Address");
    }
  }
  // totalPriceCartOnStart() async {
  //   var price = 0.0;
  //   var quantity = 0;
  //   var total = 0.0;
  //   _firebaseFirestore
  //       .collection("cart")
  //       .doc(user.email)
  //       .collection("products")
  //       .get()
  //       .then((value) {
  //     value.docs.map((e) {
  //       price = double.parse(e["price"]);
  //       quantity = int.parse(e['quantity']);
  //       total = price * quantity;
  //       cartController.priceCartListenable.value =
  //           cartController.priceCartListenable.value + total;
  //     });
  //   });
  //   print(cartController.priceCartListenable.value);
  // }

  // totalCPrice() async {
  //   var cartitems = await _firebaseFirestore
  //       .collection('cart')
  //       .doc(user.email)
  //       .collection("products")
  //       .snapshots();
  //   StreamBuilder(
  //     stream: cartitems,
  //     builder: (context, snapshot) {
  //       if (snapshot.data != null) {
  //         for (int i = 0; i <= snapshot.data!.docs.length; i++) {
  //           var cartSnapshot =
  //               snapshot.data!.docs[i].data() as Map<String, dynamic>;
  //           String price = cartSnapshot['price'];
  //           String quantity = cartSnapshot['quantity'];
  //           var tempPrice = double.parse(price);
  //           var tempQuantity = int.parse(quantity);
  //           var tempTotal = tempPrice * tempQuantity;
  //           cartSum.value = tempTotal + cartSum.value;
  //         }

  //         sum.value = cartSum.value;
  //       }
  //       return Text(cartSum.value.toString());
  //     },
  //   );
  // }

  decreaseQuantity(int quantity) {
    if (productCountCart.value > 1) {
      productCountCart.value--;
    } else {
      Get.snackbar("ERROR", "MINIMUM QTY REACHED", colorText: kRedAccent);
    }
    update();
  }

  addtoCart(String docId, String category, String subCategory, String id,
      bool isMainCollection) async {
    var quantity = 0;
    quantity = cartController.productCountCart.value;
    var price = 0.0;

    var total = 0.0;
    final product = FirebaseDatabase.getCartItem(
        docId, category, subCategory, id, isMainCollection);
    var productInfo = await product.then((value) {
      price = double.parse(value['price']);

      total = price * quantity;

      print(total);
    });

    cartItems.add(product);

    // FirebaseDatabase.addToCart(product, user.email.toString());
    log(cartItems.toString());
    update();
  }

  // stringToDouble(String value, String qty) {
  //   quantity.value = int.parse(qty);
  //   itemPrice.value = double.parse(value);
  //   itemPrice.value = quantity.value * itemPrice.value;
  //   sum.value = sum.value + itemPrice.value;
  // }

  Future<void> deleteItem({
    required String docId,
  }) async {
    final CollectionReference mainCollection =
        _firebaseFirestore.collection('cart');

    DocumentReference documentReference =
        mainCollection.doc(userEmail).collection("products").doc(docId);
    await documentReference
        .delete()
        .whenComplete(() => Get.snackbar("Success", "Deleted Successfully",
            colorText: kGreenAccent))
        .catchError((e) => print(e));
    update();
  }

  checkCartItem(String docId, String category, String subCategory, String id,
      isMainCollection) async {
    await _firebaseFirestore
        .collection('cart')
        .doc(userEmail)
        .collection("products")
        .doc(docId)
        .get()
        .then((onValue) async {
      onValue.exists
          ? Get.snackbar("PROMPT", "ITEM ALREADY IN CART")
          : await addtoCart(docId, category, subCategory, id, isMainCollection);
    });
  }

  Future<void> updateToCart(String docId, String category, String subCategory,
      String id, OrderModel product) async {
    try {
      await _firebaseFirestore
          .collection('orders')
          .doc(user.email)
          .collection("products")
          .doc(id)
          .set(product.toMap());
    } catch (e) {}
  }

  @override
  void onClose() {
    super.onClose();
  }
}
