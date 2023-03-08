import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../constants/constants.dart';
import '../../../widget/custom_shadow_container.dart';

class ProductImagesList extends StatelessWidget {
  const ProductImagesList({Key? key,
   required this.image,
    required this.itemCount}) : super(key: key);

  final String image;
  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: elementHeight(elementHeight: 108).h,
      child: ListView.builder(
          clipBehavior: Clip.hardEdge,
          padding: EdgeInsets.only(left: elementWidth(elementWidth: 20).w),
          scrollDirection: Axis.horizontal,
          itemCount: itemCount,
          itemBuilder: ((context, index) {
            return Padding(
              padding: EdgeInsets.only(right: elementWidth(elementWidth: 20).w),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.5),
                child: CustomShadowContainer(
                    spreadRadius: 3,
                    blurRadius: 3,
                    offsetFirstValue: 0,
                    offsetSecondValue: 1.5,
                    containerRaduis: 20,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: elementHeight(elementHeight: 23).h,
                          horizontal: elementWidth(elementWidth: 15).w),
                      child: Image.asset("assets/images/$image"),
                    )),
              ),
            );
          })),
    );
  }
}
