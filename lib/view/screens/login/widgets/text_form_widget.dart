// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flaunt_ecommenrce/dependency/dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TextFormWidget extends StatelessWidget {
  TextFormWidget({
    Key? key,
    required this.forgotBtn,
    required this.controller,
    required this.hint,
    required this.prefixIcon,
    required this.isObscure,
  }) : super(key: key);
  final bool forgotBtn;
  RxString controller;
  final String hint;
  final IconData prefixIcon;
  final bool isObscure;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 50, right: 50, bottom: 10).r,
      child: Column(
        children: [
          TextFormField(
            obscureText: isObscure,
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
                fillColor: Colors.grey.withOpacity(.15),
                hintText: hint,
                hintStyle: TextStyle(fontSize: 12.sp, height: 0)),
            onChanged: (value) {
              controller.value = value;
              loginController.update();
              print(controller);
            },
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 15,
            ).r,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                forgotBtn
                    ? Text(
                        "Forgot password",
                        style: TextStyle(color: Colors.blue, fontSize: 10.sp),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
