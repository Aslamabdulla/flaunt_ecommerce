// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class SearchModel extends Equatable {
  String brand;
  String name;
  String category;
  String subCategory;
  SearchModel({
    required this.brand,
    required this.name,
    required this.category,
    required this.subCategory,
  });

  SearchModel copyWith({
    String? brand,
    String? name,
    String? category,
    String? subCategory,
  }) {
    return SearchModel(
      brand: brand ?? this.brand,
      name: name ?? this.name,
      category: category ?? this.category,
      subCategory: subCategory ?? this.subCategory,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'brand': brand,
      'name': name,
      'category': category,
      'subCategory': subCategory,
    };
  }

  factory SearchModel.fromMap(Map<String, dynamic> map) {
    return SearchModel(
      brand: map['brand'] as String,
      name: map['name'] as String,
      category: map['category'] as String,
      subCategory: map['subCategory'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SearchModel.fromJson(String source) =>
      SearchModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [brand, name, category, subCategory];
}
