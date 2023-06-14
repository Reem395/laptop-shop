import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../constants/constants.dart';
import '../styles/colors.dart';

class CustomizedTitle extends StatelessWidget {
  const CustomizedTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: EdgeInsets.only(
          top: elementHeight(elementHeight: 23).h,
          left: elementWidth(elementWidth: 15).w,
        ),
        child: ClipRRect(
          borderRadius:
              const BorderRadius.only(bottomRight: Radius.circular(45)),
          child: Container(
              color: const Color.fromARGB(255, 249, 249, 249),
              child: Text(
                "Recomended\nfor You",
                style: TextStyle(fontSize: 19.sp, color: AppColor.customGrey),
              )),
        ),
      );
  }
}