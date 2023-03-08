import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../constants/constants.dart';
import '../../../styles/colors.dart';
import '../../../widget/custom_shadow_container.dart';

class ArrowShadowContainer extends StatelessWidget {
  const ArrowShadowContainer({Key? key,
  required this.icon,
  this.containerRaduis=15,
  this.offsetFirstValue=1.5,
  this.spreadRadius=3,
  this.blurRadius=9,
  this.offsetSecondValue=3,
  this.iconSize=30,
  this.iconInnerLeftPadding=10,
  this.iconInnerRighttPadding=0,
  this.iconColor=AppColor.lightGrey,
  this.width,
  this.height,
  required this.onPressed}) : super(key: key);

  final double containerRaduis;
  final double offsetFirstValue;
  final double offsetSecondValue;
  final double spreadRadius;
  final double blurRadius;
  final double iconSize;
  final double? width;
  final double? height;
  final IconData icon;
  final double iconInnerLeftPadding;
  final double iconInnerRighttPadding;
  final Color iconColor;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return CustomShadowContainer(
            containerRaduis: containerRaduis,
            offsetFirstValue: offsetFirstValue,
            spreadRadius: spreadRadius,
            blurRadius: blurRadius,
            offsetSecondValue:offsetSecondValue ,
            width: width,
            height: height,
            child: IconButton(
              icon: Padding(
                padding: EdgeInsets.only(left: elementWidth(elementWidth: iconInnerLeftPadding).w,right: iconInnerRighttPadding),
                child: Icon(
                  icon,
                  size: iconSize,
                  color: iconColor,
                ),
              ),
              onPressed:onPressed,
            ),
          );
  }
}