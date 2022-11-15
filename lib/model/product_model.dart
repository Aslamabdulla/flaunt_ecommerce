// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

List<String> colors = ["[F5A127]"];

class Product extends Equatable {
  final String productId;
  final String brand;
  final String name;
  final String category;
  final String subCategory;
  final List<String> colors;
  final String description;
  final List<dynamic> imageUrl;
  final bool isHotAndNew;
  final bool isTrending;
  final bool isSummerCollection;
  final bool isNewArrival;
  final bool isHotSales;
  final bool isPopularBrands;
  String price;
  String quantity;
  Product({
    required this.productId,
    required this.brand,
    required this.name,
    required this.category,
    required this.colors,
    required this.description,
    required this.imageUrl,
    required this.isHotAndNew,
    required this.isTrending,
    required this.isSummerCollection,
    required this.isNewArrival,
    required this.isHotSales,
    required this.isPopularBrands,
    required this.subCategory,
    this.price = "0",
    this.quantity = "0",
  });

  @override
  // TODO: implement props
  List<Object?> get props {
    return [
      productId,
      brand,
      name,
      category,
      colors,
      description,
      imageUrl,
      isHotAndNew,
      isTrending,
      isSummerCollection,
      isNewArrival,
      isHotSales,
      isPopularBrands,
      price,
      quantity,
      subCategory,
    ];
  }

  Product copyWith(
      {String? productId,
      String? brand,
      String? name,
      String? category,
      List<String>? colors,
      String? description,
      List<dynamic>? imageUrl,
      bool? isHotAndNew,
      bool? isTrending,
      bool? isSummerCollection,
      bool? isNewArrival,
      bool? isHotSales,
      bool? isPopularBrands,
      String? price,
      String? subCategory,
      String? quantity}) {
    return Product(
        subCategory: subCategory ?? this.subCategory,
        productId: productId ?? this.productId,
        brand: brand ?? this.brand,
        name: name ?? this.name,
        category: category ?? this.category,
        colors: colors ?? this.colors,
        description: description ?? this.description,
        imageUrl: imageUrl ?? this.imageUrl,
        isHotAndNew: isHotAndNew ?? this.isHotAndNew,
        isTrending: isTrending ?? this.isTrending,
        isSummerCollection: isSummerCollection ?? this.isSummerCollection,
        isNewArrival: isNewArrival ?? this.isNewArrival,
        isHotSales: isHotSales ?? this.isHotSales,
        isPopularBrands: isPopularBrands ?? this.isPopularBrands,
        price: price ?? this.price,
        quantity: quantity ?? this.quantity);
  }

  Map<String, dynamic> toMap() {
    return {
      'subCategory': subCategory,
      'productId': productId,
      'name': name,
      'brand': brand,
      'category': category,
      'colors': colors,
      'description': description,
      'imageUrl': imageUrl,
      'isHotAndNew': isHotAndNew,
      'isTrending': isTrending,
      'isSummerCollection': isSummerCollection,
      'isNewArrival': isNewArrival,
      'isHotSales': isHotSales,
      'isPopularBrand': isPopularBrands,
      'price': price,
      'quantity': quantity,
    };
  }

  factory Product.fromSnapshot(DocumentSnapshot snap) {
    return Product(
      subCategory: snap['subCategory'],
      productId: snap['productId'],
      brand: snap['brand'],
      name: snap['name'],
      category: snap['category'],
      colors: snap['colors'],
      description: snap['description'],
      imageUrl: snap['imageUrl'],
      isHotAndNew: snap['isHotAndNew'],
      isTrending: snap['isTrending'],
      isSummerCollection: snap['isSummerCollection'],
      isNewArrival: snap['isNewArrival'],
      isHotSales: snap['isHotSales'],
      isPopularBrands: snap['isPopularBrands'],
      price: snap['price'],
      quantity: snap['quantity'],
    );
  }

  String toJson() => json.encode(toMap());

  // factory Product.fromJson(String source) =>
  //     Product.fromSnapshot(json.decode(source));

  @override
  bool get stringify => true;

