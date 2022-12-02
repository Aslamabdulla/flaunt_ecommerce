import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CurrentColorAndSizeWidget extends StatelessWidget {
  const CurrentColorAndSizeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(),
          Row(
            children: [
              Text("SIZE: "),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Color.fromRGBO(43, 154, 184, 1))),
                height: 35.h,
                width: 60.w,
                child: Center(
                  child: Text("Large"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
