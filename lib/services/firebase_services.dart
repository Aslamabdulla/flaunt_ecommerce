import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flaunt_ecommenrce/dependency/dependency.dart';
import 'package:flaunt_ecommenrce/model/product.dart';
import 'package:flaunt_ecommenrce/model/product_model.dart';
import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final user = FirebaseAuth.instance.currentUser!;
final CollectionReference _mainCollection = _firestore.collection("categories");
final CollectionReference _cartCollection = _firestore.collection("cart");
final CollectionReference _adminOrderCollection =
    _firestore.collection("orderAdmin");
final CollectionReference _userOrderCollection =
    _firestore.collection("orderUser");
Map<String, dynamic> data = {};

class FirebaseDatabase {
  String? id;

  static Stream<QuerySnapshot> reaCategory() {
    return _mainCollection.snapshots();
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> readSubCategories(
      String category) {
    return _firestore
        .collection('categories')
        .doc(category)
        .collection('subcategories')
        .snapshots();
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> readproducts(
      String category, String subCategory) {
    return _firestore
        .collection("categories")
        .doc(category)
        .collection("subcategories")
        .doc(subCategory)
        .collection("products")
        .snapshots();
  }

  static Stream<DocumentSnapshot<Object?>> getItem(
      String docId, String category, String subCategory) {
    DocumentReference documentReference = _mainCollection
        .doc(category)
        .collection("subcategories")
        .doc(subCategory)
        .collection("products")
        .doc(docId);
    return documentReference.snapshots();
  }

  static Future<void> addToCart(
      ProductModel product, String userId, String id) async {
    Map<String, dynamic> data = <String, dynamic>{
      "useId": userId,
      "time": DateTime.now()
    };
    Map<String, dynamic> itemData = {};
    // Map<String,dynamic> data = <String,dynamic> {
    //   ""
    // };
    final cartPath = _cartCollection.doc(userId).collection("products").doc(id);
    cartPath.set(
      product.toJson(),
    );
  }

  // static Future<Map<String, dynamic>> createOrders() async {
  //   Map<String, dynamic> orderData = <String, dynamic>{"orderId": "orderid"};
  // }

  static Future<Map<String, dynamic>> getCartItem(
      String docId, String category, String subCategory, String id) async {
    Map<String, dynamic> userData = <String, dynamic>{
      "useId": user.email,
      "time": DateTime.now(),
      "total": "total",
    };
    final cartPath = _cartCollection.doc(user.email);
    await cartPath.set(userData);
    final cartData = cartPath.collection("products");

    DocumentReference documentReference = _mainCollection
        .doc(category)
        .collection("subcategories")
        .doc(subCategory)
        .collection("products")
        .doc(docId);

    await documentReference.get().then(
      (DocumentSnapshot doc) {
        data = <String, dynamic>{};
        data = doc.data() as Map<String, dynamic>;
        final product = ProductModel(
            subCategory: subCategory,
            productId: docId,
            brand: data['brand'],
            name: data['name'],
            category: category,
            colors: data["colors"],
            description: data['description'],
            imageUrl: data['imageUrl'],
            isHotAndNew: data['isHotAndNew'],
            isTrending: false,
            isSummerCollection: false,
            isNewArrival: false,
            isHotSales: false,
            isPopularBrand: false,
            price: data['price'],
            quantity: cartController.productCountCart.value.toString(),
            total: double.parse(data['price']) *
                cartController.productCountCart.value);
        cartController.productList.add(product);
        log(product.toString());
        print(cartController.productList.length);
        addToCart(product, user.email!, id);
        // cartData.add(
        //   data,
        // );
      },
      onError: (e) => print("Error getting document: $e"),
    );
    Get.snackbar("SUCCESS", "ITEM ADDED SUCCESSFULLY", colorText: kGreenAccent);
    cartController.productCountCart.value = 1;
    return data;
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> readCart() {
    return _firestore
        .collection("cart")
        .doc(user.email)
        .collection("products")
        .snapshots();
  }

  static Future<void> updateToCart({
    required ProductModel productModel,
  }) async {
    try {
      await _firestore
          .collection('cart')
          .doc(user.email)
          .collection("products")
          .doc(productModel.productId)
          .set(productModel.toJson());
    } on FirebaseAuthException catch (e) {
      Get.snackbar("ERROR", "ERROR OCCURED");
    }
  }
}
