import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/constants/constants.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:sizer/sizer.dart';

import 'custom_shadow_container.dart';

class ExpansionCard extends StatelessWidget {
  const ExpansionCard({
    Key? key,
    required this.body,
    required this.title,
    this.childPadding,
    this.titleFontSize = 17,
    this.bodyFontSize = 15,
  }) : super(key: key);

  final String body;
  final String title;
  final double titleFontSize;
  final double bodyFontSize;

  final EdgeInsetsGeometry? childPadding;

  @override
  Widget build(BuildContext context) {
    return CustomShadowContainer(
        child: ExpansionTile(
          title: Text(
            title,
            style: TextStyle(
                color: AppColor.primary,
                fontSize: titleFontSize.sp,
                fontFamily: "Inter"),
          ),
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: elementWidth(elementWidth: 18).w,
                  right: elementWidth(elementWidth: 19).w,
                  bottom: elementHeight(elementHeight: 18).h),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  body,
                  style: TextStyle(fontSize: bodyFontSize.sp),
                ),
              ),
            ),
          ],
        ));
  }
}
