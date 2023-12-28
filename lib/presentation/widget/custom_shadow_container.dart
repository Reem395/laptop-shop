import 'package:flutter/material.dart';

import '../styles/colors.dart';

class CustomShadowContainer extends StatelessWidget {
  const CustomShadowContainer({
    Key? key,
    required this.child,
    this.containerRaduis = 10,
    this.blurRadius = 8,
    this.spreadRadius = 5,
    this.offsetFirstValue = 0,
    this.offsetSecondValue = 3,
    this.backgroundColor = AppColor.white,
    // this.backgroundColor,
    this.shadowColor = AppColor.black,
    this.shadowColorOpacity = 0.25,
    this.height,
    this.width,
  }) : super(key: key);

  final Widget child;

  final double containerRaduis;
  final double blurRadius;
  final double? height;
  final double? width;
  final double spreadRadius;
  final double offsetFirstValue;
  final double offsetSecondValue;
  final double shadowColorOpacity;
  final Color shadowColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(containerRaduis)),
          color: backgroundColor,
          boxShadow: [
            BoxShadow(
                blurRadius: blurRadius,
                offset: Offset(offsetFirstValue, offsetSecondValue),
                color: shadowColor.withOpacity(shadowColorOpacity),
                spreadRadius: spreadRadius)
          ]),
      child: child,
    );
  }
}
