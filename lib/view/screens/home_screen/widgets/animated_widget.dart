import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flaunt_ecommenrce/dependency/dependency.dart';
import 'package:flaunt_ecommenrce/model/product_model/product_model.dart';
import 'package:flaunt_ecommenrce/services/firebase_services.dart';
import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flaunt_ecommenrce/view/screens/home_screen/widgets/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AnimatedSearchWidget extends StatelessWidget {
  const AnimatedSearchWidget({
    Key? key,
    required this.width,
    required this.textEditingController,
  }) : super(key: key);

  final double width;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    // return AnimSearchBar(
    //     prefixIcon: const Icon(
    //       Icons.search,
    //       color: kBlack,
    //     ),
    //     suffixIcon: const Icon(
    //       Icons.search,
    //       color: kBlack,
    //     ),
    //     width: 274.w,
    //     textController: textEditingController,
    //     onSuffixTap: () async {

    //       // List<List<Product>> productList = [];
    //       // var result = FirebaseFirestore.instance
    //       //     .collection('AllProducts')
    //       //     .where('name',
    //       //         isGreaterThanOrEqualTo:
    //       //             textEditingController.value.text.trim())
    //       //     .get();
    //       // print(result);
    //       // var product = result.then((value) =>
    //       //     value.docs.map((e) => Product.fromSnapshot(e)).toList());
    //       // var produc = product.then((value) => productList.add(value));
    //       // print(productList.length);
    //       // print(textEditingController.value.text);

    //       // dataController.menCategory();
    //       // FirebaseDatabase.searchFromFirebase(textEditingController.value.text);
    //       // showSearch(
    //       //     context: context,
    //       //     delegate: CustomSearchDelegate(),
    //       //     query: textEditingController.value.text);
    //     });
    return CircleAvatar(
        backgroundColor: kWhite,
        child: IconButton(
            onPressed: () {
              Get.to(() => SearchScreen(),
                  transition: Transition.rightToLeft,
                  duration: Duration(milliseconds: 400));
            },
            icon: Icon(
              Icons.search,
              color: kBlack,
            )));
  }
}

class CustomSearchDelegate extends SearchDelegate {
  List sample = [];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back_ios));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    print(query);
    List<String> mathQuery = [];
    return ListView.separated(
        itemBuilder: (context, index) {
          print(query);
          return SizedBox();
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 10,
          );
        },
        itemCount: mathQuery.length);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    print(query);
    List<String> mathQuery = [];
    return ListView.separated(
        itemBuilder: (context, index) {
          return SizedBox();
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 10,
          );
        },
        itemCount: mathQuery.length);
  }
}
