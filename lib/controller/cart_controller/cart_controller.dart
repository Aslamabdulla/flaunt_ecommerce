import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flaunt_ecommenrce/dependency/dependency.dart';
import 'package:flaunt_ecommenrce/model/product_model.dart';
import 'package:flaunt_ecommenrce/services/firebase_services.dart';
import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:flaunt_ecommenrce/model/product.dart';

class CartController extends GetxController {
  @override
  void onInit() {
    totalCPrice();
    super.onInit();
  }

  @override
  void onReady() {
    totalCPrice();
    super.onReady();
  }

  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  RxInt productCountCart = 1.obs;
  RxList cartItems = [].obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxList<Product> productList = RxList<Product>([]);
  RxDouble itemPrice = 0.0.obs;
  RxDouble totalPrice = 0.0.obs;
  RxInt quantity = 0.obs;
  RxDouble sum = 0.0.obs;
  ValueNotifier<double> priceCartListenable = ValueNotifier(0);
  RxDouble cartSum = 0.0.obs;
  final user = FirebaseAuth.instance.currentUser!;
  increaseQuantity(int quantity) {
    if (productCountCart.value < quantity) {
      productCountCart.value++;
    } else {
      Get.snackbar("ERROR", "MAXIMUM QTY REACHED", colorText: kRedAccent);
    }
    update();
  }

  totalCPrice() async {
    var cartitems = await _firebaseFirestore
        .collection('cart')
        .doc(user.email)
        .collection("products")
        .snapshots();
    StreamBuilder(
      stream: cartitems,
      builder: (context, snapshot) {
        if (snapshot.data != null) {
          for (int i = 0; i <= snapshot.data!.docs.length; i++) {
            var cartSnapshot =
                snapshot.data!.docs[i].data() as Map<String, dynamic>;
            String price = cartSnapshot['price'];
            String quantity = cartSnapshot['quantity'];
            var tempPrice = double.parse(price);
            var tempQuantity = int.parse(quantity);
            var tempTotal = tempPrice * tempQuantity;
            cartSum.value = tempTotal + cartSum.value;
          }
          print(cartSum.value.toString());
          sum.value = cartSum.value;
        }
        return Text(cartSum.value.toString());
      },
    );
  }

  decreaseQuantity(int quantity) {
    if (productCountCart.value > 1) {
      productCountCart.value--;
    } else {
      Get.snackbar("ERROR", "MINIMUM QTY REACHED", colorText: kRedAccent);
    }
    update();
  }

  addtoCart(
      String docId, String category, String subCategory, String id) async {
    final product =
        FirebaseDatabase.getCartItem(docId, category, subCategory, id);

    cartItems.add(product);

    // FirebaseDatabase.addToCart(product, user.email.toString());
    log(cartItems.toString());
    update();
  }

  stringToDouble(String value, String qty) {
    quantity.value = int.parse(qty);
    itemPrice.value = double.parse(value);
    itemPrice.value = quantity.value * itemPrice.value;
    sum.value = sum.value + itemPrice.value;
    priceCartListenable.value = sum.value;
    priceCartListenable.notifyListeners();
  }

  stringToInt(String value) {}
  Future<void> deleteItem({
    required String docId,
  }) async {
    final CollectionReference mainCollection =
        _firebaseFirestore.collection('cart');

    DocumentReference documentReference =
        mainCollection.doc(user.email).collection("products").doc(docId);
    await documentReference
        .delete()
        .whenComplete(() => Get.snackbar("Success", "Deleted Successfully",
            colorText: kGreenAccent))
        .catchError((e) => print(e));
    update();
  }

  checkCartItem(
      String docId, String category, String subCategory, String id) async {
    await _firebaseFirestore
        .collection('cart')
        .doc(user.email)
        .collection("products")
        .doc(docId)
        .get()
        .then((onValue) async {
      onValue.exists
          ? Get.snackbar("PROMPT", "ITEM ALREADY IN CART")
          : await addtoCart(docId, category, subCategory, id);
    });
    // void addProductTocart(Product product) {
    //   try {
    //     if (isItemAlredyAdded(product)) {
    //       Get.snackbar("ERROR", "ITEM ALREADY IN CART");
    //     } else {
    //       String itemId = Uuid().toString();
    //       FirebaseDatabase.addToCart(product, user.email!);
    //     }
    //   } catch (e) {}
    // // }

    @override
    void onClose() {
      sum.value = 0;
      super.onClose();
    }
  }

  Future<void> updateToCart(String docId, String category, String subCategory,
      String id, ProductModel product) async {
    try {
      await _firebaseFirestore
          .collection('orders')
          .doc(user.email)
          .collection("products")
          .doc(id)
          .set(product.toJson());
    } catch (e) {}
  }
}