import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
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

  ProductModel({
    required this.productId,
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
  });

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
    };
  }

  factory ProductModel.fromJson({
    required Map<String, dynamic> json,
  }) {
    return ProductModel(
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
    );
  }
}
