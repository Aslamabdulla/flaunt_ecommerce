// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flaunt_ecommenrce/controller/bottom_controller/bottom_controller.dart';
import 'package:flaunt_ecommenrce/dependency/dependency.dart';
import 'package:flaunt_ecommenrce/model/product_model/product_model.dart';
import 'package:flaunt_ecommenrce/services/firebase_services.dart';
import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SearchFormField extends StatelessWidget {
  SearchFormField({
    Key? key,
    required this.controller,
    required this.hint,
    required this.prefixIcon,
  }) : super(key: key);

  TextEditingController controller;
  final String hint;
  final IconData prefixIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 40, bottom: 10).r,
      child: GetBuilder<BottomController>(
          init: BottomController(),
          builder: (btmController) {
            return Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                TextFormField(
                  // controller: controller,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 5),
                      prefixIcon: Icon(
                        prefixIcon,
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(30).r),
                      filled: true,
                      fillColor: kWhite,
                      hintText: hint,
                      hintStyle: TextStyle(fontSize: 12.sp, height: 0)),
                  onChanged: (value) {
                    btmController.search(value);
                    print(value);
                  },
                ),
                Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Text(btmController.products[index].name),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 10,
                          );
                        },
                        itemCount: btmController.products.length))
              ],
            );
          }),
    );
  }
}
