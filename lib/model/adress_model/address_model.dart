// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AddressModel {
  String name;
  String phone;
  String address;
  String city;
  String state;
  String pincode;
  AddressModel({
    required this.name,
    required this.phone,
    required this.address,
    required this.city,
    required this.state,
    required this.pincode,
  });

  AddressModel copyWith({
    String? name,
    String? phone,
    String? address,
    String? city,
    String? state,
    String? pincode,
  }) {
    return AddressModel(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      city: city ?? this.city,
      state: state ?? this.state,
      pincode: pincode ?? this.pincode,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'phone': phone,
      'address': address,
      'city': city,
      'state': state,
      'pincode': pincode,
    };
  }

  factory AddressModel.fromMap({required Map<String, dynamic> map}) {
    return AddressModel(
      name: map['name'] as String,
      phone: map['phone'] as String,
      address: map['address'] as String,
      city: map['city'] as String,
      state: map['state'] as String,
      pincode: map['pincode'] as String,
    );
  }
}
