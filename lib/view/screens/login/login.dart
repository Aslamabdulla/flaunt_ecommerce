import 'package:flaunt_ecommenrce/view/screens/login/widgets/contents.dart';
import 'package:flaunt_ecommenrce/view/screens/login/widgets/custom_paint.dart';

import 'package:flaunt_ecommenrce/view/screens/login/widgets/widgets.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            ClipPath(
              clipper: BackgroundClipper(),
              child: Container(
                height: height,
                width: width,
                decoration: customClipperBackground,
              ),
            ),
            ColumnWidget(
                height: height,
                width: width,
                emailController: emailController,
                passwordController: passwordController)
          ],
        ),
      ),
    );
  }
}
