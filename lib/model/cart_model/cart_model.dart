import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';

class CartModel {
  String productId;
  String brand;
  String name;
  String category;
  String subCategory;
  List<dynamic> colors;
  String description;
  List<dynamic> imageUrl;
  bool isHotAndNew;
  bool isTrending;
  bool isSummerCollection;
  bool isNewArrival;
  bool isHotSales;
  bool isPopularBrand;
  String price;
  String quantity;
  double? total;
  int? orderIndex = 0;

  CartModel(
      {required this.productId,
      required this.brand,
      required this.name,
      required this.price,
      required this.category,
      required this.subCategory,
      required this.colors,
      required this.description,
      required this.imageUrl,
      required this.isHotAndNew,
      required this.isTrending,
      required this.isSummerCollection,
      required this.isNewArrival,
      required this.isHotSales,
      required this.isPopularBrand,
      required this.quantity,
      this.total,
      this.orderIndex});

  Map<String, dynamic> toJson() {
    return {
      "productId": productId,
      "brand": brand,
      "imageUrl": imageUrl,
      "price": price,
      "category": category,
      "subCategory": subCategory,
      'colors': colors,
      "description": description,
      "name": name,
      "isHotAndNew": isHotAndNew,
      "isTrending": isTrending,
      'isSummerCollection': isSummerCollection,
      "isNewArrival": isNewArrival,
      "isHotSales": isHotSales,
      "isPopularBrand": isPopularBrand,
      "quantity": quantity,
      "total": total,
      "orderIndex": 0,
    };
  }

  factory CartModel.fromJson({
    required Map<String, dynamic> json,
  }) {
    return CartModel(
      productId: json['productId'],
      brand: json["brand"],
      imageUrl: json["imageUrl"],
      price: json["price"],
      category: json['category'],
      subCategory: json["subCategory"],
      colors: json["colors"],
      description: json["description"],
      name: json["name"],
      isHotAndNew: json["isHotAndNew"],
      isTrending: json["isTrending"],
      isSummerCollection: json["isSummerCollection"],
      isNewArrival: json["isNewArrival"],
      isHotSales: json["isHotSales"],
      isPopularBrand: json["isPopularBrand"],
      quantity: json["quantity"],
      total: json['total'],
    );
  }
}
