import 'package:flaunt_ecommenrce/view/common/common.dart';
import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flutter/material.dart';

class DiscountOffers extends StatelessWidget {
  const DiscountOffers({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: height * .18,
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        separatorBuilder: (context, index) => SizedBox(
          height: 10,
          width: 10,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (context, index) => Container(
          padding: const EdgeInsets.only(left: 20, top: 15),
          height: height * .09,
          width: width / 1.4,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(offerCategories[index]), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(20),
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
              "Get up to 30% off\nUsing Flaunt Pay",
              style: TextStyle(
                  fontSize: 22, color: kWhite, fontWeight: FontWeight.w500),
            ),
            ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Shop now",
                  style: TextStyle(color: kBlack),
                ),
                style: buttonStyleoffer)
          ]),
        ),
      ),
    );
  }
}
