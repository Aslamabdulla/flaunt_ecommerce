// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flaunt_ecommenrce/services/database_services.dart';

List<String> colors = ["[F5A127]"];

class OrderModel extends Equatable {
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
  String productIndex;
  double total;
  String date;
  String userEmail;
  List address;
  String orderId;

  OrderModel(
      {required this.orderId,
      required this.address,
      required this.productId,
      required this.brand,
      required this.name,
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
      this.price = "0",
      this.quantity = "0",
      this.productIndex = "1",
      required this.total,
      required this.date,
      required this.userEmail});

  OrderModel copyWith({
    String? orderId,
    String? productId,
    String? brand,
    String? name,
    String? category,
    String? subCategory,
    List<dynamic>? colors,
    String? description,
    List<dynamic>? imageUrl,
    bool? isHotAndNew,
    bool? isTrending,
    bool? isSummerCollection,
    bool? isNewArrival,
    bool? isHotSales,
    bool? isPopularBrand,
    String? userEmail,
    String? price,
    String? quantity,
    String? productIndex,
    double? total,
    String? date,
    List? address,
  }) {
    return OrderModel(
        orderId: orderId ?? this.orderId,
        address: address ?? this.address,
        productId: productId ?? this.productId,
        brand: brand ?? this.brand,
        name: name ?? this.name,
        category: category ?? this.category,
        subCategory: subCategory ?? this.subCategory,
        colors: colors ?? this.colors,
        description: description ?? this.description,
        imageUrl: imageUrl ?? this.imageUrl,
        isHotAndNew: isHotAndNew ?? this.isHotAndNew,
        isTrending: isTrending ?? this.isTrending,
        isSummerCollection: isSummerCollection ?? this.isSummerCollection,
        isNewArrival: isNewArrival ?? this.isNewArrival,
        isHotSales: isHotSales ?? this.isHotSales,
        isPopularBrand: isPopularBrand ?? this.isPopularBrand,
        price: price ?? this.price,
        quantity: quantity ?? this.quantity,
        productIndex: productIndex ?? this.productIndex,
        total: total ?? this.total,
        date: date ?? this.date,
        userEmail: userEmail ?? this.userEmail);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'orderId': orderId,
      'address': address,
      'productId': productId,
      'brand': brand,
      'name': name,
      'category': category,
      'subCategory': subCategory,
      'colors': colors,
      'description': description,
      'imageUrl': imageUrl,
      'isHotAndNew': isHotAndNew,
      'isTrending': isTrending,
      'isSummerCollection': isSummerCollection,
      'isNewArrival': isNewArrival,
      'isHotSales': isHotSales,
      'isPopularBrand': isPopularBrand,
      'price': price,
      'quantity': quantity,
      'productIndex': productIndex,
      'total': total,
      'date': date,
      'userEmail': userEmail
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
        orderId: map["orderId"],
        address: map['address'],
        userEmail: user?.email ?? "",
        productIndex: map['productIndex'],
        isPopularBrand: false,
        isNewArrival: false,
        isHotSales: false,
        quantity: map['quantity'],
        price: map['price'],
        total: map['total'],
        isSummerCollection: false,
        imageUrl: map['imageUrl'],
        isHotAndNew: false,
        isTrending: false,
        date: map['date'] as String,
        description: map['description'] as String,
        productId: map['productId'] as String,
        brand: map['brand'] as String,
        name: map['name'] as String,
        category: map['category'] as String,
        subCategory: map['subCategory'] as String,
        colors: List<dynamic>.from(
          (map['colors'] as List<dynamic>),
        ));
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) =>
      OrderModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      userEmail,
      productId,
      brand,
      name,
      category,
      subCategory,
      colors,
      description,
      imageUrl,
      isHotAndNew,
      isTrending,
      isSummerCollection,
      isNewArrival,
      isHotSales,
      isPopularBrand,
      price,
      quantity,
      productIndex,
      total,
      date,
    ];
  }
}
