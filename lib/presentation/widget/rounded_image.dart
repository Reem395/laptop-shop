import 'package:flutter/material.dart';

import '../styles/colors.dart';

class RoundedImage extends StatelessWidget {
  const RoundedImage({
    Key? key,
    required this.image,
    this.shadowColor = AppColor.lightGrey,
    this.blurRadius = 10,
    this.backGroundRadius = 25,
    this.spreadRadius = 0.5,
  }) : super(key: key);

  final Color shadowColor;
  final double blurRadius;
  final double backGroundRadius;
  final double spreadRadius;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColor.white,
        boxShadow: [
          BoxShadow(
              blurRadius: blurRadius,
              color: shadowColor,
              spreadRadius: spreadRadius)
        ],
      ),
      child: CircleAvatar(
        radius: backGroundRadius,
        backgroundColor: AppColor.white,
        child: Image.asset(
          "assets/images/$image",
        ),
      ),
    );
  }
}
