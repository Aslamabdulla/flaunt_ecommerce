import 'package:flaunt_ecommenrce/view/screens/product_view/widget/product_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({
    Key? key,
    required this.height,
    required this.width,
    required this.imageUrl,
  }) : super(key: key);

  final double height;
  final double width;
  final List imageUrl;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: const EdgeInsets.only(top: 0),
        height: height / 1.8,
        width: width,
        child: CarouselSlider.builder(
          unlimitedMode: true,
          slideTransform: const CubeTransform(),
          slideIndicator: CircularSlideIndicator(
              padding: EdgeInsets.only(bottom: height * .065)),
          slideBuilder: (index) {
            return ProductImageWidget(
              imageUrl: imageUrl,
              index: index,
            );
          },
          itemCount: 3,
        ),
      ),
    );
  }
}
