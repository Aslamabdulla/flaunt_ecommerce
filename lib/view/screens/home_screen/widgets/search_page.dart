import 'package:flaunt_ecommenrce/view/screens/home_screen/widgets/search_form_field.dart';
import 'package:flaunt_ecommenrce/view/screens/home_screen/widgets/widgets.dart';
import 'package:flaunt_ecommenrce/view/screens/login/widgets/text_form_widget.dart';
import 'package:flaunt_ecommenrce/view/screens/login/widgets/widgets.dart';
import 'package:flaunt_ecommenrce/view/screens/product_view/widget/leading_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = ScreenUtil().screenHeight;
    TextEditingController searchController = TextEditingController();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: LeadingIconWidget()),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          ClipPath(
            clipper: ClipperPath(),
            child: Container(
              height: height / 1.7,
              decoration: customClipperBackground,
            ),
          ),
          SafeArea(
            child: SearchFormField(
                controller: searchController,
                hint: "SEARCH PRODUCTS",
                prefixIcon: Icons.search),
          )
        ],
      ),
    );
  }
}
