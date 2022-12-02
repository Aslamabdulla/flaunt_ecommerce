import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flaunt_ecommenrce/view/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return AnimSearchBar(
        closeSearchOnSuffixTap: true,
        prefixIcon: const Icon(
          Icons.search,
          color: kBlack,
        ),
        suffixIcon: const Icon(
          Icons.search,
          color: kBlack,
        ),
        width: 274.w,
        textController: textEditingController,
        onSuffixTap: () {});
  }
}
