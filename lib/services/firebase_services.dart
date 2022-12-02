import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flaunt_ecommenrce/dependency/dependency.dart';
import 'package:flaunt_ecommenrce/model/addres_model/address_model.dart';
import 'package:flaunt_ecommenrce/model/cart_model.dart';
import 'package:flaunt_ecommenrce/model/order_model.dart';
import 'package:flaunt_ecommenrce/model/product_model.dart';
import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final user = FirebaseAuth.instance.currentUser!;
final userEmail = user.email ?? user.uid;
final CollectionReference _mainCollection = _firestore.collection("categories");
final CollectionReference _homeCollection = _firestore.collection("sections");
final CollectionReference _cartCollection = _firestore.collection("cart");
final CollectionReference _adminOrderCollection =
    _firestore.collection("orders_admin");
final CollectionReference _userOrderCollection = _firestore.collection("users");
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

  static Stream<DocumentSnapshot<Object?>> getItem(String docId,
      String category, String subCategory, bool isMainCollection) {
    DocumentReference documentReference = isMainCollection
        ? _mainCollection
            .doc(category)
            .collection("subcategories")
            .doc(subCategory)
            .collection("products")
            .doc(docId)
        : _homeCollection
            .doc(category)
            .collection("subcategories")
            .doc(subCategory)
            .collection("products")
            .doc(docId);
    return documentReference.snapshots();
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> readFav() {
    return _firestore
        .collection("users")
        .doc(userEmail)
        .collection("favourites")
        .snapshots();
  }

  static Future<void> addFav(CartModel product) async {
    // Map<String,dynamic> data = <String,dynamic> {
    //   ""
    // };
    final _mainCollection = await _firestore
        .collection('users')
        .doc(userEmail)
        .collection("favourites")
        .doc(product.productId)
        .set(product.toJson());

    return _mainCollection;
  }

  static Future<void> addToCart(
      OrderModel product, String userId, String id) async {
    Map<String, dynamic> data = <String, dynamic>{
      "useId": userEmail,
      "time": DateTime.now(),
    };
    Map<String, dynamic> itemData = {};
    // Map<String,dynamic> data = <String,dynamic> {
    //   ""
    // };
    // final temp = _mainCollection
    //     .doc("Women")
    //     .collection("subcategories")
    //     .doc("Western Wear")
    //     .collection("products")
    //     .doc();
    // temp.set(product.toMap());
    final cartPath = _cartCollection.doc(userEmail);
    cartPath.set(data);

    cartPath.collection("products").doc(id).set(
          product.toMap(),
        );
  }

  static Future<Map<String, dynamic>> getCartItem(String docId, String category,
      String subCategory, String id, bool isMainCollection) async {
    Map<String, dynamic> userData = <String, dynamic>{
      "useId": user.email ?? user.uid,
      "lastPurchase": DateTime.now(),
      "total": "total",
    };
    final cartPath = _userOrderCollection.doc(userEmail);
    await cartPath.set(userData);
    final cartData = cartPath.collection("products");

    DocumentReference documentReference = isMainCollection
        ? _mainCollection
            .doc(category)
            .collection("subcategories")
            .doc(subCategory)
            .collection("products")
            .doc(docId)
        : _homeCollection
            .doc(category)
            .collection("subcategories")
            .doc(subCategory)
            .collection("products")
            .doc(docId);
    if (isMainCollection) {
      await documentReference.get().then(
        (DocumentSnapshot doc) {
          data = <String, dynamic>{};
          data = doc.data() as Map<String, dynamic>;
          final product = OrderModel(
              orderId: "",
              address: [],
              productIndex: "0",
              userEmail: userEmail,
              date: DateTime.now().toString(),
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
          addToCart(product, user.email ?? user.uid, id);
          // cartData.add(
          //   data,
          // );
        },
        onError: (e) => print("Error getting document: $e"),
      );
    } else {
      await documentReference.get().then(
        (DocumentSnapshot doc) {
          data = <String, dynamic>{};
          data = doc.data() as Map<String, dynamic>;
          final product = OrderModel(
              orderId: "",
              address: [],
              date: DateTime.now().toString(),
              userEmail: userEmail,
              productIndex: "0",
              subCategory: subCategory,
              productId: docId,
              brand: data['brand'],
              name: data['name'],
              category: category,
              colors: data["colors"],
              description: data['description'],
              imageUrl: data['imageUrl'],
              isHotAndNew: false,
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
          addToCart(product, userEmail, id);
          // cartData.add(
          //   data,
          // );
        },
        onError: (e) => print("Error getting document: $e"),
      );
    }

    Get.snackbar("SUCCESS", "ITEM ADDED SUCCESSFULLY", colorText: kGreenAccent);
    cartController.productCountCart.value = 1;
    return data;
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> readCart() {
    return _firestore
        .collection("cart")
        .doc(user.email ?? user.uid)
        .collection("products")
        .snapshots();
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> readorders() {
    return _firestore
        .collection("users")
        .doc(user.email ?? user.uid)
        .collection("order_history")
        .snapshots();
  }

  static Future<void> updateToCart({
    required OrderModel productModel,
  }) async {
    try {
      await _firestore
          .collection('cart')
          .doc(user.email)
          .collection("products")
          .doc(productModel.productId)
          .set(productModel.toMap());
    } on FirebaseAuthException catch (e) {
      Get.snackbar("ERROR", "ERROR OCCURED");
    }
  }

  static Future<void> addAddress(AddressModel address) async {
    // Map<String,dynamic> data = <String,dynamic> {
    //   ""
    // };
    final _mainCollection = await _firestore
        .collection('users')
        .doc(user.email ?? user.uid)
        .collection("address")
        .doc("details")
        .set(address.toMap());

    return _mainCollection;
  }

  static Future getAddess(AddressModel address) async {
    final documentReference = _firestore
        .collection("users")
        .doc(user.email ?? user.uid)
        .collection("address")
        .doc("details")
        .get();
    await documentReference.then((DocumentSnapshot doc) {
      var data = {};
      data = doc.data() as Map<String, dynamic>;
    });
    return documentReference;
  }

  static Stream<DocumentSnapshot<Object?>> addressGet() {
    final documentReference = _firestore
        .collection("users")
        .doc(user.email ?? user.uid)
        .collection("address")
        .doc("details");
    // await documentReference.then((DocumentSnapshot doc) {
    //   var data = {};
    //   data = doc.data() as Map<String, dynamic>;
    // });
    return documentReference.snapshots();
  }

  static Future<void> addOrder(OrderModel product) async {
    Map<String, dynamic> data = <String, dynamic>{
      "useId": user.email ?? user.uid,
      "time": DateTime.now()
    };
    Map<String, dynamic> itemData = {};
    // Map<String,dynamic> data = <String,dynamic> {
    //   ""
    // };
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('MMddkkmm').format(now);
    cartController.orderNumber.value = formattedDate;
    print(formattedDate);
    var tempAddress = [];
    final address = cartController.address.value;
    tempAddress = address.values.toList();
    print(tempAddress);
    // final uuid = DateTime.now();
    // String formattedId = DateFormat().format(now);
    final cartPath = await _userOrderCollection
        .doc(user.email ?? user.uid)
        .collection("order_history")
        .doc("${product.productId}$formattedDate");
    cartPath.set(
      OrderModel(
              price: product.price,
              orderId: "FLNT$formattedDate",
              quantity: product.quantity,
              address: tempAddress,
              productId: product.productId,
              brand: product.brand,
              name: product.name,
              category: product.category,
              subCategory: product.subCategory,
              colors: product.colors,
              description: product.description,
              imageUrl: product.imageUrl,
              isHotAndNew: product.isHotAndNew,
              isTrending: product.isTrending,
              isSummerCollection: product.isSummerCollection,
              isNewArrival: product.isNewArrival,
              isHotSales: product.isHotSales,
              isPopularBrand: product.isPopularBrand,
              total: product.total,
              date: product.date,
              userEmail: userEmail)
          .toMap(),
    );
    final adminOrder =
        await _adminOrderCollection.doc("${product.productId}$formattedDate");
    adminOrder.set(
      OrderModel(
              price: product.price,
              orderId: "FLNT$formattedDate",
              quantity: product.quantity,
              address: tempAddress,
              productId: product.productId,
              brand: product.brand,
              name: product.name,
              category: product.category,
              subCategory: product.subCategory,
              colors: product.colors,
              description: product.description,
              imageUrl: product.imageUrl,
              isHotAndNew: product.isHotAndNew,
              isTrending: product.isTrending,
              isSummerCollection: product.isSummerCollection,
              isNewArrival: product.isNewArrival,
              isHotSales: product.isHotSales,
              isPopularBrand: product.isPopularBrand,
              total: product.total,
              date: product.date,
              userEmail: userEmail)
          .toMap(),
    );
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> readHotsales(
      String category) {
    return _firestore
        .collection("sections")
        .doc(category)
        .collection("subcategories")
        .doc("flaunt")
        .collection("products")
        .snapshots();
  }
}
