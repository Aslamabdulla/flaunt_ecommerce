// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';

// import 'package:equatable/equatable.dart';

// class CartItemModel extends Equatable {
//   String id = "id";
//   String imageUrl = "image";
//   String name = "name";
//   String quantity = "quantity";
//   String color = "color";
//   String price = "price";
//   String productId = "productId";
//   String category = "category";
//   String subCategory = "subcategory";
//   String brand = "brand";
//   CartItemModel({
//     required this.id,
//     required this.imageUrl,
//     required this.name,
//     required this.quantity,
//     required this.color,
//     required this.price,
//     required this.productId,
//     required this.category,
//     required this.subCategory,
//     required this.brand,
//   });

//   CartItemModel copyWith({
//     String? id,
//     String? imageUrl,
//     String? name,
//     String? quantity,
//     String? color,
//     String? price,
//     String? productId,
//     String? category,
//     String? subCategory,
//     String? brand,
//   }) {
//     return CartItemModel(
//       id: id ?? this.id,
//       imageUrl: imageUrl ?? this.imageUrl,
//       name: name ?? this.name,
//       quantity: quantity ?? this.quantity,
//       color: color ?? this.color,
//       price: price ?? this.price,
//       productId: productId ?? this.productId,
//       category: category ?? this.category,
//       subCategory: subCategory ?? this.subCategory,
//       brand: brand ?? this.brand,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'id': id,
//       'imageUrl': imageUrl,
//       'name': name,
//       'quantity': quantity,
//       'color': color,
//       'price': price,
//       'productId': productId,
//       'category': category,
//       'subCategory': subCategory,
//       'brand': brand,
//     };
//   }

//   factory CartItemModel.fromMap(Map<String, dynamic> map) {
//     return CartItemModel(
//       id: map['id'] as String,
//       imageUrl: map['imageUrl'] as String,
//       name: map['name'] as String,
//       quantity: map['quantity'] as String,
//       color: map['color'] as String,
//       price: map['price'] as String,
//       productId: map['productId'] as String,
//       category: map['category'] as String,
//       subCategory: map['subCategory'] as String,
//       brand: map['brand'] as String,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory CartItemModel.fromJson(String source) =>
//       CartItemModel.fromMap(json.decode(source) as Map<String, dynamic>);

//   @override
//   bool get stringify => true;

//   @override
//   List<Object> get props {
//     return [
//       id,
//       imageUrl,
//       name,
//       quantity,
//       color,
//       price,
//       productId,
//       category,
//       subCategory,
//       brand,
//     ];
//   }
// }
