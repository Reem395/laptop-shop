import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:sizer/sizer.dart';

import '../../../../constants/constants.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: elementHeight(elementHeight: 22).h,
          left: elementHeight(elementHeight: 20).w),
      child: Stack(alignment: AlignmentDirectional.bottomStart, children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              "assets/images/acer_header.png",
              width: elementWidth(elementWidth: 369).w,
            )),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: elementWidth(elementWidth: 12).w,
                  bottom: elementHeight(elementHeight: 9).h),
              child: Text(
                "New Release\nAcer Predator Helios 300",
                style: TextStyle(
                    fontSize: 11.sp,
                    fontFamily: "Inter",
                    color: AppColor.white),
              ),
            ),
          ],
        )
      ]),
    );
  }
}
