import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flaunt_ecommenrce/view/screens/home_screen/widgets/widgets.dart';
import 'package:flutter/material.dart';

class NewWallWidget extends StatelessWidget {
  const NewWallWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: 150,
      child: ListView.separated(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          separatorBuilder: (context, index) => const SizedBox(
                height: 10,
                width: 10,
              ),
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  image: const DecorationImage(
                      image:
                          AssetImage("assets/images/backgroundnewarrival.png"),
                      fit: BoxFit.cover)),
              height: height / 4,
              width: width / 1.4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      kHeight5,
                      const Text(
                        "NEW\nARRIVALS",
                        style: TextStyle(fontSize: 20, color: kWhite),
                      ),
                      const Text(
                        "Fashion Nova",
                        style: TextStyle(fontSize: 10, color: kWhite),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text("Shop Now"),
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20))),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.purple),
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    height: height * .17,
                    width: width * .3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      image: DecorationImage(
                          image: AssetImage(newArrivalimages[index]),
                          fit: BoxFit.cover),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
