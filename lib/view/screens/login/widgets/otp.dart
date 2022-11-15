import 'package:flutter/material.dart';

import 'package:pinput/pinput.dart';

class FilledRoundedPinPut extends StatelessWidget {
  FilledRoundedPinPut({Key? key}) : super(key: key);

  final controller = TextEditingController();
  final focusNode = FocusNode();

  // @override
  // void dispose() {

  //   super.dispose();
  // }

  bool showError = false;

  @override
  Widget build(BuildContext context) {
    const length = 4;
    const borderColor = Color.fromRGBO(114, 178, 238, 1);
    const errorColor = Color.fromRGBO(255, 234, 238, 1);
    const fillColor = Color.fromRGBO(222, 231, 240, .57);
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 60,
      textStyle: TextStyle(color: const Color.fromRGBO(30, 60, 87, 1)),
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.transparent),
      ),
    );

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "ENTER OTP",
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 68,
              child: Pinput(
                length: length,
                controller: controller,
                focusNode: focusNode,
                defaultPinTheme: defaultPinTheme,
                onCompleted: (pin) {},
                focusedPinTheme: defaultPinTheme.copyWith(
                  height: 68,
                  width: 64,
                  decoration: defaultPinTheme.decoration!.copyWith(
                    border: Border.all(color: borderColor),
                  ),
                ),
                errorPinTheme: defaultPinTheme.copyWith(
                  decoration: BoxDecoration(
                    color: errorColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
