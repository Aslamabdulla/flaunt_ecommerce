// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flaunt_ecommenrce/services/firebase_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flaunt_ecommenrce/view/common/common.dart';

import 'package:flaunt_ecommenrce/view/screens/categories/widgets/head_offer_tile.dart';

class CategoriesUpperTile extends StatelessWidget {
  final String category;
  const CategoriesUpperTile({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      height: height / 3.2,
      width: width,
      child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: FirebaseDatabase.readHotsales(category.toUpperCase()),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              {
                return Text("Error Occured");
              }
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return CupertinoActivityIndicator();
            } else if (snapshot.data == null) {
              return Text("Empty data");
            } else {
              return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    return HeadTileCategories(
                      snapshot: snapshot,
                      category: category,
                      index: index,
                    );
                  });
            }
          }),
    );
  }
}
