import 'package:carousel_slider/carousel_slider.dart';
import 'package:cart_stepper/cart_stepper.dart';
import 'package:counter_button/counter_button.dart';
import 'package:flaunt_ecommenrce/view/common/common.dart';
import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flaunt_ecommenrce/view/screens/login/widgets/custom_paint.dart';
import 'package:flaunt_ecommenrce/view/screens/login/widgets/widgets.dart';
import 'package:flaunt_ecommenrce/view/screens/product_view/widget/fav_button.dart';
import 'package:flaunt_ecommenrce/view/screens/product_view/widget/cart_widget.dart';
import 'package:flaunt_ecommenrce/view/screens/product_view/widget/colors_circle.dart';
import 'package:flaunt_ecommenrce/view/screens/product_view/widget/current_size_color.dart';
import 'package:flaunt_ecommenrce/view/screens/product_view/widget/back_btn.dart';
import 'package:flaunt_ecommenrce/view/screens/product_view/widget/image_widget.dart';
import 'package:flaunt_ecommenrce/view/screens/product_view/widget/title_widget.dart';
import 'package:flutter/material.dart';

class ProduductView extends StatelessWidget {
  const ProduductView({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          actions: [const BackButtonAppbar()],
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: const Padding(
            padding: EdgeInsets.only(left: 10),
            child: FavouriteButtonAppbar(),
          ),
        ),
        body: Stack(
          children: [
            ClipPath(
              clipper: BackgroundClipper(),
              child: Container(
                height: height,
                width: width,
                decoration: customClipperBackground,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 100),
              child: Column(
                children: [
                  kHeight25,
                  const ImageWidget(),
                  kHeight25,
                  const TitleWidget(),
                  kHeight15,
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                        "Levi’s denim will perfectly complement your image. this denim is suitable for both classic style  and for casual style."),
                  ),
                  kHeight20,
                  kHeight30,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text("Color"),
                      ],
                    ),
                  ),
                  kHeight15,
                  const ColorsCircleWidget(),
                  kHeight20,
                  const CurrentColorAndSizeWidget(),
                  kHeight25,
                  kHeight15,
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: const CountAndCartWidget(),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
