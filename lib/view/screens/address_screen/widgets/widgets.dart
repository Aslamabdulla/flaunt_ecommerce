import 'package:flutter/material.dart';

TextEditingController nameController = TextEditingController();
TextEditingController phoneController = TextEditingController();
TextEditingController addressController = TextEditingController();
TextEditingController cityController = TextEditingController();
TextEditingController stateController = TextEditingController();
TextEditingController pinCodeController = TextEditingController();

final List<TextEditingController> textFormController = [
  nameController,
  phoneController,
  addressController,
  cityController,
  stateController,
  pinCodeController,
];

final List<String> hintListAddress = [
  "Full Name",
  "Phone Number",
  "Address",
  "City",
  "State",
  "PinCode",
];
final List<IconData> iconsAddress = [
  Icons.person,
  Icons.smartphone,
  Icons.location_city,
  Icons.location_on,
  Icons.location_on,
  Icons.local_post_office,
];