  // static List<Product> products = [
  //   Product(
  //     productId: 1,
  //     brand: "Adidas",
  //     name: "Tsirt",
  //     category: "Male",
  //     colors: ["F5A127", "F5A127"],
  //     description: "Sporty Tshirt that comes in different color",
  //     imageUrl: [
  //       "https://png.pngtree.com/png-vector/20191120/ourmid/pngtree-cosmetic-serum-pipette-bottle-package-png-image_2009766.jpg",
  //       "https://png.pngtree.com/png-vector/20191120/ourmid/pngtree-cosmetic-serum-pipette-bottle-package-png-image_2009766.jpg"
  //     ],
  //     isHotAndNew: false,
  //     isTrending: false,
  //     isSummerCollection: false,
  //     isNewArrival: false,
  //     isHotSales: false,
  //     isPopularBrands: false,
  //     price: 950,
  //     quantity: 10,
  //   ),
  //   Product(
  //     productId: 2,
  //     brand: "Puma",
  //     name: "Shirt",
  //     category: "Female",
  //     colors: ["F5A127", "F5A177"],
  //     description: "Sporty Shirt that comes in different color",
  //     imageUrl: [
  //       "https://png.pngtree.com/png-vector/20191120/ourmid/pngtree-cosmetic-serum-pipette-bottle-package-png-image_2009766.jpg",
  //       "https://png.pngtree.com/png-vector/20191120/ourmid/pngtree-cosmetic-serum-pipette-bottle-package-png-image_2009766.jpg",
  //       "https://png.pngtree.com/png-vector/20191120/ourmid/pngtree-cosmetic-serum-pipette-bottle-package-png-image_2009766.jpg",
  //       "https://png.pngtree.com/png-vector/20191120/ourmid/pngtree-cosmetic-serum-pipette-bottle-package-png-image_2009766.jpg"
  //     ],
  //     isHotAndNew: false,
  //     isTrending: false,
  //     isSummerCollection: false,
  //     isNewArrival: false,
  //     isHotSales: false,
  //     isPopularBrands: false,
  //     price: 1050,
  //     quantity: 5,
  //   ),
  //   Product(
  //     productId: 2,
  //     brand: "Puma",
  //     name: "Shirt",
  //     category: "Female",
  //     colors: ["F5A127", "F5A127"],
  //     description: "Sporty Tshirt that comes in different color",
  //     imageUrl: [
  //       "https://png.pngtree.com/png-vector/20191120/ourmid/pngtree-cosmetic-serum-pipette-bottle-package-png-image_2009766.jpg",
  //       "https://png.pngtree.com/png-vector/20191120/ourmid/pngtree-cosmetic-serum-pipette-bottle-package-png-image_2009766.jpg",
  //       "https://png.pngtree.com/png-vector/20191120/ourmid/pngtree-cosmetic-serum-pipette-bottle-package-png-image_2009766.jpg",
  //       "https://png.pngtree.com/png-vector/20191120/ourmid/pngtree-cosmetic-serum-pipette-bottle-package-png-image_2009766.jpg"
  //     ],
  //     isHotAndNew: false,
  //     isTrending: false,
  //     isSummerCollection: false,
  //     isNewArrival: false,
  //     isHotSales: false,
  //     isPopularBrands: false,
  //     price: 1850,
  //     quantity: 15,
  //   ),
  //   Product(
  //     productId: 2,
  //     brand: "Nike",
  //     name: "Churidar",
  //     category: "Female",
  //     colors: ["F5A627", "F5A127"],
  //     description: "Sporty Dress that comes in different color",
  //     imageUrl: [
  //       "https://png.pngtree.com/png-vector/20191120/ourmid/pngtree-cosmetic-serum-pipette-bottle-package-png-image_2009766.jpg",
  //       "https://png.pngtree.com/png-vector/20191120/ourmid/pngtree-cosmetic-serum-pipette-bottle-package-png-image_2009766.jpg",
  //       "https://png.pngtree.com/png-vector/20191120/ourmid/pngtree-cosmetic-serum-pipette-bottle-package-png-image_2009766.jpg",
  //       "https://png.pngtree.com/png-vector/20191120/ourmid/pngtree-cosmetic-serum-pipette-bottle-package-png-image_2009766.jpg"
  //     ],
  //     isHotAndNew: false,
  //     isTrending: false,
  //     isSummerCollection: false,
  //     isNewArrival: false,
  //     isHotSales: false,
  //     isPopularBrands: false,
  //     price: 2050,
  //     quantity: 12,
  //   ),
  // ];
}
