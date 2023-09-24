import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/constants/constants.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/rounded_image.dart';
import 'package:sizer/sizer.dart';

import '../../../widget/custom_shadow_container.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({
    Key? key,
    required this.image,
    required this.tabTitle,
    this.onTap,
    this.backgroundColor = AppColor.white,
  }) : super(key: key);

  final String image;
  final String tabTitle;
  final Color? backgroundColor;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {


    return InkWell(
      onTap: onTap,
      child: CustomShadowContainer(
        width: elementWidth(elementWidth: tabTitle=="All"?130:tabTitle =="Acer"?153:165).w,
        backgroundColor: backgroundColor,
        spreadRadius: 3,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: elementHeight(elementHeight: 6).h,
                  bottom: elementHeight(elementHeight: 6).h,
                  left: elementWidth(elementWidth: 10).w),
              child: RoundedImage(
                image: image,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                    right: elementWidth(elementWidth: 22).w,
                    left: elementWidth(elementWidth: 5).w,
                    ),
                child: Text(tabTitle,overflow: TextOverflow.ellipsis,
                    style:
                        const TextStyle( fontSize: 18)),
              ),
            ),
          ],
        ),
        containerRaduis: 30,
      ),
    );
  }
}
