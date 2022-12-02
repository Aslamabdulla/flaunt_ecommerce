import 'package:flaunt_ecommenrce/view/common/common.dart';
import 'package:flaunt_ecommenrce/view/screens/home_screen/widgets/sample.dart';
import 'package:flaunt_ecommenrce/view/screens/home_screen/widgets/recommended_for_you.dart';
import 'package:flaunt_ecommenrce/view/screens/home_screen/widgets/trending_clothes.dart';
import 'package:flutter/material.dart';

import 'package:flaunt_ecommenrce/view/constants/constants.dart';

import 'package:flaunt_ecommenrce/view/screens/home_screen/widgets/chips.dart';
import 'package:flaunt_ecommenrce/view/common/discount_offers.dart';
import 'package:flaunt_ecommenrce/view/screens/home_screen/widgets/grid_view.dart';
import 'package:flaunt_ecommenrce/view/screens/home_screen/widgets/hot_sales_tiles.dart';
import 'package:flaunt_ecommenrce/view/screens/home_screen/widgets/middle_circle_categories.dart';
import 'package:flaunt_ecommenrce/view/screens/home_screen/widgets/most_popular.dart';
import 'package:flaunt_ecommenrce/view/screens/home_screen/widgets/new_arrival.dart';
import 'package:flaunt_ecommenrce/view/screens/home_screen/widgets/offer_tile.dart';
import 'package:flaunt_ecommenrce/view/screens/home_screen/widgets/recently_viewed.dart';
import 'package:flaunt_ecommenrce/view/screens/home_screen/widgets/row_widget.dart';
import 'package:flaunt_ecommenrce/view/screens/home_screen/widgets/top_categories.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClipperPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(
        size.width / 4, size.height, size.width / 2, size.height - 50);
    path.quadraticBezierTo(size.width - (size.width / 4), size.height - 100,
        size.width, size.height - 50);
    path.lineTo(size.width, size.height);
    // path.quadraticBezierTo(size.width / 2, size.height / 2 - 100, size.width,
    //     size.height / 2 - 200);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

/////////widgets//////
///
///
List<Widget> widgets = [
  kHeight10,
  CircleCategories(),
  kHeight15,
  const DiscountOffers(),
  Chips(),
  const RowWidget(
      text: "Hot Sales",
      top: 70,
      left: 10,
      fontSize: 18,
      mainAxis: MainAxisAlignment.spaceBetween),
  kHeight5,
  const HotSalesTiles(),
  const RowWidget(
      text: "Most Popular",
      top: 10,
      left: 10,
      fontSize: 18,
      mainAxis: MainAxisAlignment.spaceBetween),
  kHeight10,
  const GridMostpopular(),
  const RowWidget(
      text: "Recently Viewed",
      top: 10,
      left: 10,
      fontSize: 18,
      mainAxis: MainAxisAlignment.spaceBetween),
  kHeight10,
  const RecentlyViewedWidget(),
  kHeight10,
  // const TopCategories(),
  const OfferTile(image: "assets/images/offer.png"),
  RowWidget(
      text: "Trending Clothes",
      top: 0,
      left: 10,
      fontSize: 18.sp,
      mainAxis: MainAxisAlignment.spaceBetween),
  kHeight10,
  const TrendingClothes(),
  const RowWidget(
      text: "Summer Collection",
      top: 10,
      left: 10,
      fontSize: 18,
      mainAxis: MainAxisAlignment.spaceBetween),
  kHeight5,
  GridViewWidget(imagesList: gridCategories),
  const RowWidget(
      text: "Recommended For You",
      top: 0,
      left: 10,
      fontSize: 18,
      mainAxis: MainAxisAlignment.spaceBetween),
  kHeight10,
  const RecommendedForYou(),
  kHeight10,
  const OfferTile(image: "assets/images/offer2.png"),
  const RowWidget(
      text: "New Arrivals",
      top: 10,
      left: 10,
      fontSize: 18,
      mainAxis: MainAxisAlignment.spaceBetween),
  kHeight10,
  const NewWallWidget(),
  kHeight10,
];

//////images/////
///

List<String> newArrivalimages = [
  "assets/images/newarrivalimage1.png",
  "assets/images/newArrival.png",
  "assets/images/newarrival2.png",
  "assets/images/newarrival3.png",
  "assets/images/newarrival4.png",
];

List<String> Accesoriesimages = [
  "assets/images/products/accessories/macbook.png",
  "assets/images/products/accessories/headset.png",
  "assets/images/products/accessories/huewaibluetooth.png",
  "assets/images/products/accessories/hplaptop.png",
  "assets/images/products/accessories/alexa.png",
  "assets/images/products/accessories/wiredconnector.png",
  "assets/images/products/accessories/headsetsony.png",
  "assets/images/products/accessories/macbook.png"
];
List<String> circleImages = [
  "assets/images/products/circle/1 (1).jpg",
  "assets/images/products/circle/1 (2).jpg",
  "assets/images/products/circle/1 (5).jpg",
  "assets/images/products/circle/1 (4).jpg",
  "assets/images/products/circle/1 (3).jpg",
  "assets/images/products/circle/1 (6).jpg",
  "assets/images/products/circle/1 (7).jpg",
  "assets/images/products/circle/1 (8).jpg",
];

//////decoration///

final glassDecoration = BoxDecoration(
    image: const DecorationImage(
        image: AssetImage("assets/images/noise.png"),
        fit: BoxFit.cover,
        opacity: .07),
    border: Border.all(width: 1, color: Colors.white30),
    borderRadius: BorderRadius.circular(20),
    gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomCenter,
        colors: [Colors.white60, Colors.white12]));
final glassDecorationCart = BoxDecoration(
    image: const DecorationImage(
        image: AssetImage("assets/images/noise.png"),
        fit: BoxFit.cover,
        opacity: .07),
    border: Border.all(width: 1, color: Colors.white30),
    borderRadius: BorderRadius.circular(20),
    gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomCenter,
        colors: [Colors.white60, Colors.white12]));
glassDecorationCustom(Color color1, Color color2) {
  return BoxDecoration(
      image: const DecorationImage(
          image: AssetImage("assets/images/noise.png"),
          fit: BoxFit.cover,
          opacity: .07),
      border: Border.all(width: 1, color: Colors.white30),
      borderRadius: BorderRadius.circular(20),
      gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomCenter,
          colors: [color1, color2]));
}

final glassDecorationGrid = BoxDecoration(
    image: const DecorationImage(
        image: AssetImage("assets/images/noise.png"),
        fit: BoxFit.cover,
        opacity: .07),
    border: Border.all(width: 1, color: Colors.white30),
    borderRadius: BorderRadius.circular(20),
    gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomCenter,
        colors: [Colors.white, Colors.white60]));
