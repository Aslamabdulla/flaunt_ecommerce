// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';

class TextFormWidget extends StatelessWidget {
  const TextFormWidget({
    Key? key,
    required this.forgotBtn,
    required this.controller,
    required this.hint,
    required this.prefixIcon,
  }) : super(key: key);
  final bool forgotBtn;
  final TextEditingController controller;
  final String hint;
  final IconData prefixIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 50, right: 50, bottom: 10),
      child: Column(
        children: [
          TextFormField(
            controller: controller,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 5),
                prefixIcon: Icon(
                  prefixIcon,
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(30)),
                filled: true,
                fillColor: Colors.grey.withOpacity(.15),
                hintText: hint,
                hintStyle: TextStyle(fontSize: 12, height: 0)),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                forgotBtn
                    ? const Text(
                        "Forgot password",
                        style: TextStyle(color: Colors.blue, fontSize: 10),
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
